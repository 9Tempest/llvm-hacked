; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -disable-wasm-fallthrough-return-opt -wasm-keep-registers | FileCheck %s

; Test a subset of compiler-rt/libm libcalls expected to be emitted by the wasm backend

target triple = "wasm32-unknown-unknown"

declare fp128 @llvm.sqrt.f128(fp128)
declare fp128 @llvm.floor.f128(fp128)
declare fp128 @llvm.trunc.f128(fp128)
declare fp128 @llvm.nearbyint.f128(fp128)
declare fp128 @llvm.pow.f128(fp128, fp128)
declare fp128 @llvm.powi.f128.i32(fp128, i32)

declare double @llvm.cos.f64(double)
declare double @llvm.log10.f64(double)
declare double @llvm.pow.f64(double, double)
declare double @llvm.powi.f64.i32(double, i32)
declare double @llvm.log.f64(double)
declare double @llvm.exp.f64(double)
declare double @llvm.ldexp.f64.i32(double, i32)
declare {double, i32} @llvm.frexp.f64.i32(double)
declare i32 @llvm.lround(double)

declare void @escape_value(i32)

define fp128 @fp128libcalls(fp128 %x, fp128 %y, i32 %z) {
  ; compiler-rt call
; CHECK-LABEL: fp128libcalls:
; CHECK:         .functype fp128libcalls (i32, i64, i64, i64, i64, i32) -> ()
; CHECK-NEXT:    .local i32
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    global.get $push28=, __stack_pointer
; CHECK-NEXT:    i32.const $push29=, 144
; CHECK-NEXT:    i32.sub $push73=, $pop28, $pop29
; CHECK-NEXT:    local.tee $push72=, 6, $pop73
; CHECK-NEXT:    global.set __stack_pointer, $pop72
; CHECK-NEXT:    local.get $push74=, 6
; CHECK-NEXT:    i32.const $push62=, 128
; CHECK-NEXT:    i32.add $push63=, $pop74, $pop62
; CHECK-NEXT:    local.get $push78=, 1
; CHECK-NEXT:    local.get $push77=, 2
; CHECK-NEXT:    local.get $push76=, 3
; CHECK-NEXT:    local.get $push75=, 4
; CHECK-NEXT:    call __addtf3, $pop63, $pop78, $pop77, $pop76, $pop75
; CHECK-NEXT:    local.get $push79=, 6
; CHECK-NEXT:    i32.const $push58=, 112
; CHECK-NEXT:    i32.add $push59=, $pop79, $pop58
; CHECK-NEXT:    local.get $push80=, 6
; CHECK-NEXT:    i64.load $push3=, 128($pop80)
; CHECK-NEXT:    local.get $push81=, 6
; CHECK-NEXT:    i32.const $push60=, 128
; CHECK-NEXT:    i32.add $push61=, $pop81, $pop60
; CHECK-NEXT:    i32.const $push0=, 8
; CHECK-NEXT:    i32.add $push1=, $pop61, $pop0
; CHECK-NEXT:    i64.load $push2=, 0($pop1)
; CHECK-NEXT:    local.get $push83=, 3
; CHECK-NEXT:    local.get $push82=, 4
; CHECK-NEXT:    call __multf3, $pop59, $pop3, $pop2, $pop83, $pop82
; CHECK-NEXT:    local.get $push84=, 6
; CHECK-NEXT:    i32.const $push54=, 96
; CHECK-NEXT:    i32.add $push55=, $pop84, $pop54
; CHECK-NEXT:    local.get $push85=, 6
; CHECK-NEXT:    i64.load $push6=, 112($pop85)
; CHECK-NEXT:    local.get $push86=, 6
; CHECK-NEXT:    i32.const $push56=, 112
; CHECK-NEXT:    i32.add $push57=, $pop86, $pop56
; CHECK-NEXT:    i32.const $push71=, 8
; CHECK-NEXT:    i32.add $push4=, $pop57, $pop71
; CHECK-NEXT:    i64.load $push5=, 0($pop4)
; CHECK-NEXT:    local.get $push88=, 3
; CHECK-NEXT:    local.get $push87=, 4
; CHECK-NEXT:    call __divtf3, $pop55, $pop6, $pop5, $pop88, $pop87
; CHECK-NEXT:    local.get $push89=, 6
; CHECK-NEXT:    i32.const $push50=, 80
; CHECK-NEXT:    i32.add $push51=, $pop89, $pop50
; CHECK-NEXT:    local.get $push90=, 6
; CHECK-NEXT:    i64.load $push9=, 96($pop90)
; CHECK-NEXT:    local.get $push91=, 6
; CHECK-NEXT:    i32.const $push52=, 96
; CHECK-NEXT:    i32.add $push53=, $pop91, $pop52
; CHECK-NEXT:    i32.const $push70=, 8
; CHECK-NEXT:    i32.add $push7=, $pop53, $pop70
; CHECK-NEXT:    i64.load $push8=, 0($pop7)
; CHECK-NEXT:    call sqrtl, $pop51, $pop9, $pop8
; CHECK-NEXT:    local.get $push92=, 6
; CHECK-NEXT:    i32.const $push46=, 64
; CHECK-NEXT:    i32.add $push47=, $pop92, $pop46
; CHECK-NEXT:    local.get $push93=, 6
; CHECK-NEXT:    i64.load $push12=, 80($pop93)
; CHECK-NEXT:    local.get $push94=, 6
; CHECK-NEXT:    i32.const $push48=, 80
; CHECK-NEXT:    i32.add $push49=, $pop94, $pop48
; CHECK-NEXT:    i32.const $push69=, 8
; CHECK-NEXT:    i32.add $push10=, $pop49, $pop69
; CHECK-NEXT:    i64.load $push11=, 0($pop10)
; CHECK-NEXT:    call floorl, $pop47, $pop12, $pop11
; CHECK-NEXT:    local.get $push95=, 6
; CHECK-NEXT:    i32.const $push42=, 48
; CHECK-NEXT:    i32.add $push43=, $pop95, $pop42
; CHECK-NEXT:    local.get $push96=, 6
; CHECK-NEXT:    i64.load $push15=, 64($pop96)
; CHECK-NEXT:    local.get $push97=, 6
; CHECK-NEXT:    i32.const $push44=, 64
; CHECK-NEXT:    i32.add $push45=, $pop97, $pop44
; CHECK-NEXT:    i32.const $push68=, 8
; CHECK-NEXT:    i32.add $push13=, $pop45, $pop68
; CHECK-NEXT:    i64.load $push14=, 0($pop13)
; CHECK-NEXT:    local.get $push99=, 3
; CHECK-NEXT:    local.get $push98=, 4
; CHECK-NEXT:    call powl, $pop43, $pop15, $pop14, $pop99, $pop98
; CHECK-NEXT:    local.get $push100=, 6
; CHECK-NEXT:    i32.const $push38=, 32
; CHECK-NEXT:    i32.add $push39=, $pop100, $pop38
; CHECK-NEXT:    local.get $push101=, 6
; CHECK-NEXT:    i64.load $push18=, 48($pop101)
; CHECK-NEXT:    local.get $push102=, 6
; CHECK-NEXT:    i32.const $push40=, 48
; CHECK-NEXT:    i32.add $push41=, $pop102, $pop40
; CHECK-NEXT:    i32.const $push67=, 8
; CHECK-NEXT:    i32.add $push16=, $pop41, $pop67
; CHECK-NEXT:    i64.load $push17=, 0($pop16)
; CHECK-NEXT:    local.get $push103=, 5
; CHECK-NEXT:    call __powitf2, $pop39, $pop18, $pop17, $pop103
; CHECK-NEXT:    local.get $push104=, 6
; CHECK-NEXT:    i32.const $push34=, 16
; CHECK-NEXT:    i32.add $push35=, $pop104, $pop34
; CHECK-NEXT:    local.get $push105=, 6
; CHECK-NEXT:    i64.load $push21=, 32($pop105)
; CHECK-NEXT:    local.get $push106=, 6
; CHECK-NEXT:    i32.const $push36=, 32
; CHECK-NEXT:    i32.add $push37=, $pop106, $pop36
; CHECK-NEXT:    i32.const $push66=, 8
; CHECK-NEXT:    i32.add $push19=, $pop37, $pop66
; CHECK-NEXT:    i64.load $push20=, 0($pop19)
; CHECK-NEXT:    call truncl, $pop35, $pop21, $pop20
; CHECK-NEXT:    local.get $push109=, 6
; CHECK-NEXT:    local.get $push107=, 6
; CHECK-NEXT:    i64.load $push24=, 16($pop107)
; CHECK-NEXT:    local.get $push108=, 6
; CHECK-NEXT:    i32.const $push32=, 16
; CHECK-NEXT:    i32.add $push33=, $pop108, $pop32
; CHECK-NEXT:    i32.const $push65=, 8
; CHECK-NEXT:    i32.add $push22=, $pop33, $pop65
; CHECK-NEXT:    i64.load $push23=, 0($pop22)
; CHECK-NEXT:    call nearbyintl, $pop109, $pop24, $pop23
; CHECK-NEXT:    local.get $push111=, 0
; CHECK-NEXT:    local.get $push110=, 6
; CHECK-NEXT:    i32.const $push64=, 8
; CHECK-NEXT:    i32.add $push25=, $pop110, $pop64
; CHECK-NEXT:    i64.load $push26=, 0($pop25)
; CHECK-NEXT:    i64.store 8($pop111), $pop26
; CHECK-NEXT:    local.get $push113=, 0
; CHECK-NEXT:    local.get $push112=, 6
; CHECK-NEXT:    i64.load $push27=, 0($pop112)
; CHECK-NEXT:    i64.store 0($pop113), $pop27
; CHECK-NEXT:    local.get $push114=, 6
; CHECK-NEXT:    i32.const $push30=, 144
; CHECK-NEXT:    i32.add $push31=, $pop114, $pop30
; CHECK-NEXT:    global.set __stack_pointer, $pop31
; CHECK-NEXT:    return
  %a = fadd fp128 %x, %y
  %b = fmul fp128 %a, %y
  %c = fdiv fp128 %b, %y
  ; libm calls
  %d = call fp128 @llvm.sqrt.f128(fp128 %c)
  %e = call fp128 @llvm.floor.f128(fp128 %d)
  %f = call fp128 @llvm.pow.f128(fp128 %e, fp128 %y)
  %g = call fp128 @llvm.powi.f128.i32(fp128 %f, i32 %z)
  %h = call fp128 @llvm.trunc.f128(fp128 %g)
  %i = call fp128 @llvm.nearbyint.f128(fp128 %h)
  ret fp128 %i
}

