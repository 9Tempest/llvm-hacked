; RUN: opt -mtriple=armv7 -mcpu=cortex-a57 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-NOUNROLL
; RUN: opt -mtriple=thumbv7 -mcpu=cortex-a57 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-NOUNROLL
; RUN: opt -mtriple=thumbv7 -mcpu=cortex-a72 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-NOUNROLL
; RUN: opt -mtriple=thumbv8m -mcpu=cortex-m23 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-UNROLL
; RUN: opt -mtriple=thumbv8m.main -mcpu=cortex-m33 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-UNROLL
; RUN: opt -mtriple=thumbv7em -mcpu=cortex-m7 -passes=loop-unroll -S %s -o - | FileCheck %s --check-prefix=CHECK-UNROLL

; CHECK-LABEL: partial
define arm_aapcs_vfpcc void @partial(ptr nocapture %C, ptr nocapture readonly %A, ptr nocapture readonly %B) local_unnamed_addr #0 {
entry:
  br label %for.body

; CHECK-LABEL: for.body
for.body:

; CHECK-NOUNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, %entry ], [ [[IV2:%[a-z.0-9]+]], %for.body ]
; CHECK-NOUNROLL: [[IV1:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 1
; CHECK-NOUNROLL: [[IV2]] = add nuw nsw i32 [[IV0]], 2
; CHECK-NOUNROLL: [[CMP:%[a-z.0-9]+]] = icmp eq i32 [[IV2]], 1024
; CHECK-NOUNROLL: br i1 [[CMP]], label [[END:%[a-z.]+]], label %for.body

; CHECK-UNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, %entry ], [ [[IV16:%[a-z.0-9]+]], %for.body ]
; CHECK-UNROLL: [[IV1:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 1
; CHECK-UNROLL: [[IV2:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 2
; CHECK-UNROLL: [[IV3:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 3
; CHECK-UNROLL: [[IV4:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 4
; CHECK-UNROLL: [[IV5:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 5
; CHECK-UNROLL: [[IV6:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 6
; CHECK-UNROLL: [[IV7:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 7
; CHECK-UNROLL: [[IV8:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 8
; CHECK-UNROLL: [[IV9:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 9
; CHECK-UNROLL: [[IV10:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 10
; CHECK-UNROLL: [[IV11:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 11
; CHECK-UNROLL: [[IV12:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 12
; CHECK-UNROLL: [[IV13:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 13
; CHECK-UNROLL: [[IV14:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 14
; CHECK-UNROLL: [[IV15:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 15
; CHECK-UNROLL: [[IV16]] = add nuw nsw i32 [[IV0]], 16
; CHECK-UNROLL: [[CMP:%[a-z.0-9]+]] = icmp eq i32 [[IV16]], 1024
; CHECK-UNROLL: br i1 [[CMP]], label [[END:%[a-z.]+]], label %for.body

  %i.08 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %A, i32 %i.08
  %0 = load i32, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, ptr %B, i32 %i.08
  %1 = load i32, ptr %arrayidx1, align 4
  %mul = mul nsw i32 %1, %0
  %arrayidx2 = getelementptr inbounds i32, ptr %C, i32 %i.08
  store i32 %mul, ptr %arrayidx2, align 4
  %inc = add nuw nsw i32 %i.08, 1
  %exitcond = icmp eq i32 %inc, 1024
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

for.cond.cleanup:
  ret void
}

; CHECK-LABEL: runtime
define arm_aapcs_vfpcc void @runtime(ptr nocapture %C, ptr nocapture readonly %A, ptr nocapture readonly %B, i32 %N) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp eq i32 %N, 0
  br i1 %cmp8, label %for.cond.cleanup, label %for.body

; CHECK-LABEL: for.body
for.body:
; CHECK-NOUNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, [[PRE:%[a-z.0-9]+]] ], [ [[IV2:%[a-z.0-9]+]], %for.body ]
; CHECK-NOUNROLL: [[IV1:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 1
; CHECK-NOUNROLL: [[IV2]] = add nuw i32 [[IV0]], 2
; CHECK-NOUNROLL: br

; CHECK-UNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, [[PRE:%[a-z.0-9]+]] ], [ [[IV4:%[a-z.0-9]+]], %for.body ]
; CHECK-UNROLL: [[IV1:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 1
; CHECK-UNROLL: [[IV2:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 2
; CHECK-UNROLL: [[IV3:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 3
; CHECK-UNROLL: [[IV4]] = add nuw i32 [[IV0]], 4
; CHECK-UNROLL: br

; CHECK-UNROLL: for.body.epil:
; CHECK-UNROLL: for.body.epil.1:
; CHECK-UNROLL: for.body.epil.2:

  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, ptr %A, i32 %i.09
  %0 = load i32, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, ptr %B, i32 %i.09
  %1 = load i32, ptr %arrayidx1, align 4
  %mul = mul nsw i32 %1, %0
  %arrayidx2 = getelementptr inbounds i32, ptr %C, i32 %i.09
  store i32 %mul, ptr %arrayidx2, align 4
  %inc = add nuw i32 %i.09, 1
  %exitcond = icmp eq i32 %inc, %N
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

for.cond.cleanup:
  ret void
}

; CHECK-LABEL: nested_runtime
define arm_aapcs_vfpcc void @nested_runtime(ptr nocapture %C, ptr nocapture readonly %A, ptr nocapture readonly %B, i32 %N) local_unnamed_addr #0 {
entry:
  %cmp25 = icmp eq i32 %N, 0
  br i1 %cmp25, label %for.cond.cleanup, label %for.body4.lr.ph

for.body4.lr.ph:
  %h.026 = phi i32 [ %inc11, %for.cond.cleanup3 ], [ 0, %entry ]
  %mul = mul i32 %h.026, %N
  br label %for.body4

for.cond.cleanup:
  ret void

for.cond.cleanup3:
  %inc11 = add nuw i32 %h.026, 1
  %exitcond27 = icmp eq i32 %inc11, %N
  br i1 %exitcond27, label %for.cond.cleanup, label %for.body4.lr.ph

; CHECK-LABEL: for.body4
for.body4:
; CHECK-NOUNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, [[PRE:%[a-z0-9.]+]] ], [ [[IV1:%[a-z.0-9]+]], %for.body4 ]
; CHECK-NOUNROLL: [[IV1]] = add nuw i32 [[IV0]], 1
; CHECK-NOUNROLL: br

; CHECK-UNROLL: for.body4.epil:
; CHECK-UNROLL: for.body4.epil.1:
; CHECK-UNROLL: for.body4.epil.2:
; CHECK-UNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, [[PRE:%[a-z0-9.]+]] ], [ [[IV4:%[a-z.0-9]+]], %for.body4 ]
; CHECK-UNROLL: [[IV1:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 1
; CHECK-UNROLL: [[IV2:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 2
; CHECK-UNROLL: [[IV3:%[a-z.0-9]+]] = add nuw nsw i32 [[IV0]], 3
; CHECK-UNROLL: [[IV4]] = add nuw i32 [[IV0]], 4
; CHECK-UNROLL: br

  %w.024 = phi i32 [ 0, %for.body4.lr.ph ], [ %inc, %for.body4 ]
  %add = add i32 %w.024, %mul
  %arrayidx = getelementptr inbounds i16, ptr %A, i32 %add
  %0 = load i16, ptr %arrayidx, align 2
  %conv = sext i16 %0 to i32
  %arrayidx5 = getelementptr inbounds i16, ptr %B, i32 %w.024
  %1 = load i16, ptr %arrayidx5, align 2
  %conv6 = sext i16 %1 to i32
  %mul7 = mul nsw i32 %conv6, %conv
  %arrayidx8 = getelementptr inbounds i32, ptr %C, i32 %w.024
  %2 = load i32, ptr %arrayidx8, align 4
  %add9 = add nsw i32 %mul7, %2
  store i32 %add9, ptr %arrayidx8, align 4
  %inc = add nuw i32 %w.024, 1
  %exitcond = icmp eq i32 %inc, %N
  br i1 %exitcond, label %for.cond.cleanup3, label %for.body4
}

; CHECK-LABEL: loop_call
define arm_aapcs_vfpcc void @loop_call(ptr nocapture %C, ptr nocapture readonly %A, ptr nocapture readonly %B) local_unnamed_addr #1 {
entry:
  br label %for.body

for.cond.cleanup:
  ret void

; CHECK-LABEL: for.body
for.body:
; CHECK-NOUNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, %entry ], [ [[IV1:%[a-z.0-9]+]], %for.body ]
; CHECK-NOUNROLL: [[IV1]] = add nuw nsw i32 [[IV0]], 1
; CHECK-NOUNROLL: icmp eq i32 [[IV1]], 1024
; CHECK-NOUNROLL: br

; CHECK-UNROLL: [[IV0:%[a-z.0-9]+]] = phi i32 [ 0, %entry ], [ [[IV1:%[a-z.0-9]+]], %for.body ]
; CHECK-UNROLL: [[IV1]] = add nuw nsw i32 [[IV0]], 1
; CHECK-UNROLL: icmp eq i32 [[IV1]], 1024
; CHECK-UNROLL: br

  %i.08 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %A, i32 %i.08
  %0 = load i32, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, ptr %B, i32 %i.08
  %1 = load i32, ptr %arrayidx1, align 4
  %call = tail call arm_aapcs_vfpcc i32 @some_func(i32 %0, i32 %1) #3
  %arrayidx2 = getelementptr inbounds i32, ptr %C, i32 %i.08
  store i32 %call, ptr %arrayidx2, align 4
  %inc = add nuw nsw i32 %i.08, 1
  %exitcond = icmp eq i32 %inc, 1024
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

; CHECK-LABEL: iterate_inc
; CHECK-NOUNROLL: %n.addr.04 = phi ptr [ %1, %while.body ], [ %n, %while.body.preheader ]
; CHECK-NOUNROLL: %tobool = icmp eq ptr %1, null
; CHECK-NOUNROLL: br i1 %tobool
; CHECK-NOUNROLL-NOT: load

; CHECK-UNROLL: [[CMP0:%[a-z.0-9]+]] = icmp eq ptr [[VAR0:%[a-z.0-9]+]], null
; CHECK-UNROLL: br i1 [[CMP0]], label [[END:%[a-z.0-9]+]]
; CHECK-UNROLL: [[CMP1:%[a-z.0-9]+]] = icmp eq ptr [[VAR1:%[a-z.0-9]+]], null
; CHECK-UNROLL: br i1 [[CMP1]], label [[END]]
; CHECK-UNROLL: [[CMP2:%[a-z.0-9]+]] = icmp eq ptr [[VAR2:%[a-z.0-9]+]], null
; CHECK-UNROLL: br i1 [[CMP2]], label [[END]]
; CHECK-UNROLL: [[CMP3:%[a-z.0-9]+]] = icmp eq ptr [[VAR3:%[a-z.0-9]+]], null
; CHECK-UNROLL: br i1 [[CMP3]], label [[END]]
; CHECK-UNROLL: [[CMP4:%[a-z.0-9]+]] = icmp eq ptr [[VAR4:%[a-z.0-9]+]], null
; CHECK-UNROLL: br i1 [[CMP4]], label [[END]]
; CHECK-UNROLL-NOT: load

%struct.Node = type { ptr, i32 }

define arm_aapcscc void @iterate_inc(ptr %n) local_unnamed_addr #0 {
entry:
  %tobool3 = icmp eq ptr %n, null
  br i1 %tobool3, label %while.end, label %while.body.preheader

while.body.preheader:
  br label %while.body

while.body:
  %n.addr.04 = phi ptr [ %1, %while.body ], [ %n, %while.body.preheader ]
  %val = getelementptr inbounds %struct.Node, ptr %n.addr.04, i32 0, i32 1
  %0 = load i32, ptr %val, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, ptr %val, align 4
  %1 = load ptr, ptr %n.addr.04, align 4
  %tobool = icmp eq ptr %1, null
  br i1 %tobool, label %while.end, label %while.body

while.end:
  ret void
}

declare arm_aapcs_vfpcc i32 @some_func(i32, i32) local_unnamed_addr #2
