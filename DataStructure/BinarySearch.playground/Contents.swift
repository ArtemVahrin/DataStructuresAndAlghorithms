import Foundation
let arr = [1,2,3,4,5,6,7]
// recursive method
func binarySearchRecursive(_ sortedArray: [Int], _ key: Int, lowElement: Int, highElement: Int) -> Int {
    if lowElement > highElement { return -1 }
    var midElement = lowElement + (highElement - lowElement) / 2
    if sortedArray[midElement] == key { return midElement }
    if sortedArray[midElement] < key { return binarySearchRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement)}
    return binarySearchRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1)
}
//itterative method
func binarySearch(_ sortedArray: [Int], _ key: Int) -> Int {
    var lowElement = 0
    var highElement = sortedArray.count - 1
    while lowElement <= highElement {
        let midElement = lowElement + (highElement - lowElement) / 2
        if sortedArray[midElement] == key { return midElement }
        else if sortedArray[midElement] < key { lowElement = midElement + 1 }
        else if sortedArray[midElement] > key { highElement = midElement - 1 }
    }
    return -1
}

// lower bound - нахождение элемента большего или равного заданному

//func lowerBoundRecursive(_ sortedArray: [Int], _ key: Int, lowElement: Int = -1, highElement: Int = -1) -> Int {
//    if lowElement > highElement { return 2222222222 }
//    if lowElement == -1 { let lowElement = 0 }
//    if highElement == -1 { let highElement = sortedArray.count - 1 }
//    let midElement = lowElement + (highElement - lowElement) / 2
//    if sortedArray[midElement] <= key { return lowerBoundRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement) }
//    return min(midElement,lowerBoundRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1))
//}

func lowerBound(_ sortedArray: [Int], _ key : Int) -> Int { //если в массиве есть элемент == target этот алгоритм не применять
    var lowElement = 0
    var highElement = sortedArray.count - 1
    var answer = -1
    while lowElement <= highElement {
        let midElement = lowElement + (highElement - lowElement) / 2
        if sortedArray[midElement] < key {
            lowElement = midElement + 1
        } else if sortedArray[midElement] > key {
            answer = midElement
            highElement = midElement - 1
        }
    }
    return answer
}


// upper bound - нахождение элемента больше заданного. чем ближе элемент тем лучше

//func upperBoundRecursive(_ sortedArray: [Int], _ key: Int, lowElement: Int = -1, highElement: Int = -1) -> Int {
//    if lowElement > highElement { return  2222222 }
//    if lowElement == -1 { lowElement = 0 }
//    if highElement == -1 { highElement = sortedArray.count - 1 }
//    let midElement = lowElement + (highElement - lowElement) / 2
//    if sortedArray[midElement] <= key { return upperBoundRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement) }
//    return min(midElement, upperBoundRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1) )
//}

func upperBound(_ sortedArray: [Int], _ key : Int) -> Int {
    var lowElement = 0
    var highElement = sortedArray.count - 1
    var answer = -1
    while lowElement <= highElement {
        let midElement = lowElement + (highElement - lowElement) / 2
        if sortedArray[midElement] <= key {
            lowElement = midElement + 1
        } else if sortedArray[midElement] > key {
            answer = midElement
            highElement = midElement - 1
        }
    }
    return answer
}


func binarySearchFirstElementRecursive(_ sortedArray: [Int], _ key: Int, lowElement: Int , highElement: Int ) -> Int {
    if lowElement > highElement { return 2222222 }
    let midElement = lowElement + (highElement - lowElement) / 2
    if sortedArray[midElement] < key { return binarySearchFirstElementRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement) }
    if sortedArray[midElement] > key { return binarySearchFirstElementRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1) }
    return min(midElement, binarySearchFirstElementRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1))// проверяем самое левое ли значение мы нашли
}
func binarySearcFirstElement(_ sortedArray: [Int], _ key: Int) -> Int {
    var lowElement = 0
    var highElement = sortedArray.count - 1
    var answer = -1
    while lowElement <= highElement {
        let midElement = lowElement + (highElement - lowElement) / 2
        if sortedArray[midElement] < key { lowElement = midElement + 1 }
        else if sortedArray[midElement] == key {
            answer = midElement
            highElement = midElement - 1
        } else if sortedArray[midElement] > key { highElement = midElement - 1 }
    }
    return answer
}


