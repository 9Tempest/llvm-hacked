; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zfh,+zvfh,+v -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+d,+zfh,+zvfh,+v -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define <4 x half> @shuffle_v4f16(<4 x half> %x, <4 x half> %y) {
; CHECK-LABEL: shuffle_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v0, 11
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %s = shufflevector <4 x half> %x, <4 x half> %y, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  ret <4 x half> %s
}

define <8 x float> @shuffle_v8f32(<8 x float> %x, <8 x float> %y) {
; CHECK-LABEL: shuffle_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a0, 236
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vmv.s.x v0, a0
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> %y, <8 x i32> <i32 8, i32 9, i32 2, i32 3, i32 12, i32 5, i32 6, i32 7>
  ret <8 x float> %s
}

define <4 x double> @shuffle_fv_v4f64(<4 x double> %x) {
; CHECK-LABEL: shuffle_fv_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI2_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI2_0)(a0)
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v0, 9
; CHECK-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; CHECK-NEXT:    vfmerge.vfm v8, v8, fa5, v0
; CHECK-NEXT:    ret
  %s = shufflevector <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x double> %x, <4 x i32> <i32 0, i32 5, i32 6, i32 3>
  ret <4 x double> %s
}

define <4 x double> @shuffle_vf_v4f64(<4 x double> %x) {
; CHECK-LABEL: shuffle_vf_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI3_0)
; CHECK-NEXT:    fld fa5, %lo(.LCPI3_0)(a0)
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v0, 6
; CHECK-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; CHECK-NEXT:    vfmerge.vfm v8, v8, fa5, v0
; CHECK-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x i32> <i32 0, i32 5, i32 6, i32 3>
  ret <4 x double> %s
}

define <4 x double> @vrgather_permute_shuffle_vu_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_permute_shuffle_vu_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a0, 4096
; RV32-NEXT:    addi a0, a0, 513
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.s.x v10, a0
; RV32-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; RV32-NEXT:    vsext.vf2 v12, v10
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_permute_shuffle_vu_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, 4096
; RV64-NEXT:    addiw a0, a0, 513
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.s.x v10, a0
; RV64-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; RV64-NEXT:    vsext.vf2 v12, v10
; RV64-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; RV64-NEXT:    vrgatherei16.vv v10, v8, v12
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> poison, <4 x i32> <i32 1, i32 2, i32 0, i32 1>
  ret <4 x double> %s
}

define <4 x double> @vrgather_permute_shuffle_uv_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_permute_shuffle_uv_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a0, 4096
; RV32-NEXT:    addi a0, a0, 513
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.s.x v10, a0
; RV32-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; RV32-NEXT:    vsext.vf2 v12, v10
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_permute_shuffle_uv_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, 4096
; RV64-NEXT:    addiw a0, a0, 513
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.s.x v10, a0
; RV64-NEXT:    vsetvli zero, zero, e16, mf2, ta, ma
; RV64-NEXT:    vsext.vf2 v12, v10
; RV64-NEXT:    vsetvli zero, zero, e64, m2, ta, ma
; RV64-NEXT:    vrgatherei16.vv v10, v8, v12
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> poison, <4 x double> %x, <4 x i32> <i32 5, i32 6, i32 4, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_vv_v4f64(<4 x double> %x, <4 x double> %y) {
; CHECK-LABEL: vrgather_shuffle_vv_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI6_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI6_0)
; CHECK-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; CHECK-NEXT:    vle16.v v14, (a0)
; CHECK-NEXT:    vrgatherei16.vv v12, v8, v14
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v0, 8
; CHECK-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; CHECK-NEXT:    vrgather.vi v12, v10, 1, v0.t
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> %y, <4 x i32> <i32 1, i32 2, i32 0, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_xv_v4f64(<4 x double> %x) {
; CHECK-LABEL: vrgather_shuffle_xv_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vid.v v12
; CHECK-NEXT:    lui a0, %hi(.LCPI7_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI7_0)
; CHECK-NEXT:    vlse64.v v10, (a0), zero
; CHECK-NEXT:    vrsub.vi v12, v12, 4
; CHECK-NEXT:    vmv.v.i v0, 12
; CHECK-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; CHECK-NEXT:    vrgatherei16.vv v10, v8, v12, v0.t
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
  %s = shufflevector <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x double> %x, <4 x i32> <i32 0, i32 3, i32 6, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_vx_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_shuffle_vx_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; RV32-NEXT:    vid.v v12
; RV32-NEXT:    li a0, 3
; RV32-NEXT:    lui a1, %hi(.LCPI8_0)
; RV32-NEXT:    addi a1, a1, %lo(.LCPI8_0)
; RV32-NEXT:    vlse64.v v10, (a1), zero
; RV32-NEXT:    vmul.vx v12, v12, a0
; RV32-NEXT:    vmv.v.i v0, 3
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12, v0.t
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_shuffle_vx_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; RV64-NEXT:    vid.v v12
; RV64-NEXT:    lui a0, %hi(.LCPI8_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI8_0)
; RV64-NEXT:    vlse64.v v10, (a0), zero
; RV64-NEXT:    li a0, 3
; RV64-NEXT:    vmul.vx v12, v12, a0
; RV64-NEXT:    vmv.v.i v0, 3
; RV64-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV64-NEXT:    vrgatherei16.vv v10, v8, v12, v0.t
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x i32> <i32 0, i32 3, i32 6, i32 5>
  ret <4 x double> %s
}

