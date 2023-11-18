; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx | FileCheck %s

define <4 x i32> @test1(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vandps %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %r = select <4 x i1> %f, <4 x i32> %c, <4 x i32> zeroinitializer
  ret <4 x i32> %r
}

define <4 x i32> @test2(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vorps %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %r = select <4 x i1> %f, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32> %c
  ret <4 x i32> %r
}

define <4 x i32> @test3(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vandps %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %r = select <4 x i1> %f, <4 x i32> zeroinitializer, <4 x i32> %c
  ret <4 x i32> %r
}

define <4 x i32> @test4(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vorps %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %r = select <4 x i1> %f, <4 x i32> %c, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %r
}

define <4 x i32> @test5(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %r = sext <4 x i1> %f to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @test6(<4 x float> %a, <4 x float> %b, <4 x i32> %c) {
; CHECK-LABEL: test6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    retq
  %not.f = fcmp oge <4 x float> %a, %b
  %r = sext <4 x i1> %not.f to <4 x i32>
  ret <4 x i32> %r
}

define <4 x i32> @test7(<4 x float> %a, <4 x float> %b, ptr %p) {
; CHECK-LABEL: test7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnleps %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vandps (%rdi), %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ult <4 x float> %a, %b
  %l = load <4 x i32>, ptr %p, align 16
  %r = select <4 x i1> %f, <4 x i32> %l, <4 x i32> zeroinitializer
  ret <4 x i32> %r
}

; Repeat all with FP types for the select operands. Also, use different comparison predicates for better test coverage.

define <2 x double> @test1f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test1f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpltpd %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vandpd %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ogt <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> %c, <2 x double> zeroinitializer
  ret <2 x double> %r
}

define <2 x double> @test2f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test2f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmplepd %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vorpd %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp oge <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> <double 0xffffffffffffffff, double 0xffffffffffffffff>, <2 x double> %c
  ret <2 x double> %r
}

define <2 x double> @test3f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test3f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnltpd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vandpd %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp olt <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> zeroinitializer, <2 x double> %c
  ret <2 x double> %r
}

define <2 x double> @test4f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test4f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnlepd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vorpd %xmm2, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ole <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> %c, <2 x double> <double 0xffffffffffffffff, double 0xffffffffffffffff>
  ret <2 x double> %r
}

define <2 x double> @test5f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test5f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpnlepd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ugt <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> <double 0xffffffffffffffff, double 0xffffffffffffffff>, <2 x double> zeroinitializer
  ret <2 x double> %r
}

define <2 x double> @test6f(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test6f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpltpd %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp ule <2 x double> %a, %b
  %r = select <2 x i1> %f, <2 x double> zeroinitializer, <2 x double> <double 0xffffffffffffffff, double 0xffffffffffffffff>
  ret <2 x double> %r
}

define <2 x double> @test7f(<2 x double> %a, <2 x double> %b, ptr %p) {
; CHECK-LABEL: test7f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vcmpeqpd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vandpd (%rdi), %xmm0, %xmm0
; CHECK-NEXT:    retq
  %f = fcmp oeq <2 x double> %a, %b
  %l = load <2 x double>, ptr %p, align 16
  %r = select <2 x i1> %f, <2 x double> %l, <2 x double> zeroinitializer
  ret <2 x double> %r
}

define i1 @and(i32 %x, i32 %y, i32 %z, i32 %w) {
; CHECK-LABEL: and:
; CHECK:       # %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    sete %sil
; CHECK-NEXT:    cmpl %ecx, %edx
; CHECK-NEXT:    setg %al
; CHECK-NEXT:    andb %sil, %al
; CHECK-NEXT:    retq
  %a = icmp eq i32 %x, %y
  %b = icmp sgt i32 %z, %w
  %s = select i1 %a, i1 %b, i1 false
  ret i1 %s
}

