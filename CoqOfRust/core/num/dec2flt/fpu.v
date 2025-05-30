(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module num.
  Module dec2flt.
    Module fpu.
      Module fpu_precision.
        (*     pub fn set_precision<T>() {} *)
        Definition set_precision (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [ T ], [] => ltac:(M.monadic (Value.Tuple []))
          | _, _, _ => M.impossible "wrong number of arguments"
          end.
        
        Global Instance Instance_IsFunction_set_precision :
          M.IsFunction.Trait "core::num::dec2flt::fpu::fpu_precision::set_precision" set_precision.
        Admitted.
        Global Typeclasses Opaque set_precision.
      End fpu_precision.
    End fpu.
  End dec2flt.
End num.