define <4 x half> @shuffle_v8f16_to_vslidedown_1(<8 x half> %x) {
; CHECK-LABEL: shuffle_v8f16_to_vslidedown_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 1
; CHECK-NEXT:    ret
entry:
  %s = shufflevector <8 x half> %x, <8 x half> poison, <4 x i32> <i32 1, i32 2, i32 3, i32 4>
  ret <4 x half> %s
}

define <4 x half> @shuffle_v8f16_to_vslidedown_3(<8 x half> %x) {
; CHECK-LABEL: shuffle_v8f16_to_vslidedown_3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 3
; CHECK-NEXT:    ret
entry:
  %s = shufflevector <8 x half> %x, <8 x half> poison, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x half> %s
}

define <2 x float> @shuffle_v4f32_to_vslidedown(<4 x float> %x) {
; CHECK-LABEL: shuffle_v4f32_to_vslidedown:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 1
; CHECK-NEXT:    ret
entry:
  %s = shufflevector <4 x float> %x, <4 x float> poison, <2 x i32> <i32 1, i32 2>
  ret <2 x float> %s
}

define <4 x half> @slidedown_v4f16(<4 x half> %x) {
; CHECK-LABEL: slidedown_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 1
; CHECK-NEXT:    ret
  %s = shufflevector <4 x half> %x, <4 x half> poison, <4 x i32> <i32 1, i32 2, i32 3, i32 undef>
  ret <4 x half> %s
}

define <8 x float> @slidedown_v8f32(<8 x float> %x) {
; CHECK-LABEL: slidedown_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 3
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> poison, <8 x i32> <i32 3, i32 undef, i32 5, i32 6, i32 undef, i32 undef, i32 undef, i32 undef>
  ret <8 x float> %s
}

define <4 x half> @slideup_v4f16(<4 x half> %x) {
; CHECK-LABEL: slideup_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vslideup.vi v9, v8, 1
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
  %s = shufflevector <4 x half> %x, <4 x half> poison, <4 x i32> <i32 undef, i32 0, i32 1, i32 2>
  ret <4 x half> %s
}

define <8 x float> @slideup_v8f32(<8 x float> %x) {
; CHECK-LABEL: slideup_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslideup.vi v10, v8, 3
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> poison, <8 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 1, i32 2, i32 3, i32 4>
  ret <8 x float> %s
}

define <8 x float> @splice_unary(<8 x float> %x) {
; CHECK-LABEL: splice_unary:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslidedown.vi v10, v8, 1
; CHECK-NEXT:    vslideup.vi v10, v8, 7
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> poison, <8 x i32> <i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 0>
  ret <8 x float> %s
}

define <8 x double> @splice_unary2(<8 x double> %x) {
; CHECK-LABEL: splice_unary2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e64, m4, ta, ma
; CHECK-NEXT:    vslidedown.vi v12, v8, 6
; CHECK-NEXT:    vslideup.vi v12, v8, 2
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
  %s = shufflevector <8 x double> %x, <8 x double> poison, <8 x i32> <i32 6, i32 7, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5>
  ret <8 x double> %s
}

define <8 x float> @splice_binary(<8 x float> %x, <8 x float> %y) {
; CHECK-LABEL: splice_binary:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslidedown.vi v8, v8, 2
; CHECK-NEXT:    vslideup.vi v8, v10, 6
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> %y, <8 x i32> <i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 undef, i32 9>
  ret <8 x float> %s
}

define <8 x double> @splice_binary2(<8 x double> %x, <8 x double> %y) {
; CHECK-LABEL: splice_binary2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e64, m4, ta, ma
; CHECK-NEXT:    vslidedown.vi v12, v12, 5
; CHECK-NEXT:    vslideup.vi v12, v8, 3
; CHECK-NEXT:    vmv.v.v v8, v12
; CHECK-NEXT:    ret
  %s = shufflevector <8 x double> %x, <8 x double> %y, <8 x i32> <i32 13, i32 14, i32 15, i32 0, i32 1, i32 2, i32 3, i32 4>
  ret <8 x double> %s
}