func binarySearcLastElementRecursive(_ sortedArray: [Int], _ key: Int, lowElement: Int , highElement: Int ) -> Int {
    if lowElement > highElement { return -1 }
    let midElement = lowElement + (highElement - lowElement) / 2
    if sortedArray[midElement] < key { return binarySearcLastElementRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement) }
    if sortedArray[midElement] > key { return binarySearcLastElementRecursive(sortedArray, key, lowElement: lowElement, highElement: midElement - 1) }
    return max(midElement, binarySearcLastElementRecursive(sortedArray, key, lowElement: midElement + 1, highElement: highElement ))// проверяем крайнее ли значение мы нашли
}

func binarySearcLastElement(_ sortedArray: [Int], _ key: Int) -> Int {
    var lowElement = 0
    var highElement = sortedArray.count - 1
    var answer = -1
    
    while lowElement <= highElement {
        let midElement = lowElement + (highElement - lowElement) / 2
        if sortedArray[midElement] < key { lowElement = midElement + 1 }
        else if sortedArray[midElement] == key {
            answer = midElement
            lowElement = midElement + 1
        } else if sortedArray[midElement] > key { highElement = midElement - 1 }
    }
    return answer
}

func isPerfectSquare(_ num: Int) -> Bool {
    var low = 0
    var high = ( num + 1 ) / 2
    
    while low <= high {
        let mid = low + (high - low) / 2
        if mid * mid > num {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    if (low - 1)  * (low - 1)  == num {
        return true
    } else {
        return false
    }
}


func guessNumber(_ n: Int) -> Int {
    func guess(_ n: Int) -> Int {
        var pick = 12
        if n > pick { return -1 }
        else if n < pick { return 1 }
        else { return 0 }
    }
    
    var low = 0
    var high = n
    var ans = -1
    while low <= high {
        let mid = low + (high - low) / 2
        if guess(mid) == 0 {
            ans = mid
            break
        } else if guess(mid) == -1 {
            high = mid - 1
        } else if guess(mid) == 1 {
            low = mid + 1
        }
    }
    return ans
}


var mat =
[[1,1,0,0,0],
 [1,1,1,1,0],
 [1,0,0,0,0],
 [1,1,0,0,0],
 [1,1,1,1,1]]
var k: Int = 3
var numOf1 = [Int]()
var dict: [Int: Int] = [:]
var ans = [Int]()

func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    var numOf1 = [Int]()
    var dict: [Int: Int] = [:]
    var ans = [Int]()
    
    for row in mat {
        numOf1.append(row.count(where: { $0 == 1 }))
    }
    for index in numOf1.indices {
        dict[index] = numOf1[index]
    }
    var sortedDict = dict.sorted { a, b in
        if a.value == b.value {
            return a.key < b.key
        }
        return a.value < b.value
        
    }
    print(sortedDict)
    for i in 0..<k {
        ans.append(sortedDict[i].key)
    }
    return ans
}
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var low1 = 0
    var low2 = 0
    var high1 = nums1.count - 1
    var high2 = nums2.count - 1
    var answer = 0.0
    var sumArray: [Int]
    var index = 0
    var nums1 = nums1
    var nums2 = nums2
    
    if nums1.isEmpty || nums2.isEmpty {
        sumArray = nums1 + nums2
    } else if nums1[high1] <= nums2[low2]  {
        sumArray = nums1 + nums2
    } else if nums1[low1] > nums2[low2] {
        while low2 <= high2 {
            let mid2 = low2 + (high2 - low2) / 2
            if nums2[mid2] <= nums1[low1] { //mb nums1[high1]
                low2 = mid2 + 1
            } else if nums2[mid2] > nums1[low1] {
                index = mid2
                high2 = mid2 - 1
            }
        }
        nums2.insert(contentsOf: nums1, at: index)
        sumArray = nums2
        
    } else {
        while low1 <= high1 {
            let mid1 = low1 + (high1 - low1) / 2
            if nums1[mid1] <= nums2[low2] {
                low1 = mid1 + 1
            } else if nums1[mid1] > nums2[low2] {
                index = mid1
                high1 = mid1 - 1
            }
        }
        nums1.insert(contentsOf: nums2, at: index)
        sumArray = nums1
    }
    sumArray.sort()
        if sumArray.count % 2 == 0 {
            var midIndex = (sumArray.count + 1) / 2
            answer = Double(sumArray[midIndex - 1] + sumArray[midIndex]) / 2
        } else {
            var midIndex = sumArray.count / 2
            answer = Double(sumArray[midIndex])
        }
    return answer
}
findMedianSortedArrays([1,3], [2,7])


func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    nums.sort(by: >)
    return  nums[k-1]
}
findKthLargest([3,2,3,1,2,4,5,5,6], 4)

