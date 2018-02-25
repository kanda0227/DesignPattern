import Foundation

/// Generics を使用した抽象クラスを作成して実装
//
//class Aggregate<Elem> {
//    /// イテレータを作成します
//    public func iterator() -> Iterator<Elem> {
//        fatalError("サブクラスで実装してください")
//    }
//}
//
//class Iterator<Elem> {
//    /// 次の要素が存在するかどうかを判定します
//    public var hasNext: Bool {
//        fatalError("サブクラスで実装してください")
//    }
//    /// 次の要素を返します
//    public func next() -> Elem {
//        fatalError("サブクラスで実装してください")
//    }
//}
//
//final class Closet: Aggregate<Clothes> {
//    private var clothes: [Clothes] = []
//
//    public var count: Int {
//        return clothes.count
//    }
//
//    public func getClothes(at index: Int) -> Clothes {
//        return clothes[index]
//    }
//    public func append(_ clothes: [Clothes]) {
//        self.clothes.append(contentsOf: clothes)
//    }
//
//    override public func iterator() -> ClosetIterator {
//        return ClosetIterator(self)
//    }
//}
//
//final class ClosetIterator: Iterator<Clothes> {
//    private let closet: Closet
//    private var index = 0
//
//    required init(_ closet: Closet) {
//        self.closet = closet
//    }
//
//    override public var hasNext: Bool {
//        return index < closet.count
//    }
//
//    override public func next() -> Clothes {
//        let nextItem = closet.getClothes(at: index)
//        index += 1
//        return nextItem
//    }
//}
//
//let myCloset = Closet()
//myCloset.append([Clothes(type: "blouse", color: "white", pattern: "plane"),
//                 Clothes(type: "skirt", color: "red", pattern: "check"),
//                 Clothes(type: "coat", color: "green", pattern: "plane"),
//                 Clothes(type: "onePieceDress", color: "violet", pattern: "stripes")])
//let iterator = myCloset.iterator()
//while iterator.hasNext {
//    print(iterator.next().detail)
//}




/// クラス図に沿って抽象クラスを作成して実装

//class Aggregate {
//    /// イテレータを作成します
//    public func iterator() -> Iterator {
//        fatalError("サブクラスで実装してください")
//    }
//}
//
//class Iterator {
//    /// 次の要素が存在するかどうかを判定します
//    public var hasNext: Bool {
//        fatalError("サブクラスで実装してください")
//    }
//    /// 次の要素を返します
//    public func next() -> AnyObject {
//        fatalError("サブクラスで実装してください")
//    }
//}
//
//final class Closet: Aggregate {
//    private var clothes: [Clothes] = []
//
//    public var count: Int {
//        return clothes.count
//    }
//
//    public func getClothes(at index: Int) -> Clothes {
//        return clothes[index]
//    }
//    public func append(_ clothes: [Clothes]) {
//        self.clothes.append(contentsOf: clothes)
//    }
//
//    override public func iterator() -> Iterator {
//        return ClosetIterator(self)
//    }
//}
//
//final class ClosetIterator: Iterator {
//    private let closet: Closet
//    private var index = 0
//
//    required init(_ closet: Closet) {
//        self.closet = closet
//    }
//
//    override public var hasNext: Bool {
//        return index < closet.count
//    }
//
//    override public func next() -> AnyObject {
//        let nextItem = closet.getClothes(at: index)
//        index += 1
//        return nextItem
//    }
//}
//
//let myCloset = Closet()
//myCloset.append([Clothes(type: "blouse", color: "white", pattern: "plane"),
//                 Clothes(type: "skirt", color: "red", pattern: "check"),
//                 Clothes(type: "coat", color: "green", pattern: "plane"),
//                 Clothes(type: "onePieceDress", color: "violet", pattern: "stripes")])
//let iterator = myCloset.iterator()
//while iterator.hasNext {
//    print((iterator.next() as! Clothes).detail)
//}



/// クラスバージョン
//final class Clothes: NSObject {
//    /// 服の種類
//    let type: String
//    /// 色
//    let color: String
//    /// 模様
//    let pattern: String
//
//    required init(type: String, color: String, pattern: String) {
//        self.type = type
//        self.color = color
//        self.pattern = pattern
//    }
//
//    var detail: String {
//        return "\(color) \(pattern) \(type)"
//    }
//}

/// 構造体バージョン
struct Clothes {
    /// 服の種類
    let type: String
    /// 色
    let color: String
    /// 模様
    let pattern: String
    
    var detail: String {
        return "\(color) \(pattern) \(type)"
    }
}

/// Iteratorパターン(protocol)
////
//protocol IteratorType {
//    associatedtype Elem
//    func next() -> Elem
//    var hasNext: Bool { get }
//}
//
//protocol Aggregate {
//    associatedtype Iterator: IteratorType
//    func iterator() -> Iterator
//}
//
//final class Closet: Aggregate {
//    typealias Iterator = ClosetIterator
//
//    private var clothes: [Clothes] = []
//
//    public var count: Int {
//        return clothes.count
//    }
//
//    public func append(_ clothes: [Clothes]) {
//        self.clothes.append(contentsOf: clothes)
//    }
//
//    public func getClothes(at index: Int) -> Clothes {
//        return clothes[index]
//    }
//
//    public func iterator() -> ClosetIterator {
//        return ClosetIterator(closet: self)
//    }
//}
//
//final class ClosetIterator: IteratorType {
//    typealias Elem = Clothes
//
//    private let closet: Closet
//    private var index: Int = 0
//
//    required init(closet: Closet) {
//        self.closet = closet
//    }
//
//    public var hasNext: Bool {
//        return index < closet.count
//    }
//
//    public func next() -> Clothes {
//        let clothes = closet.getClothes(at: index)
//        index += 1
//        return clothes
//    }
//}
//
//let myCloset = Closet()
//myCloset.append([Clothes(type: "blouse", color: "white", pattern: "plane"),
//                 Clothes(type: "skirt", color: "red", pattern: "check"),
//                 Clothes(type: "coat", color: "green", pattern: "plane"),
//                 Clothes(type: "onePieceDress", color: "violet", pattern: "stripes")])
//let iterator = myCloset.iterator()
//while iterator.hasNext {
//    print(iterator.next())
//}




/// Iterator (Swift)

final class Closet: Sequence {

    private var clothes: [Clothes] = []
    
    public var count: Int {
        return clothes.count
    }
    
    public func getClothes(at index: Int) -> Clothes? {
        guard index < clothes.count else { return nil }
        return clothes[index]
    }

    public func append(_ clothes: [Clothes]) {
        self.clothes.append(contentsOf: clothes)
    }

    public func makeIterator() -> ClosetIterator {
        return ClosetIterator(closet: self)
    }
}

final class ClosetIterator: IteratorProtocol {
    typealias Element = Clothes
    private let closet: Closet
    private var index: Int = 0

    required init(closet: Closet) {
        self.closet = closet
    }

    public func next() -> Clothes? {
        if let next = closet.getClothes(at: index) {
            index += 1
            return next
        } else {
            return nil
        }
    }
}

let myCloset = Closet()
myCloset.append([Clothes(type: "blouse", color: "white", pattern: "plane"),
                 Clothes(type: "skirt", color: "red", pattern: "check"),
                 Clothes(type: "coat", color: "green", pattern: "plane"),
                 Clothes(type: "onePieceDress", color: "violet", pattern: "stripes")])
for clothes in myCloset {
    print(clothes.detail)
}
