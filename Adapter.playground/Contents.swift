
class WarShip {
    /// 艦種
    private let type: String
    /// 艦級
    private let `class`: String
    private let number: Int
    private let name: String
    
    init(_ type: String, _ `class`: String, _ number: Int, _ name: String) {
        self.type = type
        self.`class` = `class`
        self.number = number
        self.name = name
    }
    
    public func getData() -> String {
        return `class` + "型" + type + "\(number)番艦"
    }
    public func getName() -> String {
        return name
    }
}

protocol PrintProfileType {
    func sayProfile()
}

final class PrintWarShipProfile: WarShip, PrintProfileType {
    func sayProfile() {
        print(getData() + "の" + getName() + "です！")
    }
}

let hiei: PrintProfileType = PrintWarShipProfile("戦艦", "金剛", 2, "比叡")
hiei.sayProfile()

//class BasePrintProfile {
//    public func sayProfile() {
//        fatalError("サブクラスで実装してください")
//    }
//}
//
//final class PrintWarShipProfile: BasePrintProfile {
//    private let warShip: WarShip
//    init(_ warShip: WarShip) {
//        self.warShip = warShip
//    }
//
//    override public func sayProfile() {
//        print(warShip.getData() + "の" + warShip.getName() + "です！")
//    }
//}
//
//let hiei = WarShip("戦艦", "金剛", 2, "比叡")
//let printProfile: BasePrintProfile = PrintWarShipProfile(hiei)
//printProfile.sayProfile()

class Idol {
    private let production: String
    private let name: String
    private let nickname: String
    init(_ production: String, _ name: String, _ nickname: String) {
        self.production = production
        self.name = name
        self.nickname = nickname
    }
    
    public func greeting() {
        print(production + "プロの" + name + "です！")
    }
    public func smile() {
        print(nickname + "って呼んでくださいね！")
    }
}

final class PrintIdolProfile: Idol, PrintProfileType {
    func sayProfile() {
        greeting()
        smile()
    }
}

let profiles: [PrintProfileType] = [ PrintWarShipProfile("戦艦", "金剛", 2, "比叡"),
                                     PrintIdolProfile("346", "赤城みりあ", "みりあ")]

profiles.forEach { $0.sayProfile();print() }
