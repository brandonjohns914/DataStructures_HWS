//
//  main.swift
//  LinkedLists
//
//  Created by Brandon Johns on 8/16/23.
//

import Foundation

//var start = CFAbsoluteTimeGetCurrent()
//var items = Array(1...200_000)
//
//while items.isEmpty == false
//{
//    items.remove(at: 0)
//}
//
//var  end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get 0")
//
//
//start = CFAbsoluteTimeGetCurrent()
// items = Array(1...200_000)
//
//
//while items.isEmpty == false {
//    items.removeLast()
//}
//
//end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get 0")


final class LinkedListNode<Element> {
    var value: Element
    
    var next: LinkedListNode?
    
    init(value: Element, next: LinkedListNode? = nil ) {
        self.value = value
        self.next = next
    }
}

final class LinkedList<Element>: ExpressibleByArrayLiteral, Sequence {
    typealias ArrayLiteralElement = Element
    
    
    var start: LinkedListNode<Element>?
    
    init(arrayLiteral elements: Element...) {
        for element in elements.reversed() {
            start = LinkedListNode(value: element, next: start)
        }
    }
    
    init(array: [Element]) {
        for element in array.reversed() {
            start = LinkedListNode(value: element, next: start)
        }
    }
    
    func makeIterator() -> LinkedListIterator<Element> {
        LinkedListIterator(current: start)
        
    }
    
}

struct LinkedListIterator<Element>: IteratorProtocol {
    var current: LinkedListNode<Element>?
    
    
    mutating func next() -> LinkedListNode<Element>? {
        defer {current = current?.next}
        return current
    }
}


//let numbers = [1,3,5]
//let list = LinkedList(array: numbers)
////var currentNode = list.start
////
////while let node = currentNode {
////    print(node.value, terminator: " ")
////    currentNode = node.next
////}
//
//for node in list {
//    print(node.value)
//}

//
//let list = LinkedList(array: Array(1...200_000))
//start = CFAbsoluteTimeGetCurrent()
//
//while let start = list.start {
//    list.start = start.next
//}
//
//
//end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get to 0")

