//Implement queue using two stacks
struct Stack<Element> {
    var items = [Element]()

    var count : Int {
        return items.count
    }

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.removeLast()
    }
}

struct Queue<Element> {
    var inStack = Stack<Element>()
    var outStack = Stack<Element>()

    mutating func enqueue(_ item: Element) {
        inStack.push(item)
    }

    mutating func dequeue() -> Element? {
        fillOutStack()
        return outStack.pop()
    }
    
    private mutating func fillOutStack() {
        if outStack.count == 0 {
            while inStack.count != 0 {
                outStack.push(inStack.pop()!)
            }
        }
    }
}
var queue = Queue<Any>()
let elements = [1,2,3,4]
for element in elements {
    queue.enqueue(element)
}
//print(queue.inStack)
//print(queue.outStack)

var value1 = queue.dequeue()
print(queue)
//print(queue.inStack)
//print(queue.outStack)
