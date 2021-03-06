; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -mtriple=x86_64-pc-linux  -mattr=+avx -interleaved-access -S | FileCheck %s

; This file tests the function `llvm::lowerInterleavedLoad`.

define <4 x double> @load_factorf64_4(<16 x double>* %ptr) {
; CHECK-LABEL: @load_factorf64_4(
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast <16 x double>* %ptr to <4 x double>*
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = load <4 x double>, <4 x double>* [[TMP2]], align 16
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = load <4 x double>, <4 x double>* [[TMP4]], align 16
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 2
; CHECK-NEXT:    [[TMP7:%.*]] = load <4 x double>, <4 x double>* [[TMP6]], align 16
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 3
; CHECK-NEXT:    [[TMP9:%.*]] = load <4 x double>, <4 x double>* [[TMP8]], align 16
; CHECK-NEXT:    [[TMP10:%.*]] = shufflevector <4 x double> [[TMP3]], <4 x double> [[TMP7]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP11:%.*]] = shufflevector <4 x double> [[TMP5]], <4 x double> [[TMP9]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <4 x double> [[TMP3]], <4 x double> [[TMP7]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP13:%.*]] = shufflevector <4 x double> [[TMP5]], <4 x double> [[TMP9]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP14:%.*]] = shufflevector <4 x double> [[TMP10]], <4 x double> [[TMP11]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP15:%.*]] = shufflevector <4 x double> [[TMP12]], <4 x double> [[TMP13]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP16:%.*]] = shufflevector <4 x double> [[TMP10]], <4 x double> [[TMP11]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[TMP17:%.*]] = shufflevector <4 x double> [[TMP12]], <4 x double> [[TMP13]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[ADD1:%.*]] = fadd <4 x double> [[TMP14]], [[TMP16]]
; CHECK-NEXT:    [[ADD2:%.*]] = fadd <4 x double> [[ADD1]], [[TMP15]]
; CHECK-NEXT:    [[ADD3:%.*]] = fadd <4 x double> [[ADD2]], [[TMP17]]
; CHECK-NEXT:    ret <4 x double> [[ADD3]]
;
  %wide.vec = load <16 x double>, <16 x double>* %ptr, align 16
  %strided.v0 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.v1 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.v2 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.v3 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %add1 = fadd <4 x double> %strided.v0, %strided.v1
  %add2 = fadd <4 x double> %add1, %strided.v2
  %add3 = fadd <4 x double> %add2, %strided.v3
  ret <4 x double> %add3
}

define <4 x i64> @load_factori64_4(<16 x i64>* %ptr) {
; CHECK-LABEL: @load_factori64_4(
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast <16 x i64>* %ptr to <4 x i64>*
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr <4 x i64>, <4 x i64>* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = load <4 x i64>, <4 x i64>* [[TMP2]], align 16
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr <4 x i64>, <4 x i64>* [[TMP1]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = load <4 x i64>, <4 x i64>* [[TMP4]], align 16
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr <4 x i64>, <4 x i64>* [[TMP1]], i32 2
; CHECK-NEXT:    [[TMP7:%.*]] = load <4 x i64>, <4 x i64>* [[TMP6]], align 16
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr <4 x i64>, <4 x i64>* [[TMP1]], i32 3
; CHECK-NEXT:    [[TMP9:%.*]] = load <4 x i64>, <4 x i64>* [[TMP8]], align 16
; CHECK-NEXT:    [[TMP10:%.*]] = shufflevector <4 x i64> [[TMP3]], <4 x i64> [[TMP7]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP11:%.*]] = shufflevector <4 x i64> [[TMP5]], <4 x i64> [[TMP9]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <4 x i64> [[TMP3]], <4 x i64> [[TMP7]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP13:%.*]] = shufflevector <4 x i64> [[TMP5]], <4 x i64> [[TMP9]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP14:%.*]] = shufflevector <4 x i64> [[TMP10]], <4 x i64> [[TMP11]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP15:%.*]] = shufflevector <4 x i64> [[TMP12]], <4 x i64> [[TMP13]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP16:%.*]] = shufflevector <4 x i64> [[TMP10]], <4 x i64> [[TMP11]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[TMP17:%.*]] = shufflevector <4 x i64> [[TMP12]], <4 x i64> [[TMP13]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[ADD1:%.*]] = add <4 x i64> [[TMP14]], [[TMP16]]
; CHECK-NEXT:    [[ADD2:%.*]] = add <4 x i64> [[ADD1]], [[TMP15]]
; CHECK-NEXT:    [[ADD3:%.*]] = add <4 x i64> [[ADD2]], [[TMP17]]
; CHECK-NEXT:    ret <4 x i64> [[ADD3]]
;
  %wide.vec = load <16 x i64>, <16 x i64>* %ptr, align 16
  %strided.v0 = shufflevector <16 x i64> %wide.vec, <16 x i64> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.v1 = shufflevector <16 x i64> %wide.vec, <16 x i64> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.v2 = shufflevector <16 x i64> %wide.vec, <16 x i64> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.v3 = shufflevector <16 x i64> %wide.vec, <16 x i64> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %add1 = add <4 x i64> %strided.v0, %strided.v1
  %add2 = add <4 x i64> %add1, %strided.v2
  %add3 = add <4 x i64> %add2, %strided.v3
  ret <4 x i64> %add3
}

define <4 x double> @load_factorf64_1(<16 x double>* %ptr) {
; CHECK-LABEL: @load_factorf64_1(
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast <16 x double>* %ptr to <4 x double>*
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = load <4 x double>, <4 x double>* [[TMP2]], align 16
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = load <4 x double>, <4 x double>* [[TMP4]], align 16
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 2
; CHECK-NEXT:    [[TMP7:%.*]] = load <4 x double>, <4 x double>* [[TMP6]], align 16
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr <4 x double>, <4 x double>* [[TMP1]], i32 3
; CHECK-NEXT:    [[TMP9:%.*]] = load <4 x double>, <4 x double>* [[TMP8]], align 16
; CHECK-NEXT:    [[TMP10:%.*]] = shufflevector <4 x double> [[TMP3]], <4 x double> [[TMP7]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP11:%.*]] = shufflevector <4 x double> [[TMP5]], <4 x double> [[TMP9]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <4 x double> [[TMP3]], <4 x double> [[TMP7]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP13:%.*]] = shufflevector <4 x double> [[TMP5]], <4 x double> [[TMP9]], <4 x i32> <i32 2, i32 3, i32 6, i32 7>
; CHECK-NEXT:    [[TMP14:%.*]] = shufflevector <4 x double> [[TMP10]], <4 x double> [[TMP11]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP15:%.*]] = shufflevector <4 x double> [[TMP12]], <4 x double> [[TMP13]], <4 x i32> <i32 0, i32 4, i32 2, i32 6>
; CHECK-NEXT:    [[TMP16:%.*]] = shufflevector <4 x double> [[TMP10]], <4 x double> [[TMP11]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[TMP17:%.*]] = shufflevector <4 x double> [[TMP12]], <4 x double> [[TMP13]], <4 x i32> <i32 1, i32 5, i32 3, i32 7>
; CHECK-NEXT:    [[MUL:%.*]] = fmul <4 x double> [[TMP14]], [[TMP14]]
; CHECK-NEXT:    ret <4 x double> [[MUL]]
;
  %wide.vec = load <16 x double>, <16 x double>* %ptr, align 16
  %strided.v0 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.v3 = shufflevector <16 x double> %wide.vec, <16 x double> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %mul = fmul <4 x double> %strided.v0, %strided.v3
  ret <4 x double> %mul
}


