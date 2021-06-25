import UIKit

// https://projecteuler.net/archives

/**
 3. Largest prime factor
 The prime factors of 13195 are 5, 7, 13 and 29.

 What is the largest prime factor of the number 600851475143 ?
 */

func primeFactors(number: Int) {
    
    // Sayıyı var tipinde oluşturma:
    var num = number
    
    // Asal çapranların içine ekleneceği array:
    var nums: [Int] = []
    
    let maxNum = sqrt(Double(num))
    
    // Asal çarpanları bulmak için kullanılacak döngü:
    for i in 2...Int(maxNum) {
        if num % i == 0 {
            num /= i
            nums.append(i)
        }
    }
    
    // max asal çarpan:
    print(nums.max() ?? 0)
}

primeFactors(number: 13195) // output: 29
primeFactors(number: 600851475143) // output: 6857
