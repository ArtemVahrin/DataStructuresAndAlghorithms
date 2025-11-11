//
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    var result = 0
//    var chars = [Character]()
//    for char in s {
//        if let index = chars.firstIndex(of: char) {
//            chars.removeSubrange(0...index)
//        }
//        chars.append(char)
//        print(chars)
//        result = max(result, chars.count)
//    }
//    
//    return result
//}
//lengthOfLongestSubstring("abcabcabc")


//func romanToInt(_ s: String) -> Int {
//    var result = 0
//    var romanValues: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
//    var prev: Int = 0
//    for c in s {
//        if let cur = romanValues[c] {
//            result += cur > prev ? (cur - 2 * prev) : cur
//            prev = cur
//        }
//    }
//    return result
// }
//romanToInt("IX")


//func majorityElement(_ nums: [Int]) -> Int {
//    var dict = [Int: Int]()
//    var result = 0
//    for num in nums {
//        if let val = dict[num] {
//            dict[num]! += 1
//        } else {
//            dict[num] = 1
//        }
//    }
//    
//    var sorted = dict.sorted(by: { $0.1 > $1.1 })
//    print(sorted)
//    return sorted.first!.key
//}
//
//majorityElement([3,3,4])


//func isHappy(_ n: Int) -> Bool {
//    func divideByDigitsAndSquare(_ num: Int) -> [Int] {
//        var nums = [Int]()
//        var num = num
//        while num > 0 {
//            nums.append(num % 10)
//            num /= 10
//        }
//        return nums.map( { $0 * $0 })
//    }
//    func sum(_ nums: [Int]) -> Int {
//        var result = 0
//        for num in nums {
//            result += num
//        }
//        return result
//    }
//    var num = sum(divideByDigitsAndSquare(n))
//    
//    while num > 6 {
//        print(num)
//        num = sum(divideByDigitsAndSquare(num))
//        if num != 1 && num < 9 {
//            return false
//        }
//    }
//    if num == 1 { return true }
//    return false
//}
//isHappy(1111111)



//func containsDuplicate(_ nums: [Int]) -> Bool {
//    var dict = [Int: Int]()
//    for num in nums {
//        if let val = dict[num] {
//            dict[num]! += 1
//            return true
//        } else {
//            dict[num] = 1
//        }
//    }
//    for (key,value) in dict {
//        
//    }
//    return false
//}
//containsDuplicate([1,2,3,1])


//func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
//    for i in 0..<(nums.count) {
//        for j in i+1..<min(i+k+1,nums.count)  {
//            print(i,j)
//            if nums[i] == nums[j]{
//                return true
//            }
//        }
//    }
//    return false
//}
//containsNearbyDuplicate([1,2,3,4,5,6,7,1], 7)




//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//import Foundation
//
//func countNodes(_ root: TreeNode?) -> Int {
//    guard let root = root else { return 0 }
//    
//    var leftDepth = treeDepth(root, true)
//    var rightDepth = treeDepth(root, false)
//    
//    if leftDepth == rightDepth {
//        return (1 << leftDepth) - 1
//    }
//    return countNodes(root.left) + countNodes(root.right) + 1
//    
//    func treeDepth(_ root: TreeNode?, _ isLeft: Bool) -> Int {
//        var depth = 0
//        var root = root
//        while root != nil {
//            root = isLeft ? root?.left : root?.right
//            depth += 1
//        }
//        return depth
//    }
//}

//func isPowerOfTwo(_ n: Int) -> Bool {
//    if n == 1 { return true }
//    if n == 0 { return false }
//    if n % 2 == 0  {
//        return isPowerOfTwo(n / 2)
//    }
//    return false
//}
//isPowerOfTwo(0)
//
//class MyQueue {
//    private var firstStack = [Int]()
//    private var secondStack = [Int]()
//
//    init(firstStack: [Int] , secondStack: [Int] ) {
//        self.firstStack = firstStack
//        self.secondStack = secondStack
//    }
//    
//    func push(_ x: Int) {
//        firstStack.append(x)
//    }
//    
//    func pop() -> Int {
//        secondStack = firstStack
//        var popElement = secondStack.removeFirst()
//
//        swap(&firstStack,&secondStack)
//        return popElement
//    }
//    
//    func peek() -> Int {
//        firstStack.first!
//    }
//    
//    func empty() -> Bool {
//        return firstStack.isEmpty && secondStack.isEmpty
//    }
//}
//
//var qwe = MyQueue(firstStack: [1],secondStack: [])
//
//
//qwe.push(1)
//qwe.empty()



//func isAnagram(_ s: String, _ t: String) -> Bool {
//    var chars1 = s.sorted()
//    var chars2 = t.sorted()
//    
//    if chars1 == chars2 {
//        return true
//    } else {
//        return false
//    }
//}


    func divideByDigits(_ num: Int) -> [Int] {
        var nums = [Int]()
        var num = num
        while num > 0 {
            nums.append(num % 10)
            num /= 10
        }
        return nums
    }
print(divideByDigits(123))
//
//func addDigits(_ num: Int) -> Int {
//    func divideByDigits(_ num: Int) -> [Int] {
//        var res = [Int]()
//        while num > 0 {
//            res.append(num % 10)
//            num / 10
//        }
//        return res
//    }
//    divideByDigits(123)
//    func sum(_ nums: [Int]) -> Int {
//        var sum = 0
//        for num in nums {
//            sum += num
//        }
//        return sum
//    }
//    num = sum(divideByDigits(num))
//    while num > 9 {
//        num = sum(divideByDigits(num))
//        print(num)
//    }
//    return num
//}
//addDigits(38)
