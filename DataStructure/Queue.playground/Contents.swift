import Cocoa

struct Queue<Element> { //FIFO
    private var container = [Element]()
    var size: Int { container.count }
    var isEmpty: Bool { container.isEmpty }
    
    var head: Element? { container.first }
    var tail: Element? { container.last }
        
    mutating func enqueue(_ element: Element) {
        container.append(element)
    }
    @discardableResult
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        return container.removeFirst()
    }
}
extension Queue {
    init(_ array: [Element]) {
        self.container = array
    }
    
    mutating func enqueue(_ array: [Element]) {
        self.container += array
    }
    mutating func dequeuque(number: Int) -> [Element] {
        guard number < container.count else {
            let arr = container
            container.removeAll()
            return arr
        }
        var arr = [Element]()
        for _ in 0..<number {
            arr.append(container.removeFirst())
        }
        return arr
    }
}

var queue = Queue<Int>([1, 2, 3])
queue.enqueue(4)
queue.enqueue([5,6,7])
print(queue.dequeuque(number: 3))
print(queue.dequeue()!)
queue.head
queue.tail
queue.isEmpty
queue.size

