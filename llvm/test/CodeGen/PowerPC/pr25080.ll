; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-- -mcpu=pwr8 < %s | FileCheck %s --check-prefix=LE
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-- -mcpu=pwr8 < %s | FileCheck %s --check-prefix=BE

define <8 x i16> @pr25080(<8 x i32> %a) {
; LE-LABEL: pr25080:
; LE:       # %bb.0: # %entry
; LE-NEXT:    addis 3, 2, .LCPI0_0@toc@ha
; LE-NEXT:    xxlxor 36, 36, 36
; LE-NEXT:    addi 3, 3, .LCPI0_0@toc@l
; LE-NEXT:    lxvd2x 0, 0, 3
; LE-NEXT:    xxland 34, 34, 0
; LE-NEXT:    xxland 35, 35, 0
; LE-NEXT:    vcmpequw 2, 2, 4
; LE-NEXT:    vcmpequw 3, 3, 4
; LE-NEXT:    xxswapd 1, 34
; LE-NEXT:    xxsldwi 2, 34, 34, 1
; LE-NEXT:    xxsldwi 3, 34, 34, 3
; LE-NEXT:    xxswapd 0, 35
; LE-NEXT:    xxsldwi 4, 35, 35, 1
; LE-NEXT:    xxsldwi 5, 35, 35, 3
; LE-NEXT:    mffprwz 3, 1
; LE-NEXT:    mtvsrd 36, 3
; LE-NEXT:    mffprwz 3, 2
; LE-NEXT:    mtvsrd 37, 3
; LE-NEXT:    mfvsrwz 3, 34
; LE-NEXT:    mtvsrd 34, 3
; LE-NEXT:    mffprwz 3, 3
; LE-NEXT:    vmrghh 4, 5, 4
; LE-NEXT:    mtvsrd 37, 3
; LE-NEXT:    mffprwz 3, 0
; LE-NEXT:    vmrghh 2, 5, 2
; LE-NEXT:    mtvsrd 37, 3
; LE-NEXT:    mffprwz 3, 4
; LE-NEXT:    mtvsrd 32, 3
; LE-NEXT:    mfvsrwz 3, 35
; LE-NEXT:    mtvsrd 35, 3
; LE-NEXT:    mffprwz 3, 5
; LE-NEXT:    xxmrglw 0, 34, 36
; LE-NEXT:    vmrghh 5, 0, 5
; LE-NEXT:    mtvsrd 32, 3
; LE-NEXT:    addis 3, 2, .LCPI0_1@toc@ha
; LE-NEXT:    addi 3, 3, .LCPI0_1@toc@l
; LE-NEXT:    vmrghh 3, 0, 3
; LE-NEXT:    xxmrglw 1, 35, 37
; LE-NEXT:    xxmrgld 34, 1, 0
; LE-NEXT:    lxvd2x 0, 0, 3
; LE-NEXT:    xxswapd 35, 0
; LE-NEXT:    xxlor 34, 34, 35
; LE-NEXT:    blr
;
; BE-LABEL: pr25080:
; BE:       # %bb.0: # %entry
; BE-NEXT:    addis 3, 2, .LCPI0_0@toc@ha
; BE-NEXT:    xxlxor 36, 36, 36
; BE-NEXT:    addi 3, 3, .LCPI0_0@toc@l
; BE-NEXT:    lxvw4x 0, 0, 3
; BE-NEXT:    addis 3, 2, .LCPI0_1@toc@ha
; BE-NEXT:    addi 3, 3, .LCPI0_1@toc@l
; BE-NEXT:    xxland 35, 35, 0
; BE-NEXT:    xxland 34, 34, 0
; BE-NEXT:    vcmpequw 3, 3, 4
; BE-NEXT:    vcmpequw 2, 2, 4
; BE-NEXT:    lxvw4x 36, 0, 3
; BE-NEXT:    xxswapd 1, 35
; BE-NEXT:    xxsldwi 2, 35, 35, 1
; BE-NEXT:    xxsldwi 3, 35, 35, 3
; BE-NEXT:    xxswapd 0, 34
; BE-NEXT:    xxsldwi 4, 34, 34, 1
; BE-NEXT:    xxsldwi 5, 34, 34, 3
; BE-NEXT:    mffprwz 3, 1
; BE-NEXT:    mtvsrwz 37, 3
; BE-NEXT:    mffprwz 3, 2
; BE-NEXT:    mtvsrwz 32, 3
; BE-NEXT:    mfvsrwz 3, 35
; BE-NEXT:    mtvsrwz 35, 3
; BE-NEXT:    mffprwz 3, 3
; BE-NEXT:    vperm 5, 0, 5, 4
; BE-NEXT:    mtvsrwz 32, 3
; BE-NEXT:    mffprwz 3, 0
; BE-NEXT:    vperm 3, 0, 3, 4
; BE-NEXT:    mtvsrwz 32, 3
; BE-NEXT:    mffprwz 3, 4
; BE-NEXT:    mtvsrwz 33, 3
; BE-NEXT:    mfvsrwz 3, 34
; BE-NEXT:    mtvsrwz 34, 3
; BE-NEXT:    mffprwz 3, 5
; BE-NEXT:    xxmrghw 0, 35, 37
; BE-NEXT:    vperm 0, 1, 0, 4
; BE-NEXT:    mtvsrwz 33, 3
; BE-NEXT:    addis 3, 2, .LCPI0_2@toc@ha
; BE-NEXT:    addi 3, 3, .LCPI0_2@toc@l
; BE-NEXT:    vperm 2, 1, 2, 4
; BE-NEXT:    xxmrghw 1, 34, 32
; BE-NEXT:    xxmrghd 34, 1, 0
; BE-NEXT:    lxvw4x 0, 0, 3
; BE-NEXT:    xxlor 34, 34, 0
; BE-NEXT:    blr
entry:
  %0 = trunc <8 x i32> %a to <8 x i23>
  %1 = icmp eq <8 x i23> %0, zeroinitializer
  %2 = or <8 x i1> %1, <i1 true, i1 true, i1 true, i1 true, i1 false, i1 false, i1 false, i1 false>
  %3 = sext <8 x i1> %2 to <8 x i16>
  ret <8 x i16> %3
}