define i128 @i128libcalls(i128 %x, i128 %y) {
  ; Basic ops should be expanded
; CHECK-LABEL: i128libcalls:
; CHECK:         .functype i128libcalls (i32, i64, i64, i64, i64) -> ()
; CHECK-NEXT:    .local i32, i64
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    global.get $push11=, __stack_pointer
; CHECK-NEXT:    i32.const $push12=, 32
; CHECK-NEXT:    i32.sub $push23=, $pop11, $pop12
; CHECK-NEXT:    local.tee $push22=, 5, $pop23
; CHECK-NEXT:    global.set __stack_pointer, $pop22
; CHECK-NEXT:    local.get $push24=, 5
; CHECK-NEXT:    i32.const $push17=, 16
; CHECK-NEXT:    i32.add $push18=, $pop24, $pop17
; CHECK-NEXT:    local.get $push26=, 1
; CHECK-NEXT:    local.get $push25=, 3
; CHECK-NEXT:    i64.add $push21=, $pop26, $pop25
; CHECK-NEXT:    local.tee $push20=, 6, $pop21
; CHECK-NEXT:    local.get $push28=, 2
; CHECK-NEXT:    local.get $push27=, 4
; CHECK-NEXT:    i64.add $push0=, $pop28, $pop27
; CHECK-NEXT:    local.get $push30=, 6
; CHECK-NEXT:    local.get $push29=, 1
; CHECK-NEXT:    i64.lt_u $push1=, $pop30, $pop29
; CHECK-NEXT:    i64.extend_i32_u $push2=, $pop1
; CHECK-NEXT:    i64.add $push3=, $pop0, $pop2
; CHECK-NEXT:    local.get $push32=, 3
; CHECK-NEXT:    local.get $push31=, 4
; CHECK-NEXT:    call __multi3, $pop18, $pop20, $pop3, $pop32, $pop31
; CHECK-NEXT:    local.get $push37=, 5
; CHECK-NEXT:    local.get $push33=, 5
; CHECK-NEXT:    i64.load $push7=, 16($pop33)
; CHECK-NEXT:    local.get $push34=, 5
; CHECK-NEXT:    i32.const $push15=, 16
; CHECK-NEXT:    i32.add $push16=, $pop34, $pop15
; CHECK-NEXT:    i32.const $push4=, 8
; CHECK-NEXT:    i32.add $push5=, $pop16, $pop4
; CHECK-NEXT:    i64.load $push6=, 0($pop5)
; CHECK-NEXT:    local.get $push36=, 3
; CHECK-NEXT:    local.get $push35=, 4
; CHECK-NEXT:    call __umodti3, $pop37, $pop7, $pop6, $pop36, $pop35
; CHECK-NEXT:    local.get $push39=, 0
; CHECK-NEXT:    local.get $push38=, 5
; CHECK-NEXT:    i32.const $push19=, 8
; CHECK-NEXT:    i32.add $push8=, $pop38, $pop19
; CHECK-NEXT:    i64.load $push9=, 0($pop8)
; CHECK-NEXT:    i64.store 8($pop39), $pop9
; CHECK-NEXT:    local.get $push41=, 0
; CHECK-NEXT:    local.get $push40=, 5
; CHECK-NEXT:    i64.load $push10=, 0($pop40)
; CHECK-NEXT:    i64.store 0($pop41), $pop10
; CHECK-NEXT:    local.get $push42=, 5
; CHECK-NEXT:    i32.const $push13=, 32
; CHECK-NEXT:    i32.add $push14=, $pop42, $pop13
; CHECK-NEXT:    global.set __stack_pointer, $pop14
; CHECK-NEXT:    return
  %a = add i128 %x, %y
  %b = mul i128 %a, %y
  %c = urem i128 %b, %y
  ret i128 %c
}

