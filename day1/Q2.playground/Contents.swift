import UIKit

/**
 2 - Elimizde uzun bir cümle olsun, Bazı kelimeler tekrar edecek bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız.
  string = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim . "
*/

func wordNum (sentence: String) {
    
    // Cümledeki her sözcüğü boşluklardan ayırma ve bir sözcük arrayi oluşturma işlemi
    var words = sentence.components(separatedBy: " ")
    
    // Cümlede bağımsız ve sözcüklere bitişik olan noktaları silme işlemi
    for i in 0..<words.count {
        words[i] = (words[i].components(separatedBy: ".")).joined(separator: "")
    }
    
    // Sözcük dışı öğeleri arrayden çıkarma işlemi
    for word in words {
        if word == "", let index = words.firstIndex(of: word) {
            words.remove(at: index)
        }
    }
    
    // Arrayden bir set oluşturma işlemi. Set içerisinde her eleman bir tane bulunur.
    let setWords = Set(words)
    
    // Set içerisindeki öğelerin arrayde kaç tane olduğunu bulmak için:
    for setWord in setWords {
        var num = 0
        for word in words {
            if setWord == word {
                num += 1
            }
        }
        
        // Her sözcükten kaç tane varsa yazılır:
        print("\(setWord) : \(num) adet")
    }
}

wordNum(sentence: "merhaba nasılsınız. iyiyim siz nasılsınız. ben de iyiyim. ")

 /**
 Output:
 merhaba : 1 adet
 iyiyim : 2 adet
 nasılsınız : 2 adet
 siz : 1 adet
 de : 1 adet
 ben : 1 adet
 */