define i1 @or(i32 %x, i32 %y, i32 %z, i32 %w) {
; CHECK-LABEL: or:
; CHECK:       # %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    sete %sil
; CHECK-NEXT:    cmpl %ecx, %edx
; CHECK-NEXT:    setg %al
; CHECK-NEXT:    orb %sil, %al
; CHECK-NEXT:    retq
  %a = icmp eq i32 %x, %y
  %b = icmp sgt i32 %z, %w
  %s = select i1 %a, i1 true, i1 %b
  ret i1 %s
}

define i1 @and_not(i32 %x, i32 %y, i32 %z, i32 %w) {
; CHECK-LABEL: and_not:
; CHECK:       # %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    setne %sil
; CHECK-NEXT:    cmpl %ecx, %edx
; CHECK-NEXT:    setg %al
; CHECK-NEXT:    andb %sil, %al
; CHECK-NEXT:    retq
  %a = icmp eq i32 %x, %y
  %b = icmp sgt i32 %z, %w
  %s = select i1 %a, i1 false, i1 %b
  ret i1 %s
}

define i1 @or_not(i32 %x, i32 %y, i32 %z, i32 %w) {
; CHECK-LABEL: or_not:
; CHECK:       # %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    setne %sil
; CHECK-NEXT:    cmpl %ecx, %edx
; CHECK-NEXT:    setg %al
; CHECK-NEXT:    orb %sil, %al
; CHECK-NEXT:    retq
  %a = icmp eq i32 %x, %y
  %b = icmp sgt i32 %z, %w
  %s = select i1 %a, i1 %b, i1 true
  ret i1 %s
}

define <4 x i1> @and_vec(<4 x i32> %x, <4 x i32> %y, <4 x i32> %z, <4 x i32> %w) {
; CHECK-LABEL: and_vec:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vpcmpgtd %xmm3, %xmm2, %xmm1
; CHECK-NEXT:    vpand %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %a = icmp eq <4 x i32> %x, %y
  %b = icmp sgt <4 x i32> %z, %w
  %s = select <4 x i1> %a, <4 x i1> %b, <4 x i1> zeroinitializer
  ret <4 x i1> %s
}

define <4 x i1> @or_vec(<4 x i32> %x, <4 x i32> %y, <4 x i32> %z, <4 x i32> %w) {
; CHECK-LABEL: or_vec:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vpcmpgtd %xmm3, %xmm2, %xmm1
; CHECK-NEXT:    vpor %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %a = icmp eq <4 x i32> %x, %y
  %b = icmp sgt <4 x i32> %z, %w
  %s = select <4 x i1> %a, <4 x i1> <i1 1, i1 1, i1 1, i1 1>, <4 x i1> %b
  ret <4 x i1> %s
}

define <4 x i1> @and_not_vec(<4 x i32> %x, <4 x i32> %y, <4 x i32> %z, <4 x i32> %w) {
; CHECK-LABEL: and_not_vec:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vpcmpgtd %xmm3, %xmm2, %xmm1
; CHECK-NEXT:    vpandn %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %a = icmp eq <4 x i32> %x, %y
  %b = icmp sgt <4 x i32> %z, %w
  %s = select <4 x i1> %a, <4 x i1> zeroinitializer, <4 x i1> %b
  ret <4 x i1> %s
}

define <4 x i1> @or_not_vec(<4 x i32> %x, <4 x i32> %y, <4 x i32> %z, <4 x i32> %w) {
; CHECK-LABEL: or_not_vec:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vpcmpeqd %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpxor %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    vpcmpgtd %xmm3, %xmm2, %xmm1
; CHECK-NEXT:    vpor %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    retq
  %a = icmp eq <4 x i32> %x, %y
  %b = icmp sgt <4 x i32> %z, %w
  %s = select <4 x i1> %a, <4 x i1> %b, <4 x i1> <i1 1, i1 1, i1 1, i1 1>
  ret <4 x i1> %s
}