define double @f64libcalls(double %x, double %y, i32 %z) {
; CHECK-LABEL: f64libcalls:
; CHECK:         .functype f64libcalls (f64, f64, i32) -> (f64)
; CHECK-NEXT:    .local i32
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    global.get $push10=, __stack_pointer
; CHECK-NEXT:    i32.const $push11=, 16
; CHECK-NEXT:    i32.sub $push17=, $pop10, $pop11
; CHECK-NEXT:    local.tee $push16=, 3, $pop17
; CHECK-NEXT:    global.set __stack_pointer, $pop16
; CHECK-NEXT:    local.get $push21=, 0
; CHECK-NEXT:    local.get $push18=, 0
; CHECK-NEXT:    call $push0=, cos, $pop18
; CHECK-NEXT:    call $push1=, log10, $pop0
; CHECK-NEXT:    local.get $push19=, 1
; CHECK-NEXT:    call $push2=, pow, $pop1, $pop19
; CHECK-NEXT:    local.get $push20=, 2
; CHECK-NEXT:    call $push3=, __powidf2, $pop2, $pop20
; CHECK-NEXT:    call $push4=, log, $pop3
; CHECK-NEXT:    call $push5=, exp, $pop4
; CHECK-NEXT:    call $push6=, cbrt, $pop5
; CHECK-NEXT:    call $push7=, lround, $pop6
; CHECK-NEXT:    call $push8=, ldexp, $pop21, $pop7
; CHECK-NEXT:    local.get $push22=, 3
; CHECK-NEXT:    i32.const $push14=, 12
; CHECK-NEXT:    i32.add $push15=, $pop22, $pop14
; CHECK-NEXT:    call $push23=, frexp, $pop8, $pop15
; CHECK-NEXT:    local.set 0, $pop23
; CHECK-NEXT:    local.get $push24=, 3
; CHECK-NEXT:    i32.load $push9=, 12($pop24)
; CHECK-NEXT:    call escape_value, $pop9
; CHECK-NEXT:    local.get $push25=, 3
; CHECK-NEXT:    i32.const $push12=, 16
; CHECK-NEXT:    i32.add $push13=, $pop25, $pop12
; CHECK-NEXT:    global.set __stack_pointer, $pop13
; CHECK-NEXT:    local.get $push26=, 0
; CHECK-NEXT:    return $pop26


 %a = call double @llvm.cos.f64(double %x)
 %b = call double @llvm.log10.f64(double %a)
 %c = call double @llvm.pow.f64(double %b, double %y)
 %d = call double @llvm.powi.f64.i32(double %c, i32 %z)
 %e = call double @llvm.log.f64(double %d)
 %f = call double @llvm.exp.f64(double %e)
 %g = call fast double @llvm.pow.f64(double %f, double 0x3FD5555555555555)
 %h = call i32 @llvm.lround(double %g)
 %i = call double @llvm.ldexp.f64.i32(double %x, i32 %h);
 %result = call {double, i32} @llvm.frexp.f64.i32(double %i)
 %result.0 = extractvalue { double, i32 } %result, 0
 %result.1 = extractvalue { double, i32 } %result, 1
 call void @escape_value(i32 %result.1)
 ret double %result.0
}

