import UIKit

//MARK: Girilen bir sayının asal olup olmadığını bulan bir extension yazınız

extension Int {
    func isPrime() -> Bool {
        
        guard self >= 2 else { // Return false if number is less than 2
            print("\(self) is not prime.")
            return false
        }
        
        let maxNum = Int(sqrt(Double(self))) // optimization
        
        for i in 2..<maxNum {
            if self % i == 0 { // Return false if number is divisible by any number smaller than itself
                print("\(self) is not prime.")
                return false
            }
        }
        print("\(self) is prime.") // For all other cases, the number is prime.
        return true
    }
}
53873483.isPrime() // 53873483 is not prime.
101.isPrime() // 101 is prime.


// MARK:- İki parametreli ve FARKLI tipli bir generic örneği yapınız... (T, U) ???

struct School<Key: Hashable, FirstValue, SecondValue: BinaryFloatingPoint> {
    var students = [Key : (FirstValue,SecondValue)]()
    
    mutating func addStudent(number: Key, name: FirstValue, grade: SecondValue) {
        students[number] = (name, grade)
    }
    
    mutating func printStudents() {
        for var student in students {
            if student.value.1 <= 5 {
                student.value.1 = student.value.1 * 20
                print("Student Number: \(student.key), Name: \(student.value.0), Grade: \(student.value.1)")
            } else {
                print("Student Number: \(student.key), Name: \(student.value.0), Grade: \(student.value.1)")
            }
        }
    }
}
var class1 = School<Int, String, Double>()
class1.addStudent(number: 12, name: "Nihal", grade: 3.73)
class1.addStudent(number: 13, name: "Nil", grade: 82.5)
class1.addStudent(number: 14, name: "Niloya", grade: 4)
class1.addStudent(number: 15, name: "Nihal", grade: 85)
class1.printStudents()
/*
 Output:
 Student Number: 15, Name: Nihal, Grade: 85.0
 Student Number: 14, Name: Niloya, Grade: 80.0
 Student Number: 13, Name: Nil, Grade: 82.5
 Student Number: 12, Name: Nihal, Grade: 74.6
 */

//MARK: Euler project 6 and 7

/**
 https://projecteuler.net/problem=6
 6. Sum square difference
 The sum of the squares of the first ten natural numbers is, 1² + 2² + 3² + ... + 10² = 385
 The square of the sum of the first ten natural numbers is, (1 + 2 + 3 + ... + 10)² = 3025
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is, 3025 - 385 = 2640
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

// 1ST WAY
// Function to find the difference between the sum of the squares of the first "n" natural numbers and the square of the sum
func findDifference(numbersUpTo: Int) {
    
    //Formula for finding the sum of natural numbers up to "n": n * (n + 1) / 2
    let sumOfNumbers = numbersUpTo * (numbersUpTo + 1) / 2
    
    /*
     Formula for finding the sum of the squares of natural numbers up to "n":
     n * (n + 1) * (2n + 1) / 6
     = [n * (n + 1) / 2] * [(2n + 1) / 3]
     = sumOfNumbers * [(2n + 1) / 3]
     */
    
    // The sum of the squares
    let sumOfSquares = sumOfNumbers * (2 * numbersUpTo + 1) / 3
    
    // The square of the sums = sumOfNumbers * sumOfNumbers
    let squareOfSums = pow(Double(sumOfNumbers), 2.0)
    
    // To print the difference to the screen
    print("The difference between the sum of the squares of the first \(numbersUpTo) natural numbers and the square of the sum: \(Int(squareOfSums) - sumOfSquares)")
}
findDifference(numbersUpTo: 10)
// The difference between the sum of the squares of the first 10 natural numbers and the square of the sum: 2640

findDifference(numbersUpTo: 100)
// The difference between the sum of the squares of the first 100 natural numbers and the square of the sum: 25164150


