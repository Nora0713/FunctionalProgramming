(*
  10152160137 陈弈君 homeowork 6
*)

Set Warnings "-notation-overridden,-parsing".
Require Export Poly.

(* 1 *)
Theorem rev_app_distr: forall X (l1 l2 : list X),
  rev (l1 ++ l2) = rev l2 ++ rev l1.
Proof.
  intros X l1 l2. induction l1 as [| h l' IHl'].
  - simpl. rewrite app_nil_r. reflexivity.
  - simpl. rewrite IHl'. rewrite app_assoc. reflexivity.
Qed.

(* 2 *)
Lemma cons_rev : forall X : Type, forall l : list X, forall n : X,
  n :: rev l = rev (l ++ [n]).
Proof.
  intros X l n. induction l as [| n' l'].
  - reflexivity.
  - simpl. rewrite <- IHl'. reflexivity.
Qed.

Theorem rev_involutive : forall X : Type, forall l : list X,
  rev (rev l) = l.
Proof.
  intros X l. induction l as [| n l' IHl'].
  - simpl. reflexivity.
  - simpl. rewrite <- cons_rev. rewrite -> IHl'. reflexivity.
Qed.

(* 3 *)
Definition filter_even_gt7 (l : list nat) : list nat :=
  filter ( fun n => (evenb n) && (leb 7 n)) l.

Example test_filter_even_gt7_1 :
  filter_even_gt7 [1;2;6;9;10;3;12;8] = [10;12;8].
Proof. simpl. reflexivity. Qed.