; fcmp ord and unord (RTLIB::O_F32 / RTLIB::UO_F32 etc) are a special case (see
; comment in WebAssemblyRunimeLibcallSignatures.cpp) so check them separately.
; no libcalls are needed for f32 and f64

define i1 @unordd(double %x, double %y) {
; CHECK-LABEL: unordd:
; CHECK:         .functype unordd (f64, f64) -> (i32)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get $push8=, 0
; CHECK-NEXT:    local.get $push7=, 0
; CHECK-NEXT:    f64.ne $push4=, $pop8, $pop7
; CHECK-NEXT:    local.get $push10=, 1
; CHECK-NEXT:    local.get $push9=, 1
; CHECK-NEXT:    f64.ne $push3=, $pop10, $pop9
; CHECK-NEXT:    i32.or $push5=, $pop4, $pop3
; CHECK-NEXT:    local.get $push12=, 0
; CHECK-NEXT:    local.get $push11=, 0
; CHECK-NEXT:    f64.eq $push1=, $pop12, $pop11
; CHECK-NEXT:    local.get $push14=, 1
; CHECK-NEXT:    local.get $push13=, 1
; CHECK-NEXT:    f64.eq $push0=, $pop14, $pop13
; CHECK-NEXT:    i32.and $push2=, $pop1, $pop0
; CHECK-NEXT:    i32.xor $push6=, $pop5, $pop2
; CHECK-NEXT:    return $pop6
 %a = fcmp uno double %x, %y
 %b = fcmp ord double %x, %y
 %c = xor i1 %a, %b
 ret i1 %c
}

