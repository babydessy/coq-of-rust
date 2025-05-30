(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Foo
{
  const_params := [];
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := StructTuple [];
      }
    ];
}
*)

Axiom IsDiscriminant_Foo_Bar : M.IsDiscriminant "if_let_challenge::Foo::Bar" 0.

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
Definition main (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ a : Ty.path "if_let_challenge::Foo" :=
          M.alloc (| Value.StructTuple "if_let_challenge::Foo::Bar" [] |) in
        M.match_operator (|
          Some (Ty.tuple []),
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ := a in
                let _ := M.is_struct_tuple (| γ, "if_let_challenge::Foo::Bar" |) in
                let~ _ : Ty.tuple [] :=
                  let~ _ : Ty.tuple [] :=
                    M.alloc (|
                      M.call_closure (|
                        Ty.tuple [],
                        M.get_function (| "std::io::stdio::_print", [], [] |),
                        [
                          M.call_closure (|
                            Ty.path "core::fmt::Arguments",
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_const",
                              [ Value.Integer IntegerKind.Usize 1 ],
                              []
                            |),
                            [
                              M.borrow (|
                                Pointer.Kind.Ref,
                                M.deref (|
                                  M.borrow (|
                                    Pointer.Kind.Ref,
                                    M.alloc (| Value.Array [ mk_str (| "a is foobar
" |) ] |)
                                  |)
                                |)
                              |)
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _, _ => M.impossible "wrong number of arguments"
  end.

Global Instance Instance_IsFunction_main : M.IsFunction.Trait "if_let_challenge::main" main.
Admitted.
Global Typeclasses Opaque main.
