import UIKit

// https://projecteuler.net/archives

/**
 5. Smallest multiple
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

// OBEB i hesaplayan fonksiyon:
func gcd(_ n1: Int, _ n2: Int) -> Int {
    if (n1 % n2) != 0 {
        return gcd(n2, (n1 % n2))
    } else {
        return n2
    }
}

// Verilen aralıktaki sayılara tam bölünen en küçük sayıyı bulan fonksyion:
func minDivide(minDivisor: Int = 1, maxDivisor: Int = 20) {
    var sum = 1
    for i in minDivisor...maxDivisor {
        sum = (sum * i) / gcd(sum, i)
    }
    print(sum)
}

minDivide(minDivisor: 1, maxDivisor: 20)