define i1 @unordf(float %x, float %y) {
; CHECK-LABEL: unordf:
; CHECK:         .functype unordf (f32, f32) -> (i32)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get $push8=, 0
; CHECK-NEXT:    local.get $push7=, 0
; CHECK-NEXT:    f32.ne $push4=, $pop8, $pop7
; CHECK-NEXT:    local.get $push10=, 1
; CHECK-NEXT:    local.get $push9=, 1
; CHECK-NEXT:    f32.ne $push3=, $pop10, $pop9
; CHECK-NEXT:    i32.or $push5=, $pop4, $pop3
; CHECK-NEXT:    local.get $push12=, 0
; CHECK-NEXT:    local.get $push11=, 0
; CHECK-NEXT:    f32.eq $push1=, $pop12, $pop11
; CHECK-NEXT:    local.get $push14=, 1
; CHECK-NEXT:    local.get $push13=, 1
; CHECK-NEXT:    f32.eq $push0=, $pop14, $pop13
; CHECK-NEXT:    i32.and $push2=, $pop1, $pop0
; CHECK-NEXT:    i32.xor $push6=, $pop5, $pop2
; CHECK-NEXT:    return $pop6
 %a = fcmp uno float %x, %y
 %b = fcmp ord float %x, %y
 %c = xor i1 %a, %b
 ret i1 %c
}

define i1 @unordt(fp128 %x, fp128 %y) {
; CHECK-LABEL: unordt:
; CHECK:         .functype unordt (i64, i64, i64, i64) -> (i32)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get $push6=, 0
; CHECK-NEXT:    local.get $push5=, 1
; CHECK-NEXT:    local.get $push4=, 2
; CHECK-NEXT:    local.get $push3=, 3
; CHECK-NEXT:    call $push1=, __unordtf2, $pop6, $pop5, $pop4, $pop3
; CHECK-NEXT:    i32.const $push0=, 0
; CHECK-NEXT:    i32.ne $push2=, $pop1, $pop0
; CHECK-NEXT:    return $pop2
 %a = fcmp uno fp128 %x, %y
 ret i1 %a
}

define i1 @ordt(fp128 %x, fp128 %y) {
; CHECK-LABEL: ordt:
; CHECK:         .functype ordt (i64, i64, i64, i64) -> (i32)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get $push5=, 0
; CHECK-NEXT:    local.get $push4=, 1
; CHECK-NEXT:    local.get $push3=, 2
; CHECK-NEXT:    local.get $push2=, 3
; CHECK-NEXT:    call $push0=, __unordtf2, $pop5, $pop4, $pop3, $pop2
; CHECK-NEXT:    i32.eqz $push1=, $pop0
; CHECK-NEXT:    return $pop1
 %a = fcmp ord fp128 %x, %y
 ret i1 %a
}