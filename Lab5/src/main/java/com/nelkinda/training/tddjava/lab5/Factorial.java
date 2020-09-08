package com.nelkinda.training.tddjava.lab5;

public enum Factorial {
    ;

    public static long factorial(final long n) {
        return n == 0 ? 1 : n * factorial(n - 1);
    }
}
