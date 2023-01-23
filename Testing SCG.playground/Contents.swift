import UIKit


//1
func findMiddleIndex(arr: [Int]) -> String {
    let n = arr.count
    var leftSum = 0
    var rightSum = 0
    for i in 0..<n {
        rightSum += arr[i]
    }
    for i in 0..<n {
        rightSum -= arr[i]
        if leftSum == rightSum {
            return "middle index is \(i)"
        }
        leftSum += arr[i]
    }
    return "index not found"
}

print(findMiddleIndex(arr: [1, 3, 5, 7, 9]))
print(findMiddleIndex(arr: [3, 6, 8, 1, 5, 10, 1, 7]))
print(findMiddleIndex(arr: [3, 5, 6])) 

//2
func isPalindrome(word: String) -> String {
    let reversedWord = String(word.reversed())
    if word.lowercased() == reversedWord.lowercased() {
        return "\(word) is a palindrome"
    } else {
        return "\(word) isn't a palindrome"
    }
}

print(isPalindrome(word: "aka"))
print(isPalindrome(word: "Level"))
print(isPalindrome(word: "Hello"))
