;RUN: opt < %s -passes=loop-vectorize,instcombine -force-vector-width=4 -force-vector-interleave=1 -S | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

;; Check consecutive memory access without preceding GEP instruction

;  for (int i=0; i<len; i++) {
;    *to++ = *from++;
;  }

; CHECK-LABEL: @consecutive_no_gep(
; CHECK: vector.body
; CHECK: %[[index:.*]] = phi i64 [ 0, %vector.ph ]
; CHECK: %[[offset:.*]] = shl i64 %[[index]], 2
; CHECK: getelementptr i8, ptr %{{.*}}, i64 %[[offset]]
; CHECK: load <4 x float>

define void @consecutive_no_gep(ptr noalias nocapture readonly %from, ptr noalias nocapture %to, i32 %len) #0 {
entry:
  %cmp2 = icmp sgt i32 %len, 0
  br i1 %cmp2, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.05 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %from.addr.04 = phi ptr [ %incdec.ptr, %for.body ], [ %from, %for.body.preheader ]
  %to.addr.03 = phi ptr [ %incdec.ptr1, %for.body ], [ %to, %for.body.preheader ]
  %incdec.ptr = getelementptr inbounds float, ptr %from.addr.04, i64 1
  %val = load float, ptr %from.addr.04, align 4
  %incdec.ptr1 = getelementptr inbounds float, ptr %to.addr.03, i64 1
  store float %val, ptr %to.addr.03, align 4
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %len
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}
