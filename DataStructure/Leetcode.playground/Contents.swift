import Foundation
//func addDigits(_ num: Int) -> Int {
//    var num = num
//    func divideByDigits(_ num: Int) -> [Int] {
//        var nums = [Int]()
//        var num = num
//        while num > 0 {
//            nums.append(num % 10)
//            num /= 10
//        }
//        return nums
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
//    }
//    return num
//}
//

//
//func isUgly(_ n: Int) -> Bool {
//    var n = n
//    if n == 0 { return false }
//    
//    while n > 1 {
//        if n % 2 == 0 { n /= 2 }
//        else if n % 3 == 0 { n /= 3 }
//        else if n % 5 == 0 { n /= 5 }
//        else { return false }
//    }
//    return n == 1
//}
//isUgly(1369479539)



//func moveZeroes(_ nums: inout [Int]) {
//    var l = 0
//    for r in 0..<nums.count {
//        if nums[r] != 0 {
//            nums.swapAt(l, r)
//            l += 1
//        }
//    }
//}
//var nums = [0,1,0,3,12]
//moveZeroes(&nums)
//func sumRange(_ left: Int, _ right: Int) -> Int {
//    return nums[left...right].reduce(0, +)
//}

//
//func isPowerOfThree(_ n: Int) -> Bool {
//    if n == 1 {
//        return true
//    }
//    if n <= 0 || n % 3 != 0 {
//        return false
//    }
//    return isPowerOfThree(n/3)
//}
//isPowerOfThree(2)

//
//func isPowerOfFour(_ n: Int) -> Bool {
//    var n = n
//    if n == 1 { return true }
//
//    if n <= 0 || n % 4 != 0 {
//        return false
//    }
//    return isPowerOfFour(n/4)
//}
//isPowerOfFour(16)

//func reverseString(_ s: inout [Character]) {
//    var p1 = 0
//    var p2 = s.count - 1
//    
//    while p1 < p2 {
//        s.swapAt(p1, p2)
//        p2 -= 1
//        p1 += 1
//    }
//}
//var s: [Character] = ["h","e","l","l","o"]
//reverseString(&s)

//func reverseVowels(_ s: String) -> String {
//    var vowels: [Character] = ["a","A","o","O","i","I","e","E","u","U"]
//    var s = Array(s)
//    var left = 0
//    var right = s.count - 1
//
//    while left < right {
//        if !vowels.contains(s[left]) {
//            left += 1
//            continue
//        }
//        if !vowels.contains(s[right]) {
//            right -= 1
//            continue
//        }
//        s.swapAt(left, right)
//        
//        left += 1
//        right -= 1
//    }
//
//    return String(s)
//}
//reverseVowels("leetcode")

//func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
//    var copyMagazine = magazine
//    
//    for rans in ransomNote {
//        if var idx = copyMagazine.firstIndex(of: rans) {
//            copyMagazine.remove(at: idx)
//        } else {
//            return false
//        }
//    }
//    return true
//}
//
//func findTheDifference(_ s: String, _ t: String) -> Character {
//    var dict: [Character: Int] = [:]
//    
//    for c in s {
//        dict[c,default: 0] += 1
//    }
//    
//    for c in t {
//        dict[c,default: 0] -= 1
//    }
//    return dict.first(where: { $0.value == -1 })!.key
//}
//
//findTheDifference("", "y")


//
//func countSegments(_ s: String) -> Int {
//    return s.split(separator: " ").count
//}

//func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//    var n = nums.count
//    var nums = Set(nums)
//    var res = [Int]()
//    for num in 1..<n+1 {
//        if !nums.contains(num) {
//            res.append(num)
//        }
//    }
//    return res
//}
//findDisappearedNumbers([1,1])

//class MyHashSet {
//    var buff: [Bool]
//
//    init() { buff = Array(repeating: false, count: 1000001) }
//    
//    func add(_ key: Int) {
//        buff[key] = true
//    }
//    
//    func remove(_ key: Int) {
//        buff[key] = false
//    }
//    
//    func contains(_ key: Int) -> Bool {
//        return buff[key]
//    }
//}

//func toHex(_ num: Int) -> String {
//    var hexaNums:[String] = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
//    var hex = String()
//    var n = num
//    
//    if num < 0 {
//        n += Int(pow(Double(2), Double(32)))
//    }
//    
//    while true {
//        let d = n % 16
//        hex = hexaNums[d] + hex
//        if n / 16 == 0 {
//            break
//        }
//        n /= 16
//    }
//    return hex
//}
//
//func isPalindrome(_ x: Int) -> Bool {
//    var str = String(x)
//    var revStr = String(str.reversed())
//    
//    return str == revStr
//}

