//
//  main.swift
//  TreeExample
//
//  Created by Brandon Johns on 8/16/23.
//

import Foundation

final class Node<Value> {
    var value: Value
   private(set) var children: [Node]
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count}
    }
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(_ value: Value, @NodeBuilder builder: () ->[Node]) {
        self.value = value
        self.children = builder()
    }
    
     func add(child: Node) {
        children.append(child)
    }
    
}

extension Node: Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}
extension Node: Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Node: Codable where Value: Codable { }

extension Node where Value: Equatable {
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        
        return nil
    }
}


@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}
var kristen = Node("Kristen")
let aiden = Node("Aiden")
kristen.add(child: aiden)

var sarah = Node("Sarah")
var kaylee = Node("Kaylee")
let hudson = Node("Hudson")

let cooper = Node("Cooper")


sarah.add(child: kaylee)
sarah.add(child: hudson)
kaylee.add(child: cooper)

var root = Node("Kristi")
root.add(child: sarah)
root.add(child: kristen)

if let sarah = root.find("Sarah") {
    print(sarah.count)
    sarah.add(child: cooper)
}


/* struct Node<Value> {
 var value: Value
private(set) var children: [Node]
 
 var count: Int {
     1 + children.reduce(0) { $0 + $1.count}
 }
 
 init(_ value: Value) {
     self.value = value
     children = []
 }
 
 init(_ value: Value, children: [Node]) {
     self.value = value
     self.children = children
 }
 
mutating func add(child: Node) {
     children.append(child)
 }
 
}*/
