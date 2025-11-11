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

class TreeNode<Element> {
    var value: Element
    var children = [TreeNode]()
    
    init(_ value: Element) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    func forEach(visit: (TreeNode) -> ()) {
        visit(self)
        children.forEach { treeNode in
            treeNode.forEach(visit: visit)
        }
    }
    func forEachLevelOrder(visit: (TreeNode) -> ()) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{ queue.enqueue($0) }
        }
    }
}

extension TreeNode where Element: Equatable {
    func search(_ value: Element) -> TreeNode? {
        var result: TreeNode?
        forEach { node in
            if node.value == value {
                result = node
            }
        }
        return result
        
    }
}

struct Product {
    let title: String
    let subcategory: String
    let category: String
}

let productsTree = TreeNode("Catalog")
let shoesTree = TreeNode("Shoes")
let sneakersTree = TreeNode("Sneakers")
let bootsTree = TreeNode("Boots")
let adidasTree = TreeNode("Adidas")
let nikeTree = TreeNode("Nike")


productsTree.add(shoesTree)
shoesTree.add(sneakersTree)
shoesTree.add(bootsTree)
sneakersTree.add(adidasTree)
sneakersTree.add(nikeTree)

productsTree.forEach { node in
    print(node.value)
}

productsTree.forEachLevelOrder { node in
    print(node.value)
}
    
let searhed = productsTree.search("Sneakers")
searhed?.forEach { node in
    print(node.value)
}