//func longestCommonPrefix(_ strs: [String]) -> String {
//    var common = strs[0]
//    for str in strs {
//        while !str.hasPrefix(common) {
//            common = String(common.dropLast())
//        }
//    }
//    return common
//}
//longestCommonPrefix(["flower","flow","flight"])
//
//
//func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
//    var num = numerator
//    var den = denominator
//    var result = [String]()
//    
//    guard num != 0 else { return "0" }
//    
//    if (num < 0 && den > 0) || (num > 0 && den < 0) {
//        result.append("-")
//    }
//    
//    num = abs(num)
//    den = abs(den)
//    
//    result.append("\(num/den)")
//    num %= den
//    
//    guard num != 0 else { return result.joined()}
//    
//    result.append(".")
//    
//    var map: [Int: Int] = [:]
//    map[num] = result.count
//    
//    while num != 0 {
//        num *= 10
//        result.append("\(num/den)")
//        num %= den
//        if let value = map[num] {
//            let index = value
//            result.insert("(", at: index)
//            result.append(")")
//            break
//        } else {
//            map[num] = result.count
//        }
//    }
//    return result.joined()
//}
//fractionToDecimal(100,200)
//
//func earliestTime(_ tasks: [[Int]]) -> Int {
//    var res = [Int]()
//    for task in tasks {
//        res.append(task[0] + task[1])
//    }
//    return res.min()!
//}
//
//func maxKDistinct(_ nums: [Int], _ k: Int) -> [Int] {
//    var nums = Set(nums)
//    var result = [Int]()
//    
//    var sorted = nums.sorted(by: >)
//
//    for i in 0..<min(k, sorted.count) {
//        result.append(sorted[i])
//    }
//    return result
//}
//maxKDistinct([1,1,1,2,2,2], 6)

//func firstMissingPositive(_ nums: [Int]) -> Int {
//    var set = Set(nums)
//    for i in 0..<nums.count where !set.contains(i+1) {
//        return i + 1
//    }
//    return nums.count + 1
//}
//firstMissingPositive([1,2,0])
//
//func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
//    var sumA = aliceSizes.reduce(0, +), sumB = bobSizes.reduce(0, +)
//    var diff = (sumA - sumB) / 2
//
//    var sortedBob = bobSizes.sorted()
//    
//    for aliceCandy in aliceSizes {
//        var left = 0
//        var right = sortedBob.count - 1
//        
//        while left <= right {
//            let mid = left + (right - left) / 2
//            let bobCandy = sortedBob[mid]
//            let curDif = aliceCandy - bobCandy
//            
//            if curDif == diff { return [aliceCandy,bobCandy] }
//            else if curDif < diff {
//                right = mid - 1
//            } else { left = mid + 1}
//        }
//    }
//    return []
//}

//func countNegatives(_ grid: [[Int]]) -> Int {
//    var count = 0
//    var index = -1
//    for g in grid {
//        var low = 0, high = g.count - 1
//        
//        while low <= high {
//            let mid = low + (high - low) / 2
//            
//            if g[mid] >= 0 {
//                low = mid + 1
//            } else if g[mid] < 0 {
//                high = mid - 1
//                index = mid
//            }
//        }
//        if index == -1 {
//            count += 0
//        } else {
//            count += g.count - index
//        }
//    }
//    return count
//}
//countNegatives([[5,1,0],[-5,-5,-5]])

//func minimumTotal(_ triangle: [[Int]]) -> Int {
//    var dp = triangle.last!
//    
//    for row in stride(from: triangle.count - 2, through: 0, by: -1) {
//        for colunm in 0..<row {
//            dp[colunm] = triangle[row][colunm] + min (dp[colunm], dp[colunm+1])
//        }
//    }
//    return dp[0]
//}
//
//func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
//    var count = 0
//    var arr2 = arr2.sorted()
//    
//    for num in arr1 {
//        var low = 0
//        var high = arr2.count - 1
//        var valid = true
//        
//        while low <= high {
//            let mid = low + (high - low) / 2
//            
//            if abs(arr2[mid] - num) <= d {
//                valid = false
//                break
//            }
//            if arr2[mid] < num {
//                low = mid + 1
//            } else {
//                high = mid - 1
//            }
//        }
//        if valid {
//            count += 1
//        }
//    }
//    return count
//}
//var arr1 = [4,5,8], arr2 = [10,9,1,8], d = 2
//
//findTheDistanceValue(arr1, arr2, d)

