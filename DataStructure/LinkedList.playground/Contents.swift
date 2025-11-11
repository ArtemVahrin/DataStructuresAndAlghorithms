import Cocoa

class Node<Element> {
    var value: Element
    var next: Node?
    weak var previous: Node?
    
    init(value: Element) {
        self.value = value
    }
}

class LinkdeList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool { head == nil }
    var first: Element? { head?.value }
    var last: Element? { tail?.value }
}

extension LinkdeList {
    func append(_ value: Element) {
        let newNode = Node(value: value)
        if let tail {
            newNode.previous = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    private func nodeBy(_ index: Int) -> Node<Element>? {
        guard index >= 0 else { return nil }
        var currentNode = head
        var i = index
        
        while currentNode != nil {
            if i == 0 { return currentNode}
            i -= 1
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func value(_ index: Int) -> Element? {
        let node = nodeBy(index)
        return node?.value
    }
    
    @discardableResult
    func removeAt(_ index: Int) -> Element? {
        guard let removedNode = nodeBy(index) else { return nil }
        let prev = removedNode.previous
        let next = removedNode.next
        
        if let prev {
            prev.next = next
        } else {
            head = next
        }
        
        if let next {
            next.previous = prev
        } else {
            tail = prev
        }
        
        removedNode.next = nil
        removedNode.previous = nil
        
        return removedNode.value
    }
}
    
var list = LinkdeList<Int>()
list.append(1)
list.append(2)
list.append(3)


list.first
list.last
list.isEmpty
list.append(4)
print(list.value(3)!)
print(list.removeAt(0)!)
print(list.first!)