// 2ND WAY
// Function that finds the sum of the squares:
func sumOfSquares(numbersUpTo: Int) -> Int {
    var sumOfSquare = 0
    for number in 1...numbersUpTo {
        sumOfSquare += Int(pow(Double(number), 2.0))
    }
    return sumOfSquare
}

// Function that finds the squares of the sums:
func squareOfSums(numbersUpTo: Int) -> Int {
    var squareOfSums = 0
    for number in 1...numbersUpTo {
        squareOfSums += number
    }
    return Int(pow(Double(squareOfSums), 2.0))
}

// Function that finds the difference between the squares of the sums and the sum of the squares
func findDiff(numbersUpTo: Int) -> Int {
    return squareOfSums(numbersUpTo: numbersUpTo) - sumOfSquares(numbersUpTo: numbersUpTo)
}
findDiff(numbersUpTo: 10) // 25164150


/**
 https://projecteuler.net/problem=7
 7.  10001st prime
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */

// prime number function
func isPrimeNumber(number: Int) -> Bool {
    if number == 2 || number == 3 {
        return true
    }
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Function to find the n. prime number
func findPrimeNumber(primeNumberOrder: Int) {
    guard primeNumberOrder != 0 else {
        print("Invalid prime number order entered: \(primeNumberOrder)")
        return
    }
    
    var number = 1
    var numberOrder = 0
    
    while numberOrder < primeNumberOrder  {
        number += 1
        if isPrimeNumber(number: number) {
            numberOrder += 1
        }
    }
    print(number)
}
findPrimeNumber(primeNumberOrder: 10001) // 104743

// guard let works
findPrimeNumber(primeNumberOrder: 0) // Invalid prime number order entered: 0


//MARK: If let - guard let kullanım tercihini neye göre belirlersiniz?
/*
 guard let, if let'in özel hali gibi düşünülebilir. if let func dışında da kullanılabilir. guard let, func içinde bir variable ın istenen koşulu sağlamadığı durumda return ile func'tan çıkabilir. Basitçe örneklendirilirse;
 
 func findPrimeNumber(primeNumberOrder: Int) {
     guard primeNumberOrder != 0 else {
         print("Invalid prime number order entered: \(primeNumberOrder)")
         return
     }
     print(primeNumberOrder)
 }
 
 Örnek kodda, primeNumberOrder parametresi 0 olduğunda else bloğuna girilir ve return ile func'tan doğrudan çıkılır.
 
 Eğer bu kodda birden fazla koşulun kontrolü sağlanmak istenirse, if let ile yazma durumunda iç içe if let'ler olur. Bu da hem kodu uzatır, hem de çözümü yavaşlatır.
 Ancak, guard let ile yazıldığında, her koşul ayrı ayrı denenir, istenmeyen ilk koşulda func'tan doğrudan çıkılır.
 Kullanım tercihi, genel olarak func içinde birden fazla koşul varsa tüm koşullar sağlanmak istendiğinde guard let'ten yana olabilir. İkisi için de geçerli olarak, bir kodda optional variable ın nil değerde olup olmamasına göre ne yapılacağını belirtmek için kullanılabilir.
 */

 var name: String = "Nihal"
 var secondName: String? = nil // Not everyone has a second name. Therefore, the secondName variable is defined as optional and it can take a nil value.
 var surname = "Kıran"

if let secName = secondName {
    print("\(name) have a second name. Name: \(name), Second Name: \(secName) Surname: \(surname)")
} else {
    print("\(name) doesn't have a second name. Name: \(name), Surname: \(surname)")
}
//  Output: Nihal doesn't have a second name. Name: Nihal, Surname: Kıran
 
func hasSecondName() {
    guard let secName = secondName else {
        print("\(name) doesn't have a second name. Name: \(name), Surname: \(surname)")
        return
    }
    print("\(name) has a second name. Name: \(name), Second Name: \(secName) Surname: \(surname)")
}
hasSecondName() // Nihal doesn't have a second name. Name: Nihal, Surname: Kıran

// The output of both codes will be the same.


//MARK: static keyword neden kullanırız. Örnek bir kullanım yapınız