//func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//    var ans = false
//    var arr = [Int]()
//    for arrays in matrix {
//        arr += arrays
//    }
//    
//    var low = 0
//    var high = arr.count - 1
//    
//    while low <= high {
//        let mid = low + (high - low) / 2
//        
//        if arr[mid] == target {
//            return true
//        } else if arr[mid] > target {
//            high = mid - 1
//        } else {
//            low = mid + 1
//        }
//    }
//    return ans
//}
//searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)

//func triangleNumber(_ nums: [Int]) -> Int {
//    guard nums.count >= 3 else { return 0 }
//    
//    let numsSorted = nums.sorted()
//    var count = 0
//    
//    for k in stride(from: nums.count - 1, through: 2, by: -1) {
//        var i = 0
//        var j = k - 1
//        
//        while i < j {
//            if numsSorted[i] + numsSorted[j] > numsSorted[k] {
//                count += j - i
//                j -= 1
//            } else {
//                i += 1
//            }
//        }
//    }
//    return count
//}

//func findNumbers(_ nums: [Int]) -> Int {
//    var ans = 0
//    
//    for num in nums {
//        var num = num
//        var count = 0
//        
//        while num > 0 {
//            num /= 10
//            count += 1
//        }
//        print(num)
//        if count % 2 == 0 {
//            ans += 1
//        }
//    }
//    return ans
//}
//func findNumbers(_ nums: [Int]) -> Int {
//    var count = 0
//    func isEvenDigits(_ num: Int) -> Bool {
//        var countOfDigits = String(num).count
//        return countOfDigits % 2 == 0 ? true : false
//    }
//    
//    for num in nums {
//        if isEvenDigits(num) {
//            count += 1
//        }
//    }
//    return count
//}
//findNumbers([580,317,640,957,718,764])


//func reverse(_ x: Int) -> Int {
//    var x = String(x)
//    var ans = ""
//    if x.first == "-" {
//        ans += "-"
//        x.removeFirst()
//    }
//    ans += x.reversed()
//    
//    if Int(ans)! > (Int(pow(2.0, 31))-1) || Int(ans)! < Int(pow(-2.0, 31)) {
//        return 0
//    } else {
//        return Int(ans)!
//    }
//}
//func reverse(_ x: Int) -> Int {
//    var curr: Int
//    var sign: Int
//    var res = 0
//    
//    if x >= 0 {
//        curr = x
//        sign = 1
//    } else {
//        curr = -x
//        sign = -1
//    }
//    
//    while curr != 0 {
//        let digit = curr % 10
//        res = res * 10 + digit
//        
//        if res >= Int32.max {
//            return 0
//        }
//        
//        curr /= 10
//    }
//        return sign * res
//}

//func myAtoi(_ s: String) -> Int {
//    var sign = 1
//    var ans = 0
//    var isStarted = false
//    for c in s {
//        if c == " " {
//            if isStarted {
//                break
//            }
//        } else if c == "-" || c == "+" {
//            if isStarted {
//                break
//            }
//            isStarted = true
//            if c == "-" {
//                sign = -1
//            }
//        } else if c >= "0" && c <= "9" {
//            isStarted = true
//            if let val = c.wholeNumberValue {
//                ans = ans * 10 + val
//            }
//            if ans > Int32.max {
//                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
//            }
//        } else {
//            break
//        }
//    }
//    return sign * ans
//}


//func intToRoman(_ num: Int) -> String {
//    var ans = ""
//    var remaining = num
//    var romanValues: [String: Int] = ["I": 1, "IV":4, "V": 5,"IX":9 ,"X": 10,"XL": 40, "L": 50, "XC": 90,"C": 100,"CD": 400, "D": 500,"CM": 900, "M": 1000]
//
//    for (numeral,value) in romanValues {
//        while remaining >= value {
//           ans += numeral
//            remaining -= value
//        }
//    }
//    return ans
//}

