// RUN: %check_clang_tidy %s portability-restrict-system-includes %t \
// RUN:     -- -config="{CheckOptions: {portability-restrict-system-includes.Includes: '-*,std*.h'}}" \
// RUN:     -- -isystem %S/Inputs/restrict-system-includes/system

// Test glob functionality: disallow all headers except those that match
// pattern "std*.h".

#include <stddef.h>
#include <stdint.h>
#include <float.h>
// CHECK-MESSAGES: :[[@LINE-1]]:1: warning: system include float.h not allowed
