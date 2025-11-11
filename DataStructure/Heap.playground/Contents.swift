
import Foundation

struct Heap<Element> {
    var elements: [Element] = []
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    var isEmpty: Bool {
        elements.isEmpty
    }
    var count: Int {
        elements.count
    }
    func peek() -> Element? {
        elements.first
    }
    func isRoot(_ index: Int) -> Bool { return index == 0 }
    func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    func leftChildIndex(of index: Int) -> Int { return 2 * index + 1 }
    func rightChildIndex(of index: Int) -> Int { return 2 * index + 2 }

    func isHigherPriority(at index1: Int, than index2: Int) -> Bool {
        priorityFunction(elements[index1], elements[index2])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
        else { return parentIndex }
        return childIndex
    }
    
    func higestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
        else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent)
        else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty
        else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = higestPriorityIndex(for: index)
        if index == childIndex { return }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
}

//
//func frequencySort(_ s: String) -> String {
//    var result = ""
//    var dict = s.reduce(into: [:]) { counts, char in
//        counts[char, default: 0] += 1
//    }
//    for (key, value) in dict.sorted(by: {$0.value > $1.value}) {
//        result += String(repeating: key, count: value)
//    }
//    return result
//}
//
//frequencySort( "tree")
//
//





//
//func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
//    var heap1 = Heap(elements: nums1, priorityFunction: <)
//    var heap2 = Heap(elements: nums2, priorityFunction: <)
//    var result: [[Int]] = []
//    var answer: [[Int]] = []
//    
//    for element in heap2.elements {
//        result.append([heap1.peek()!, element])
//    }
//    for element in heap1.elements {
//        result.append([element, heap2.peek()!])
//    }
//    print(result)
//    var sorted = result.sorted { first, second in
//        first[0] + first[1] < second[0] + second[1]
//    }
//    sorted.removeFirst()
//    if k >= sorted.count {
//        return sorted
//    }
//    for i in 0..<k {
//        answer.append(sorted[i])
//    }
//    return answer
//}
//kSmallestPairs([1,2,4,5,6], [3,5,7,9], 20)
//

//
//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    var i = m - 1
//    var j = n - 1
//    var k = n + m - 1
//    
//    while i >= 0 && j >= 0 {
//        if nums1[i] > nums2[j] {
//            nums1[k] = nums1[i]
//            i -= 1
//        } else {
//            nums1[k] = nums2[j]
//            j -= 1
//        }
//        k -= 1
//    }
//    while j >= 0 {
//        nums1[k] = nums2[j]
//        j -= 1
//        k -= 1
//        print(i,j,k)
//    }
//}
//var nums1 = [1,2,3,0,0,0]
//merge(&nums1, 3, [2,5,6], 3)

//
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var dict = [Int:Int]()
//    
//    for (index,value) in nums.enumerated() {
//        if let addent = dict[value] {
//            return [addent, index]
//        } else {
//            dict[target - value] = index
//        }
//
//    }
//    return []
//}
//var nums = [3,3]
//var target = 6
//twoSum(nums, target)

func sortArray(_ nums: [Int]) -> [Int] {
    var heap = Heap(elements: nums, priorityFunction: <)
    var ans = [Int]()
    
    while !heap.isEmpty {
        ans.append(heap.dequeue()!)
    }
    return ans
}
sortArray([5,2,3,1])