//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    if nums.isEmpty { return 0 }
//    var writeIndex = 1
//    for i in 1..<nums.count {
//        if nums[i] != nums[i - 1] {
//            nums[writeIndex] = nums[i]
//            writeIndex += 1
//        }
//    }
//    return writeIndex
//}
//
//func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//    if nums.isEmpty { return 0 }
//    var last = nums.count - 1
//    var first = 0
//
//    while first <= last {
//        if nums[first] == val {
//            nums.swapAt(first, last )
//            last -= 1
//        } else {
//            first += 1
//            
//        }
//        print(first,last,nums)
//    }
//    
//    return first
//}
//var nums = [3,2,2,3], val = 3
//removeElement(&nums, val)
//
//func strStr(_ haystack: String, _ needle: String) -> Int {
//    if let range = haystack.firstRange(of: needle) {
//        return haystack.distance(from: needle.startIndex, to: range.lowerBound)
//    } else {
//        return -1
//    }
//}
//strStr("sadbutsad", "sad")
//
//func divide(_ dividend: Int, _ divisor: Int) -> Int {
//    var denom = divisor
//    var dividend = dividend
//    var curr = 1
//    var ans = 0
//    
//    if denom > dividend {
//        return 0
//    }
//    if denom == dividend {
//        return 1
//    }
//    while denom <= divisor {
//        denom <<= 1
//        curr <<= 1
//    }
//    denom >>= 1
//    curr >>= 1
//    
//    while curr != 0 {
//        if dividend >= denom {
//            dividend -= denom
//            ans |= curr
//        }
//        curr >>= 1
//        denom >>= 1
//    }
//    return ans
//}
//
//func merge(_ intervals: [[Int]]) -> [[Int]] {
//    guard !intervals.isEmpty else { return [] }
//    var intervals = intervals.sorted(by: { $0[0] < $1[0] })
//    var ans = [[Int]]()
//    
//    var start = intervals[0][0]
//    var end = intervals[0][1]
//    
//    for interval in intervals {
//        guard end < interval[0] else {
//            end = max(end, interval[1])
//            continue
//        }
//        ans.append([start,end])
//        start = interval[0]
//        end = interval[1]
//    }
//    ans.append([start,end])
//    
//    return ans
//}
//merge([[1,4],[1,4]])


//func lengthOfLastWord(_ s: String) -> Int {
//    var arr = s.split(separator: " ")
//    
//    return arr.last?.count ?? -1
//}

//func plusOne(_ digits: [Int]) -> [Int] {
//    var digits = digits
//    var last = digits.count - 1
//
//    while last >= 0 {
//        if digits[last] < 9 {
//            digits[last] += 1
//            return digits
//        }
//        digits[last] = 0
//        last -= 1
//    }
//    return [1] + digits
//}
//plusOne([9,9])

//func largestTriangleArea(_ points: [[Int]]) -> Double {
//    var ans = 0.0
//    
//    for i in 0..<points.count {
//        for j in i+1..<points.count {
//            for k in j+1..<points.count {
//                let x1 = points[i][0]
//                let y1 = points[i][1]
//                let x2 = points[j][0]
//                let y2 = points[j][1]
//                let x3 = points[k][0]
//                let y3 = points[k][1]
//                
//                let area = abs(Double(x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2))) / 2.0
//                
//                ans = max(ans, area)
//            }
//        }
//    }
//    return ans
//}
//largestTriangleArea([[0,0],[0,1],[1,0],[0,2],[2,0]])
//
//func sortColors(_ nums: inout [Int]) {
//
//    if nums.count > 1 {
//        for i in 0..<nums.count - 1 {
//            for j in i + 1..<nums.count {
//                if nums[i] > nums[j] {
//                    nums.swapAt(i, j)
//                }
//            }
//        }
//    }
//}
//
//var nums = [1,2]
//sortColors(&nums)
//
//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    guard nums.count > 2 else { return nums.count }
//    var j = 1
//    var count = 1
//    
//    for i in 1..<nums.count {
//        if nums[i] == nums[i - 1] {
//            count += 1
//        } else {
//            count = 1
//        }
//        if count <= 2 {
//            nums[j] = nums[i]
//            j += 1
//        }
//    }
//    return j
//}
//var nums = [0,0,1,1,1,1,2,3,3]
//removeDuplicates(&nums)

//func sortArrayByParity(_ nums: [Int]) -> [Int] {
//    var odd = [Int]()
//    var even = [Int]()
//    
//    for num in nums {
//        if num % 2 == 0 {
//            even.append(num)
//        } else {
//            odd.append(num)
//        }
//    }
//    return even + odd
//}
//sortArrayByParity([1,0,3])


//func sortArrayByParityII(_ nums: [Int]) -> [Int] {
//    var odd = 1
//    var even = 0
//    var ans = nums
//
//    for (index,num) in nums.enumerated() {
//        if num % 2 == 0 {
//            ans[even] = num
//            even += 2
//        } else {
//            ans[odd] = num
//            odd += 2
//        }
//    }
//    return ans
//}
//sortArrayByParityII([4,2,5,7])
//
//func checkIfExist(_ arr: [Int]) -> Bool {
//    var set = Set<Int>()
//    
//    for num in arr {
//        if set.contains(num * 2) || (num % 2 == 0 && set.contains(num / 2)) { return true }
//        set.insert(num)
//    }
//    return false
//}
//checkIfExist([7,1,14,11])

