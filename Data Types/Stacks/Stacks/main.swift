//
//  main.swift
//  Stacks
//
//  Created by Brandon Johns on 8/15/23.
//

import Foundation

struct Stack<Element> {
    private var array = [Element]()
    
    var count: Int {
        array.count
    }

    var isEmpty: Bool { array.isEmpty}
    
    
    init(_ items: [Element]) {
        self.array = items
    }
    
    // empty initializer
    init() { }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        array.popLast()
    }
    
    func peek() -> Element? {
        array.last
    }
}

extension Stack: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    
        
    init(arrayLiteral elements: ArrayLiteralElement...) {
        self.array = elements
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        var result = "["
        
        var first = true
        
        for item in array {
            if first {
                first = false
            } else {
                result += ", "
            }
            
            debugPrint(item, terminator: "", to: &result)
        }
        result += "]"
        
        return result
    }
}



extension Stack: Equatable where Element: Equatable {}

let stackA = Stack([1,2,3])
let stackB = Stack([1,2,3])
print(stackA == stackB)

extension Stack: Hashable where Element: Hashable { }

extension Stack: Codable where Element: Codable{ }

var numbers: Stack = [1,2,3,4,5]

numbers.push(6)
numbers.push(7)


print(numbers)
