import UIKit

/**
  1- Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun karakterler olsun. Bu karekterlerin içinde bazı hafrflerin tekrar edeceğini düşünün. Mesela 'a ' harfi 20 farklı yerde geçiyor. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfler silinecektir. Sonra geriye kalan string ekrana yazdırılacaktır. Not boşluklar sayılmayacak:)
  
  Örnek string: "aaba kouq bux"
  Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazmalı
  Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
  tekrar sayısı 4 verildiğinde  :  hiç bir harf silinmemeli aynı stringi yazmalı
  
  Not: String ve tekrar sayısını parametre olarak alsın. func (myString, count)
*/

func findSimilar (chars: String, repeatNum: Int) -> String {
    
    // Karakterlerin aynısı olarak var tipinde bir karakter dizisi oluşturma:
    var resultChars = chars
    
    // Karakterlerin sayısını bulmak için:
    for char in chars {
        var num = 0
        for i in 0..<chars.count {
            if char == Array(chars)[i] && char != " " {
                num += 1
            }
        }
        
        // Karakterin sayısı, istenilen tekrar sayısından büyük veya eşit olduğunda, o karakterin çıkarılması:
        if num >= repeatNum {
            resultChars = (resultChars.components(separatedBy: "\(char)")).joined(separator: "")
        }
    }
    
    return resultChars
}

print(findSimilar(chars: "aaba kouq bux", repeatNum: 2))

/**
 Output:
 koq x
 */