//func sortByBits(_ arr: [Int]) -> [Int] {
//    return arr.sorted {
//        let bitsA = $0.nonzeroBitCount
//        let bitsB = $1.nonzeroBitCount
//
//        if bitsA == bitsB {
//            return $0 < $1
//        } else {
//            return bitsA < bitsB
//        }
//    }
//}
//sortByBits([1,3,7,0,2])

//func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
//    var count = 0
//    var ans = [Int]()
//    
//    for i in 0..<nums.count {
//        for j in 0..<nums.count where i != j {
//            if nums[i] > nums[j] {
//                count += 1
//            }
//        }
//        ans.append(count)
//        count = 0
//    }
//    return ans
//}

//func largestNumber(_ nums: [Int]) -> String {
//    var sorted = nums.map({ String($0) }).sorted { $0 + $1 > $1 + $0 }
//    
//    if sorted[0] == "0" {
//        return "0"
//    }
//    return sorted.joined()
//}

//func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
//    for i in 0..<nums.count {
//        for j in i+1..<min(i+indexDiff+1, nums.count) {
//            if abs(nums[i] - nums[j]) <= valueDiff {
//                return true
//            }
//        }
//    }
//    return false
//}

//func summaryRanges(_ nums: [Int]) -> [String] {
//    guard !nums.isEmpty else { return [] }
//
//    var ans = [String]()
//    var arrow = "->"
//
//    var left = nums[0]
//    var right = nums[0]
//
//    for p in 1..<nums.count {
//        if nums[p] - nums[p-1] == 1 {
//            right = nums[p]
//        } else if nums[p-1] + 1 != nums[p] {
//            ans.append(left == right ? "\(left)" : "\(left)\(arrow)\(right)")
//            left = nums[p]
//            right = nums[p]
//        }
//    }
//    ans.append(left == right ? "\(left)" : "\(left)\(arrow)\(right)")
//
//    return ans
//}
//
//summaryRanges([0,2,3,4,6,8,9])
//summaryRanges([0,1,2,4,5,7])
//summaryRanges([-1])

//func majorityElement(_ nums: [Int]) -> [Int] {
//    var minCount = nums.count / 3
//    var dict = [Int: Int]()
//    var ans = [Int]()
//
//    for num in nums {
//        dict[num,default: 0] += 1
//    }
//    for num in dict {
//        if num.1 > minCount {
//            ans.append(num.0)
//        }
//    }
//    return ans
//}
//majorityElement([3,2,3])

//
//func productExceptSelf(_ nums: [Int]) -> [Int] {
//    var prefix = Array(repeating: 1, count: nums.count)
//    var suffix = Array(repeating: 1, count: nums.count)
//    var ans = Array(repeating: 0, count: nums.count)
//
//    for i in 1..<nums.count {
//        prefix[i] = prefix[i-1] * nums[i-1]
//    }
//    for i in (0..<nums.count - 1).reversed() {
//        suffix[i] = suffix[i+1] * nums[i+1]
//    }
//    for i in 0..<nums.count {
//        ans[i] = prefix[i] * suffix[i]
//    }
//
//    return ans
//}
//productExceptSelf([1,2,3,4])


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//    if list1 == nil || list2 == nil { return list1 == nil ? list2 : list1}
//    
//    if  list1!.val <= list2!.val {
//        list1?.next = mergeTwoLists(list1?.next, list2)
//        return list1
//    } else {
//        list2?.next = mergeTwoLists(list1, list2?.next)
//        return list2
//    }
//}

//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//    var current = head
//    while current != nil && current!.next != nil {
//        if current?.val == current?.next?.val {
//            current?.next = current?.next?.next
//        } else {
//            current = current?.next
//        }
//    }
//    return head
//}

//func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//    var node = ListNode(0)
//    node.next = head
//
//    var curr: ListNode? = head
//    var prev: ListNode? = node
//
//    while curr != nil {
//        if curr!.val == val {
//            prev?.next = curr?.next
//        } else {
//            prev = curr
//        }
//        curr = curr?.next
//    }
//    return node.next
//}

//func reverseList(_ head: ListNode?) -> ListNode? {
//    var prev: ListNode?
//    var current = head
//    
//    while let node = current {
//        let next = node.next
//        node.next = prev
//        prev = node
//        current = next
//    }
//    return prev
//}

//func mergeAlternately(_ word1: String, _ word2: String) -> String {
//    var ans = ""
//    
//    for (ch1, ch2) in zip(word1, word2) {
//        ans += [ch1,ch2]
//        print(ans)
//    }
//    if word1.count < word2.count {
//        ans += word2[word1.endIndex...]
//    } else {
//        ans += word1[word2.endIndex...]
//    }
//    return ans
//}
//mergeAlternately("abcd", "pq")
//

