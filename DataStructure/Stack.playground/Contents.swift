import Cocoa

struct Stack<Element> {
    private var container: [Element] = []
    
    var size: Int { container.count }
    var isEmpty: Bool { container.isEmpty }
    var top: Element? {container.last}
    
    mutating func push(_ value: Element) {
        self.container.append(value)
    }
    
    mutating func pop() -> Element? {
        guard !self.isEmpty else {
            return nil
        }
        return self.container.removeLast()
    }
}

var stack = Stack<Int>()
stack.push(123)
stack.push(456)
stack.pop()
stack.top

