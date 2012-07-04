; RUN: llc < %s -march=dcpu16 | FileCheck %s
target datalayout = "e-p:16:16:16-i8:16:16-i16:16:16-i32:16:16-s0:16:16-n16"
target triple = "dcpu16"

@y = external global i32
@x = external global i32

define void @f() nounwind {
entry:
  store i32 1, i32* @y, align 1
  %0 = load i32* @x, align 1
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @x, align 1
  ret void
}
; Formerly crashed during codegen, just check it exists
; CHECK: :f
