; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=powerpc64le-unknown-linux-gnu -mcpu=pwr9 -verify-machineinstrs | FileCheck %s --check-prefixes=CHECK,V01,CHECK-V0
; RUN: llc < %s -mtriple=powerpc64-unknown-linux-gnu -mcpu=pwr9 -verify-machineinstrs | FileCheck %s --check-prefixes=CHECK,V01,CHECK-V1
; RUN: llc < %s -mtriple=powerpc64le-unknown-linux-gnu -mcpu=pwr8 -verify-machineinstrs | FileCheck %s --check-prefixes=CHECK,V23,CHECK-V2
; RUN: llc < %s -mtriple=powerpc64-unknown-linux-gnu -mcpu=pwr8 -verify-machineinstrs | FileCheck %s --check-prefixes=CHECK,V23,CHECK-V3

; Function Attrs: norecurse nounwind readonly
define signext i32 @limit_loop(i32 signext %iters, ptr nocapture readonly %vec, i32 signext %limit) local_unnamed_addr {
; CHECK-LABEL: limit_loop:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    mr 6, 3
; CHECK-NEXT:    li 3, 0
; CHECK-NEXT:    cmpwi 6, 0
; CHECK-NEXT:    blelr 0
; CHECK-NEXT:  # %bb.1: # %for.body.preheader
; CHECK-NEXT:    mtctr 6
; CHECK-NEXT:    addi 4, 4, -4
; CHECK-NEXT:    b .LBB0_3
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB0_2: # %for.cond
; CHECK-NEXT:    #
; CHECK-NEXT:    bdzlr
; CHECK-NEXT:  .LBB0_3: # %for.body
; CHECK-NEXT:    #
; CHECK-NEXT:    lwzu 6, 4(4)
; CHECK-NEXT:    cmpw 6, 5
; CHECK-NEXT:    blt 0, .LBB0_2
; CHECK-NEXT:  # %bb.4:
; CHECK-NEXT:    li 3, 1
; CHECK-NEXT:    blr
entry:
  %cmp5 = icmp sgt i32 %iters, 0
  br i1 %cmp5, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %iters to i64
  br label %for.body

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %cleanup

for.body:                                         ; preds = %for.body.preheader, %for.cond
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.cond ]
  %arrayidx = getelementptr inbounds i32, ptr %vec, i64 %indvars.iv
  %1 = load i32, ptr %arrayidx, align 4
  %cmp1 = icmp slt i32 %1, %limit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %cleanup

cleanup:                                          ; preds = %for.body, %for.cond, %entry
  %2 = phi i32 [ 0, %entry ], [ 0, %for.cond ], [ 1, %for.body ]
  ret i32 %2
}


;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; CHECK-V0: {{.*}}
; CHECK-V1: {{.*}}
; CHECK-V2: {{.*}}
; CHECK-V3: {{.*}}
; V01: {{.*}}
; V23: {{.*}}