//func strStr(_ haystack: String, _ needle: String) -> Int {
//    if let range = haystack.firstRange(of: needle) {
//        return haystack.distance(from: needle.startIndex, to: range.lowerBound)
//    } else {
//        return -1
//    }
//}
//strStr("abcd", "abc")

//
//func repeatedSubstringPattern(_ s: String) -> Bool {
//    var twice = s + s
//
//    twice.removeFirst()
//    twice.removeLast()
//
//    return twice.contains(s)
//}
//repeatedSubstringPattern("abcabc")
//
//func isMonotonic(_ nums: [Int]) -> Bool {
//    guard nums.count > 1 else { return true }
//    
//    var ans = false
//    var first = nums.first!
//    var last = nums.last!
//    
//    if last > first {
//        for i in 1 ..< nums.count {
//            if nums[i-1] <= nums[i] {
//                ans = true
//            } else {
//                return false
//            }
//        }
//    } else {
//        for i in 1 ..< nums.count {
//            if nums[i-1] >= nums[i] {
//                ans = true
//            } else {
//                return false
//            }
//        }
//    }
//    return ans
//}
//isMonotonic([1,2,2,3])
//
//func toLowerCase(_ s: String) -> String {
//    var intervalUplover = "A"..."Z"
//    var ans = ""
//    
//    for c in s {
//        if intervalUplover.contains(String(c)) {
//            ans += String(UnicodeScalar(c.asciiValue! + 32))
//        } else {
//            ans += String(c)
//        }
//    }
//    return ans
//}

//func calPoints(_ operations: [String]) -> Int {
//    var record = [Int]()
//    for operation in operations {
//        if operation != "+" && operation != "C" && operation != "D" {
//            record.append(Int(operation)!)
//        } else if operation == "C" {
//            record.popLast()
//        } else if operation == "D" {
//            record.append(record.last! * 2)
//        } else if operation == "+" {
//            var last = record.popLast()!
//            record.append(record.last! + last)
//            record.append(last)
//            record.swapAt(record.endIndex - 1, record.endIndex - 2)
//        }
//    }
//    return record.reduce(0, +)
//}
//calPoints(["5","2","C","D","+"])

//func judgeCircle(_ moves: String) -> Bool {
//    var start = (0,0)
//    for move in moves {
//        if move == "U" {
//            start.0 += 1
//        } else if move == "D" {
//            start.0 -= 1
//        } else if move == "R"{
//            start.1 += 1
//        } else {
//            start.1 -= 1
//        }
//    }
//    return start == (0,0)
//}
//
//func isRobotBounded(_ instructions: String) -> Bool {
//    var curPos = [0,0]
//    var direction = [1,0]
//    
//    for instruction in instructions {
//        switch instruction {
//        case "G":
//            curPos = [curPos[0] + direction[0], curPos[1] + direction[1]]
//        case "L":
//            direction = [direction[1], -direction[0]]
//        case "R":
//            direction = [-direction[1], direction[0]]
//        default:
//            continue
//        }
//    }
//    if curPos == [0, 0] || direction != [1,0] {
//        return true
//    } else {
//        return false
//    }
//}
//isRobotBounded("RLLGLRRRRGGRRRGLLRRR")
//
//func diagonalSum(_ mat: [[Int]]) -> Int {
//    guard mat.count > 1 else { return mat.first!.first! }
//    var sum = 0
//    for i in 0..<mat.count {
//        sum += mat[i][i]
//        sum += mat[mat.count - i - 1][i]
//        print(mat[i][i],mat[mat.count - i - 1][i])
//    }
//    if mat.count % 3 == 0 && mat.count % 2 != 0{
//        sum -= mat[mat.count/2][mat.count/2]
//    }
//    return sum
//}
//diagonalSum([[6,3,1,10,7,4],
//             [4,10,1,9,5,10],
//             [5,5,7,3,8,5],
//             [2,7,6,4,7,6],
//             [7,9,6,1,8,5],
//             [1,7,9,5,8,4]])


//func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//    guard !matrix.isEmpty, !matrix[0].isEmpty else {
//        return []
//    }
//    
//    var result: [Int] = []
//    var top = 0
//    var bottom = matrix.count - 1
//    var left = 0
//    var right = matrix[0].count - 1
//    
//    while top <= bottom && left <= right {
//        if left <= right {
//            for i in left...right {
//                result.append(matrix[top][i])
//            }
//            top += 1
//        }
//        
//        if top <= bottom {
//            for i in top...bottom {
//                result.append(matrix[i][right])
//            }
//            right -= 1
//        }
//        if top <= bottom && left <= right {
//            for i in stride(from: right, through: left, by: -1) {
//                result.append(matrix[bottom][i])
//            }
//            bottom -= 1
//        }
//        
//        if left <= right && top <= bottom {
//            for i in stride(from: bottom, through: top, by: -1) {
//                result.append(matrix[i][left])
//            }
//            left += 1
//        }
//    }
//    
//    return result
//}
//spiralOrder([[1,2,3],[4,5,6],[7,8,9]])

