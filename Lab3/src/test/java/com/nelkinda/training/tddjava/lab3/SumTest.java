package com.nelkinda.training.tddjava.lab3;

import org.junit.jupiter.api.Test;

import static com.nelkinda.training.tddjava.lab3.Sum.sum;
import static org.junit.jupiter.api.Assertions.assertEquals;

class SumTest {
    @Test
    void sumOfNothing_isZero() {
        assertEquals(0, sum());
    }

    @Test
    void sumOfOne_isOne() {
        assertEquals(1, sum(1));
    }

    @Test
    void sumOfTwoNumbers() {
        assertEquals(12, sum(5, 7));
    }
}
