//Design/author iterative and recursive solutions for the following problems. What is the time and space complexity of each approach?
//Reverse the elements in an integer array in place.
private func reverseRecursion(_ array:[Int], _ index: Int) -> [Int]? {
    var array = array
    let length = array.count - 1
    
    if index > (length / 2) {
        return array
    } else {
        let temp = array[index]
        array[index] = array[length - index]
        array[length - index] = temp
        return reverseRecursion(array, index + 1)
    }
}

func reverse(_ array: [Int]) -> [Int]? {
    if !array.isEmpty {
        return reverseRecursion(array, 0)
    }
    
    return nil
}

//Check if a given input string is a palindrome. Return true if it is, false otherwise.
private func palindromeRecursion(_ str: String, left: Int, right: Int) -> Bool {
    if left >= right {
        return true
    }
    
    let lhs = str[str.index(str.startIndex, offsetBy: left)]
    let rhs = str[str.index(str.startIndex, offsetBy: right)]
    
    if lhs != rhs {
        return false
    }
    
    return palindromeRecursion(str, left: left + 1, right: right - 1)
}

func palindrome(_ text: String) -> Bool {
    if !text.isEmpty {
        return palindromeRecursion(text.lowercased(), left: 0, right: text.characters.count - 1)
    }
    
    return false
}

//[Challenge] Return the nth Fibonacci number in the Fibonacci series starting at 0. (Hint: Fibonacci series: 0, 1, 1, 2, 3, 5, 8, 13 … The next number in the Fibonacci series is the sum of the previous two.)
func nthFibonacciNumber(_ n: Int) -> Int? {
    if n >= 0 {
        return n < 2  ? n : (nthFibonacciNumber(n - 1)! + nthFibonacciNumber(n - 2)!)
    }
    
    return nil
}


// test code for reverse(_ array:[Int])
print("Reversing [1, 2, 3, 4]: ")
print(reverse([1, 2, 3, 4])! == [4, 3, 2, 1] ? [4, 3, 2, 1] : "ERROR: EXPECTING [4, 3, 2, 1]")
print("\nReversing [1, 2, 3, 4, 5]: ")
print(reverse([1, 2, 3, 4, 5])! == [5, 4, 3, 2, 1] ? [5, 4, 3, 2, 1] :  "ERROR: EXPECTING [5, 4, 3, 2, 1]")
print("\nReversing []")
print(reverse([]) == nil ? "nil" : "ERROR: EXPECTING nil")

// test code for palindrome(_ text: String)
print("\nChecking that RACECAR is a palindrome:")
print(palindrome("Racecar") == true ? "true" : "ERROR: EXPECTING true")
print("\nChecking that APPLE is not a palindrome:")
print(palindrome("Apple") == false ? "false" : "ERROR: EXPECTING false")
print("\nChecking that EMPTY STRING is not a palindrome:")
print(palindrome("") == false ? "false" : "ERROR: EXPECTING false")

// test code for nthFibonacciNumber(_ n: Int)
print("\nChecking first ten fibonacci number")
var n = 0
let numbers = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

while n < 10 {
    print(nthFibonacciNumber(n)! == numbers[n] ? numbers[n] : "ERROR: EXPECTING \(numbers[n])")
    n += 1
}