//func average(_ salary: [Int]) -> Double {
//    var minVal = 1000000
//    var maxVal = 0
//    var count = 0
//    
//    for i in 0..<salary.count {
//        if salary[i] < minVal {
//            minVal = min(minVal, salary[i])
//        }
//        if salary[i] > maxVal {
//            maxVal = max(maxVal, salary[i])
//        }
//        count += salary[i]
//    }
//    return Double((count - minVal - maxVal))/Double((salary.count - 2))
//}
//average([4000,3000,1000,2000])

//func largestPerimeter(_ nums: [Int]) -> Int {
//    var sorted = nums.sorted(by: >)
//    
//    for i in 0..<sorted.count - 2 {
//        if sorted[i+2] + sorted[i+1] > sorted[i] {
//            return (sorted[i+2] + sorted[i+1] + sorted[i])
//        }
//    }
//    return 0
//}
//largestPerimeter([1,2,1,10])
//
//func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
//    let coordinates = coordinates.map { $0.map { Double($0) } }
//
//    let A = coordinates[0]
//    let B = coordinates[1]
//    
//    if A[0] == B[0] {
//        return coordinates.allSatisfy { $0[0] == A[0] }
//    }
//    
//    let k = (A[1] - B[1]) / (A[0] - B[0])
//    let b = A[1] - k * A[0]
//    
//    return coordinates.allSatisfy { $0[1] == $0[0] * k + b }
//}

//func addBinary(_ a: String, _ b: String) -> String {
//    var a = Array(a)
//    var b = Array(b)
//    var p1 = a.count - 1
//    var p2 = b.count - 1
//    var carry = 0
//    var ans = [Int]()
//    
//    while p1 >= 0 || p2 >= 0 || carry != 0 {
//        var sum = carry
//        
//        if p1 >= 0, a[p1] == "1" { sum += 1}
//        if p2 >= 0, b[p2] == "1" { sum += 1}
//        
//        let digit = sum % 2
//        carry = sum / 2
//        ans.append(digit)
//        
//        p1 -= 1
//        p2 -= 1
//    }
//    return ans.map { String($0) }.reversed().joined()
//}
//
//addBinary("11", "1")


//func maxArea(_ height: [Int]) -> Int {
//    var maxArea = Int.min
//    var i = 0
//    var j = height.count - 1
//    
//    while i < j {
//        let area = min(height[i],height[j]) * (j - i)
//        
//        maxArea = max(maxArea,area)
//        
//        if height[i] > height[j] {
//            j -= 1
//        } else {
//            i += 1
//        }
//    }
//    return maxArea
//}
//maxArea([1,1])
//
//func findEvenNumbers(_ digits: [Int]) -> [Int] {
//    var ans = Set<Int>()
//    for (index1, element1) in digits.enumerated() where element1 != 0 {
//        for (index2, element2) in digits.enumerated() where index1 != index2 {
//            for (index3, element3) in digits.enumerated() where element3 % 2 != 1 && index1 != index3 && index3 != index2 {
//                let str = String(element1) + String(element2) + String(element3)
//                ans.insert(Int(str)!)
//            }
//        }
//    }
//    return ans.sorted()
//}
//findEvenNumbers([2,1,3,0])

//func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
//    var ans = [Int]()
//    var count = 0
//    var potions = potions.sorted()
//
//    
//    for spell in spells {
//        var low = 0
//        var high = potions.count - 1
//        var firstSuccessfulIndex = potions.count
//
//        while low <= high {
//            let mid = low + (high - low) / 2
//            
//            if potions[mid] * spell >= success {
//                firstSuccessfulIndex = mid
//                high = mid - 1
//            } else if potions[mid] * spell < success {
//                low = mid + 1
//            }
//        }
//        ans.append(potions.count - firstSuccessfulIndex)
//    }
//    return ans
//}
//successfulPairs([3,1,2], [8,5,8], 16)
//
//func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    func binSearch(_ low: Int,_ high: Int,_ target: Int) -> Int {
//        var ans = -1
//        var low = low
//        var high = high
//        
//        while low <= high {
//            let mid = low + (high - low) / 2
//            
//            if nums1[mid] == target {
//                return mid
//            } else if nums1[mid] > target {
//                high = mid - 1
//            } else {
//                low = mid + 1
//            }
//        }
//        return ans
//    }
//    var ans = [Int]()
//    var nums2 = nums2.sorted()
//    var nums1 = nums1.sorted()
//    
//    for num2 in nums2 {
//        var low = 0
//        var high = nums1.count - 1
//        
//        var res = binSearch(low, high, num2)
//        
//        if res != -1 {
//            ans.append(num2)
//        }
//    }
//    return ans
//}
//
//
//func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    var nums1 = nums1.sorted()
//    var nums2 = nums2.sorted()
//    var ans = [Int]()
//    var i = 0
//    var j = 0
//    
//    while i < nums1.count && j < nums2.count {
//        if nums1[i] == nums2[j] {
//            ans.append(nums1[i])
//            i += 1
//            j += 1
//        } else if nums1[i] < nums2[j] {
//            i += 1
//        } else {
//            j += 1
//        }
//    }
//    return ans
//}
//intersect([4,9,5], [9,4,9,8,4])

