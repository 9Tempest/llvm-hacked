//===-- Tests for mtx_t operations ----------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/threads/mtx_destroy.h"
#include "src/threads/mtx_init.h"
#include "src/threads/mtx_lock.h"
#include "src/threads/mtx_unlock.h"
#include "src/threads/thrd_create.h"
#include "src/threads/thrd_join.h"

#include "test/IntegrationTest/test.h"

#include <threads.h>

constexpr int START = 0;
constexpr int MAX = 10000;

mtx_t mutex;
static int shared_int = START;

int counter(void *arg) {
  int last_count = START;
  while (true) {
    LIBC_NAMESPACE::mtx_lock(&mutex);
    if (shared_int == last_count + 1) {
      shared_int++;
      last_count = shared_int;
    }
    LIBC_NAMESPACE::mtx_unlock(&mutex);
    if (last_count >= MAX)
      break;
  }
  return 0;
}

void relay_counter() {
  ASSERT_EQ(LIBC_NAMESPACE::mtx_init(&mutex, mtx_plain),
            static_cast<int>(thrd_success));

  // The idea of this test is that two competing threads will update
  // a counter only if the other thread has updated it.
  thrd_t thread;
  LIBC_NAMESPACE::thrd_create(&thread, counter, nullptr);

  int last_count = START;
  while (true) {
    ASSERT_EQ(LIBC_NAMESPACE::mtx_lock(&mutex), static_cast<int>(thrd_success));
    if (shared_int == START) {
      ++shared_int;
      last_count = shared_int;
    } else if (shared_int != last_count) {
      ASSERT_EQ(shared_int, last_count + 1);
      ++shared_int;
      last_count = shared_int;
    }
    ASSERT_EQ(LIBC_NAMESPACE::mtx_unlock(&mutex),
              static_cast<int>(thrd_success));
    if (last_count > MAX)
      break;
  }

  int retval = 123;
  LIBC_NAMESPACE::thrd_join(thread, &retval);
  ASSERT_EQ(retval, 0);

  LIBC_NAMESPACE::mtx_destroy(&mutex);
}

mtx_t start_lock, step_lock;
bool started, step;

int stepper(void *arg) {
  LIBC_NAMESPACE::mtx_lock(&start_lock);
  started = true;
  LIBC_NAMESPACE::mtx_unlock(&start_lock);

  LIBC_NAMESPACE::mtx_lock(&step_lock);
  step = true;
  LIBC_NAMESPACE::mtx_unlock(&step_lock);
  return 0;
}

void wait_and_step() {
  ASSERT_EQ(LIBC_NAMESPACE::mtx_init(&start_lock, mtx_plain),
            static_cast<int>(thrd_success));
  ASSERT_EQ(LIBC_NAMESPACE::mtx_init(&step_lock, mtx_plain),
            static_cast<int>(thrd_success));

  // In this test, we start a new thread but block it before it can make a
  // step. Once we ensure that the thread is blocked, we unblock it.
  // After unblocking, we then verify that the thread was indeed unblocked.
  step = false;
  started = false;
  ASSERT_EQ(LIBC_NAMESPACE::mtx_lock(&step_lock),
            static_cast<int>(thrd_success));

  thrd_t thread;
  LIBC_NAMESPACE::thrd_create(&thread, stepper, nullptr);

  while (true) {
    // Make sure the thread actually started.
    ASSERT_EQ(LIBC_NAMESPACE::mtx_lock(&start_lock),
              static_cast<int>(thrd_success));
    bool s = started;
    ASSERT_EQ(LIBC_NAMESPACE::mtx_unlock(&start_lock),
              static_cast<int>(thrd_success));
    if (s)
      break;
  }

  // Since |step_lock| is still locked, |step| should be false.
  ASSERT_FALSE(step);

  // Unlock the step lock and wait until the step is made.
  ASSERT_EQ(LIBC_NAMESPACE::mtx_unlock(&step_lock),
            static_cast<int>(thrd_success));

  while (true) {
    ASSERT_EQ(LIBC_NAMESPACE::mtx_lock(&step_lock),
              static_cast<int>(thrd_success));
    bool current_step_value = step;
    ASSERT_EQ(LIBC_NAMESPACE::mtx_unlock(&step_lock),
              static_cast<int>(thrd_success));
    if (current_step_value)
      break;
  }

  int retval = 123;
  LIBC_NAMESPACE::thrd_join(thread, &retval);
  ASSERT_EQ(retval, 0);

  LIBC_NAMESPACE::mtx_destroy(&start_lock);
  LIBC_NAMESPACE::mtx_destroy(&step_lock);
}

static constexpr int THREAD_COUNT = 10;
static mtx_t multiple_waiter_lock;
static mtx_t counter_lock;
static int wait_count = 0;

int waiter_func(void *) {
  LIBC_NAMESPACE::mtx_lock(&counter_lock);
  ++wait_count;
  LIBC_NAMESPACE::mtx_unlock(&counter_lock);

  // Block on the waiter lock until the main
  // thread unblocks.
  LIBC_NAMESPACE::mtx_lock(&multiple_waiter_lock);
  LIBC_NAMESPACE::mtx_unlock(&multiple_waiter_lock);

  LIBC_NAMESPACE::mtx_lock(&counter_lock);
  --wait_count;
  LIBC_NAMESPACE::mtx_unlock(&counter_lock);

  return 0;
}

void multiple_waiters() {
  LIBC_NAMESPACE::mtx_init(&multiple_waiter_lock, mtx_plain);
  LIBC_NAMESPACE::mtx_init(&counter_lock, mtx_plain);

  LIBC_NAMESPACE::mtx_lock(&multiple_waiter_lock);
  thrd_t waiters[THREAD_COUNT];
  for (int i = 0; i < THREAD_COUNT; ++i) {
    LIBC_NAMESPACE::thrd_create(waiters + i, waiter_func, nullptr);
  }

  // Spin until the counter is incremented to the desired
  // value.
  while (true) {
    LIBC_NAMESPACE::mtx_lock(&counter_lock);
    if (wait_count == THREAD_COUNT) {
      LIBC_NAMESPACE::mtx_unlock(&counter_lock);
      break;
    }
    LIBC_NAMESPACE::mtx_unlock(&counter_lock);
  }

  LIBC_NAMESPACE::mtx_unlock(&multiple_waiter_lock);

  int retval;
  for (int i = 0; i < THREAD_COUNT; ++i) {
    LIBC_NAMESPACE::thrd_join(waiters[i], &retval);
  }

  ASSERT_EQ(wait_count, 0);

  LIBC_NAMESPACE::mtx_destroy(&multiple_waiter_lock);
  LIBC_NAMESPACE::mtx_destroy(&counter_lock);
}

TEST_MAIN() {
  relay_counter();
  wait_and_step();
  multiple_waiters();
  return 0;
}
