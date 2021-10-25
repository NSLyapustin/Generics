import UIKit

class LinkedList<T> {

    // MARK: - Nested Types

    class Node<T> {
        
        // MARK: - Instance Properties
        
        var item: T
        var next: Node<T>?
        var previous: Node<T>?
        
        // MARK: - Initializators
        
        init(item: T) {
            self.item = item
        }
    }

    // MARK: - Instance Properties

    var head: Node<T>?

    // MARK: - Instance Methods

    func put(item: T) {
        if head == nil {
            head = Node<T>(item: item)
        } else {
            tail()?.next = Node<T>(item: item)
        }
    }

    func printList() {
        if head != nil {
            var nodeToPrint = head
            print((String(describing: nodeToPrint?.item)))
            repeat {
                nodeToPrint = nodeToPrint?.next
                print((String(describing: nodeToPrint?.item)))
            } while nodeToPrint?.next != nil
        } else {
            print([])
        }
    }
    
    func item(at index: Int) -> Node<T>? {
        if index >= count() || index < 0 {
            return nil
        } else if index == 0 {
            return head
        } else {
            var currentNode = head
            for _ in 1...index {
                currentNode = currentNode?.next
            }
            return currentNode
        }
    }

    func count() -> Int {
        if head == nil {
            return 0
        } else {
            var currentNode = head
            var count = 1
            while currentNode?.next != nil {
                currentNode = currentNode?.next
                count = count + 1
            }
            return count
        }
    }

    func remove(at index: Int) {
        if head != nil && index >= 0 && index < count() {
            var currentNode = head
            for _ in 1...index - 1 {
                currentNode = currentNode?.next
            }
            currentNode?.next = currentNode?.next?.next
         }
    }

    func tail() -> Node<T>? {
        var lastNode = head
        while lastNode?.next != nil {
            lastNode = lastNode?.next
        }
        return lastNode
    }
}

let linkedList = LinkedList<Int>()
linkedList.put(item: 1)
linkedList.put(item: 2)
linkedList.put(item: 3)
linkedList.put(item: 4)

linkedList.printList()

linkedList.remove(at: 3)
print("---------")
linkedList.printList()

print(linkedList.count())

print(String(describing: linkedList.tail()?.item))
print(String(describing: linkedList.item(at: -1)?.item))
print(String(describing: linkedList.item(at: 1)?.item))
