import UIKit

// https://projecteuler.net/archives
/**
 1. Multiples of 3 and 5
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Find the sum of all the multiples of 3 or 5 below 1000.
 */

/**
 Fonsiyon bölünen ve bölüenleri parametre olarak alır. Soru için bölen parametreleri default olarak 3 ve 5.
 Farklı bölenler için farklı değerler verilebilir.
 */
func divideSum (divide: Int, divisor1: Int = 3, divisor2:Int = 5) -> Int {
    
    // İstenen toplam değeri 0 a eşitlenerek belirlenir.
    var sum: Int = 0
    
    // Bölümden kalan 0 olduğu müddetçe toplam değere bölünenden küçük her değer eklenir.
    for num in 0..<divide {
        if num % divisor1 == 0 || num % divisor2 == 0 {
            sum += num
        }
    }
    return sum
}

print(divideSum(divide: 1000)) // Bölen parametreleri default olarak 3 ve 5 alınır. output: 233168
print(divideSum(divide: 10, divisor1: 2, divisor2: 7)) // output: 27