//
//func generate(_ numRows: Int) -> [[Int]] {
//    var ans = [[Int]](repeating: [Int](), count: numRows)
//
//    for i in 0..<numRows {
//        ans[i] = [Int](repeating: 0, count: i+1)
//
//        for j in 0..<i+1 {
//            if j == 0 || j == i {
//                ans[i][j] = 1
//            } else {
//                ans[i][j] = ans[i-1][j-1] + ans[i-1][j]
//            }
//        }
//    }
//
//    return ans
//}

//func getRow(_ rowIndex: Int) -> [Int] {
//    func generate(_ numRows: Int) -> [[Int]] {
//        var ans = [[Int]](repeating: [Int](), count: numRows)
//
//        for i in 0..<numRows {
//            ans[i] = [Int](repeating: 0, count: i+1)
//
//            for j in 0..<i+1 {
//                if j == 0 || j == i {
//                    ans[i][j] = 1
//                } else {
//                    ans[i][j] = ans[i-1][j-1] + ans[i-1][j]
//                }
//            }
//        }
//        return ans
//    }
//    
//    return generate(rowIndex + 1).last!
//
//}
//getRow(6)

//func isSubsequence(_ s: String, _ t: String) -> Bool {
//    var i = 0
//    var j = 0
//    var s = Array(s)
//    var t = Array(t)
//    var count = 0
//    
//    while i < t.count && j < s.count {
//        if s[j] == t[i] {
//            count += 1
//            j += 1
//        }
//        i += 1
//    }
//    return count == s.count ? true : false
//}
//isSubsequence("b", "abc")

//func triangularSum(_ nums: [Int]) -> Int {
//    var nums = nums
//    
//    while nums.count > 1 {
//        for i in 1..<nums.count {
//            let sum = nums[i-1] + nums[i]
//            nums[i-1] = sum % 10
//        }
//        nums.removeLast()
//    }
//    return nums[0]
//}
//triangularSum([1,2,3,4,5])

//
//func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
//    var numBottles = numBottles
//    var empty = 0
//    var ans = 0
//
//    while numBottles != 0 {
//        numBottles -= 1
//        empty += 1
//        ans += 1
//        
//        if empty == numExchange {
//            empty = 0
//            numBottles += 1
//        }
//    }
//    return ans
//}
//numWaterBottles(9, 3)

//
//func maxBottlesDrunk(_ numBottles: Int, _ numExchange: Int) -> Int {
//    var numBottles = numBottles
//    var numExchange = numExchange
//    var empty = numBottles
//    var ans = numBottles
//    
//    while empty > numExchange {
//        empty -= numExchange
//        numExchange += 1
//        empty += 1
//        ans += 1
//    }
//    return ans
//}
//maxBottlesDrunk(1, 2)

//
//func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
//    if target == "z" {
//        return letters[0]
//    }
//
//    var low = 0
//    var high = letters.count - 1
//    var ans = -1
//
//    while low <= high {
//        let mid = low + (high - low) / 2
//        
//        if letters[mid] > target {
//            ans = mid
//            high = mid - 1
//        } else {
//            low = mid + 1
//        }
//    }
//    if ans == -1 {
//        return letters.last!
//    }
//    return letters[ans]
//}
//nextGreatestLetter(["c","f","j","j"], "j")

func countNegatives(_ grid: [[Int]]) -> Int {
    var count = 0
    
    for g in grid {
        var index = -1
        var low = 0
        var high = g.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            
            if g[mid] < 0 {
                index = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        if index == -1 {
            count += 0
        } else {
            count += g.count - index
        }
    }
    return count
}


countNegatives([[3,2],[1,0]])
