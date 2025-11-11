import Cocoa

struct Deque<Element> { //FIFO
    private var container = [Element]()
    var size: Int { container.count }
    var isEmpty: Bool { container.isEmpty }
    var head: Element? { container.first }
    var tail: Element? { container.last }
        
    mutating func addLast(_ element: Element) {
        container.append(element)
    }
    mutating func addFirst(_ element: Element) {
        container.insert(element, at: 0)
    }
    @discardableResult
    mutating func removeFirst() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeFirst()
    }
    @discardableResult
    mutating func RemoveLast() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeLast()
    }
}
//extension Deque {
//    init(_ array: [Element]) {
//        self.container = array
//    }
//    
//    mutating func enqueue(_ array: [Element]) {
//        self.container += array
//    }
//    mutating func dequeuque(number: Int) -> [Element] {
//        guard number < container.count else {
//            let arr = container
//            container.removeAll()
//            return arr
//        }
//        var arr = [Element]()
//        for _ in 0..<number {
//            arr.append(container.removeFirst())
//        }
//        return arr
//    }
//}
var deque = Deque<Int>()

deque.addFirst(0)
deque.addFirst(-1)
deque.addLast(1)
deque.addLast(8)
print(deque)
print(deque.removeFirst()!)
print(deque.removeFirst()!)
print(deque.removeFirst()!)
print(deque.removeFirst()!)
