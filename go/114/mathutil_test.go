package mathutil

import (
	"testing"
)

func TestAdd(t *testing.T) {
    got := Add(2, 3)
    want := 5
    if got != want {
        t.Errorf("Add(2,3) = %d; want %d", got, want)
    }
}

func TestSubtract(t *testing.T) {
    got := Subtract(10, 4)
    want := 6
    if got != want {
        t.Errorf("Subtract(10,4) = %d; want %d", got, want)
    }
}

func TestMultiply(t *testing.T) {
    got := Multiply(3, 4)
    want := 12
    if got != want {
        t.Errorf("Multiply(3,4) = %d; want %d", got, want)
    }
}

func TestDivide(t *testing.T) {
    got, err := Divide(10, 2)
    if err != nil {
        t.Errorf("Divide(10,2) returned error: %v", err)
    }
    want := 5
    if got != want {
        t.Errorf("Divide(10,2) = %d; want %d", got, want)
    }
}

func TestDivideByZero(t *testing.T) {
    _, err := Divide(10, 0)
    if err == nil {
        t.Errorf("Expected error when dividing by zero, but got nil")
    }
}
