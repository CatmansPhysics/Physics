import PhysicsLean.Foundations.FiniteWord

/-!
# PhysicsLean Foundations Grading

This file defines additive and multiplicative grading structures on symbols and
extends them to whole finite words. These grades provide the coarse numerical
bookkeeping used later in factorization and transfer arguments.
-/

namespace PhysicsLean

class AdditiveGrading (α : Type _) (ι : Type _) [AddMonoid ι] where
  grade : α → ι

class MultiplicativeGrading (α : Type _) (ι : Type _) [Monoid ι] where
  grade : α → ι

namespace AdditiveGrading

variable {α : Type _} {ι : Type _} [AddMonoid ι] [AdditiveGrading α ι]

def gradeWord : FiniteWord α → ι
  | [] => (0 : ι)
  | a :: w => AdditiveGrading.grade (ι := ι) a + gradeWord w

@[simp] theorem gradeWord_nil : gradeWord (α := α) (ι := ι) ([] : FiniteWord α) = (0 : ι) := rfl

@[simp] theorem gradeWord_cons (a : α) (w : FiniteWord α) :
    gradeWord (α := α) (ι := ι) (a :: w) =
      AdditiveGrading.grade (ι := ι) a + gradeWord (α := α) (ι := ι) w := rfl

@[simp] theorem gradeWord_append (u v : FiniteWord α) :
    gradeWord (α := α) (ι := ι) (u ++ v) =
      gradeWord (α := α) (ι := ι) u + gradeWord (α := α) (ι := ι) v := by
  induction u with
  | nil => simp [gradeWord]
  | cons a u ihu =>
      simp [gradeWord, ihu, add_assoc]

end AdditiveGrading

namespace MultiplicativeGrading

variable {α : Type _} {ι : Type _} [Monoid ι] [MultiplicativeGrading α ι]

def gradeWord : FiniteWord α → ι
  | [] => (1 : ι)
  | a :: w => MultiplicativeGrading.grade (ι := ι) a * gradeWord w

@[simp] theorem gradeWord_nil : gradeWord (α := α) (ι := ι) ([] : FiniteWord α) = (1 : ι) := rfl

@[simp] theorem gradeWord_cons (a : α) (w : FiniteWord α) :
    gradeWord (α := α) (ι := ι) (a :: w) =
      MultiplicativeGrading.grade (ι := ι) a * gradeWord (α := α) (ι := ι) w := rfl

@[simp] theorem gradeWord_append (u v : FiniteWord α) :
    gradeWord (α := α) (ι := ι) (u ++ v) =
      gradeWord (α := α) (ι := ι) u * gradeWord (α := α) (ι := ι) v := by
  induction u with
  | nil => simp [gradeWord]
  | cons a u ihu =>
      simp [gradeWord, ihu, mul_assoc]

end MultiplicativeGrading

end PhysicsLean
