(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter value_PANGRAM : Value.t.

Axiom Constant_value_PANGRAM : (M.get_constant "child_processes_pipes::PANGRAM") = value_PANGRAM.
Global Hint Rewrite Constant_value_PANGRAM : constant_rewrites.

Parameter main : (list Value.t) -> (list Ty.t) -> (list Value.t) -> M.

Global Instance Instance_IsFunction_main : M.IsFunction.Trait "child_processes_pipes::main" main.
Admitted.
