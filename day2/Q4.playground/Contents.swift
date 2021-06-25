import UIKit

// https://projecteuler.net/archives

/**
 4. Largest palindrome product
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

 Find the largest palindrome made from the product of two 3-digit numbers.
 */


func maxPalindrom() {
    
    // Çarpım sonucunu tutması için bir değişken oluşturma:
    var palindrom: Int
    
    // Çarpımların sonuçlarında oluşan palindrom sayıları tutacak array:
    var palindromArr: [Int] = []
    
    // Palindrom sayılarını bulmak için döngüler:
    for i in 900...999 {
        for j in 900...999 {
            palindrom = i*j
            
            // çarpım, tersten de aynı ise arraye eklesin:
            if String(palindrom) == String(String(palindrom).reversed()) {
                palindromArr.append(palindrom)
                
            }
        }
    }
    
    // array içindeki max olanı yazdırma:
    print(palindromArr.max() ?? 0)
}

maxPalindrom() // output: 906609

