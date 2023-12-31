; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

declare <32 x i8> @llvm.loongarch.lasx.xvssrlrni.b.h(<32 x i8>, <32 x i8>, i32)

define <32 x i8> @lasx_xvssrlrni_b_h(<32 x i8> %va, <32 x i8> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_b_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.b.h $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvssrlrni.b.h(<32 x i8> %va, <32 x i8> %vb, i32 1)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvssrlrni.h.w(<16 x i16>, <16 x i16>, i32)

define <16 x i16> @lasx_xvssrlrni_h_w(<16 x i16> %va, <16 x i16> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_h_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.h.w $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvssrlrni.h.w(<16 x i16> %va, <16 x i16> %vb, i32 1)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvssrlrni.w.d(<8 x i32>, <8 x i32>, i32)

define <8 x i32> @lasx_xvssrlrni_w_d(<8 x i32> %va, <8 x i32> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_w_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.w.d $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvssrlrni.w.d(<8 x i32> %va, <8 x i32> %vb, i32 1)
  ret <8 x i32> %res
}

declare <4 x i64> @llvm.loongarch.lasx.xvssrlrni.d.q(<4 x i64>, <4 x i64>, i32)

define <4 x i64> @lasx_xvssrlrni_d_q(<4 x i64> %va, <4 x i64> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_d_q:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.d.q $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i64> @llvm.loongarch.lasx.xvssrlrni.d.q(<4 x i64> %va, <4 x i64> %vb, i32 1)
  ret <4 x i64> %res
}

declare <32 x i8> @llvm.loongarch.lasx.xvssrlrni.bu.h(<32 x i8>, <32 x i8>, i32)

define <32 x i8> @lasx_xvssrlrni_bu_h(<32 x i8> %va, <32 x i8> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_bu_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.bu.h $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvssrlrni.bu.h(<32 x i8> %va, <32 x i8> %vb, i32 1)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvssrlrni.hu.w(<16 x i16>, <16 x i16>, i32)

define <16 x i16> @lasx_xvssrlrni_hu_w(<16 x i16> %va, <16 x i16> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_hu_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.hu.w $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvssrlrni.hu.w(<16 x i16> %va, <16 x i16> %vb, i32 1)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvssrlrni.wu.d(<8 x i32>, <8 x i32>, i32)

define <8 x i32> @lasx_xvssrlrni_wu_d(<8 x i32> %va, <8 x i32> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_wu_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.wu.d $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvssrlrni.wu.d(<8 x i32> %va, <8 x i32> %vb, i32 1)
  ret <8 x i32> %res
}

declare <4 x i64> @llvm.loongarch.lasx.xvssrlrni.du.q(<4 x i64>, <4 x i64>, i32)

define <4 x i64> @lasx_xvssrlrni_du_q(<4 x i64> %va, <4 x i64> %vb) nounwind {
; CHECK-LABEL: lasx_xvssrlrni_du_q:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssrlrni.du.q $xr0, $xr1, 1
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i64> @llvm.loongarch.lasx.xvssrlrni.du.q(<4 x i64> %va, <4 x i64> %vb, i32 1)
  ret <4 x i64> %res
}
