from __future__ import annotations

from fractions import Fraction

Matrix2 = tuple[tuple[Fraction, Fraction], tuple[Fraction, Fraction]]


def identity_minus(matrix: Matrix2) -> Matrix2:
    return (
        (Fraction(1) - matrix[0][0], -matrix[0][1]),
        (-matrix[1][0], Fraction(1) - matrix[1][1]),
    )


def invert_2x2(matrix: Matrix2) -> Matrix2:
    determinant = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
    if determinant == 0:
        raise ValueError("matrix is singular")
    return (
        (matrix[1][1] / determinant, -matrix[0][1] / determinant),
        (-matrix[1][0] / determinant, matrix[0][0] / determinant),
    )


def resolvent(matrix: Matrix2) -> Matrix2:
    return invert_2x2(identity_minus(matrix))