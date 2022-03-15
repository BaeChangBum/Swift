import UIKit

// 저장 프로퍼티
/*struct CoordinatePoint{
    var x: Int = 0  // 저장 프로퍼티
    var y: Int = 0  // 저장 프로퍼티
}

// 초깃값을 할당 했다면 전달인자로 초깃값을 넘길 필요가 없다.
let yourPoint: CoordinatePoint = CoordinatePoint()

print("changbum's Point : \(yourPoint.x), \(yourPoint.y)")

let changbumPoint: CoordinatePoint = CoordinatePoint(x:10, y: 5)

print("changbum's Point : \(changbumPoint.x), \(changbumPoint.y)")

class Position{
    var point: CoordinatePoint  // 저장 프로퍼티
    let name: String            // 저장 프로퍼티
                                // 클래스는 let로 선언하더라도 접근 가능하다.
                                // 클래스 인스턴스는 참조타입이기 때문이다.
    
    init(name: String, currentPoint: CoordinatePoint){
        self.name = name
        self.point = currentPoint
    }
}

// 사용자 정의 이니셜라이저를 호출해야만 한다.
// 옵셔널이 아닌 값으로 선언되었기에, 옵셔널 일 경우 값을 꼭 할당해주지 않아도 된다.
// 클래스 인스턴스의 상수 프로퍼티는 인스턴스가 초기화될 때 한 번만 값을 할당할 수 있으며,
// 자식 클래스에서 이 초기화를 변경 할 수 없다.
let changbumPosition: Position = Position(name:"Changbum", currentPoint: changbumPoint)*/

/*struct CoordinatePoint{
    // 위치 x, y 값이 모두 있어야 하므로 옵셔널이면 안된다.
    var x: Int
    var y: Int
}

class Position{
    // 현재 위치를 모를 수도 있기에 옵셔널로 선언
    var point: CoordinatePoint?
    let name: String
    
    init(name: String){
        self.name = name
    }
}

let changbumPosition: Position = Position(name: "changbum")
changbumPosition.point = CoordinatePoint(x: 10, y: 5)

print("changbum's Point : \(changbumPosition.point)")
print("changbum's Point : \(changbumPosition.point?.x), \(changbumPosition.point?.y)")*/


// 지연저장 프로퍼티
/*struct CoordinatePoint{
    var x: Int = 0
    var y: Int = 0
}

class Position{
    // lazy 키워드를 사용
    // 복잡한 계산이나 부하가 많이 걸리는 작업을 할 경우에도 사용
    // 실제 사용되기 전에는 실행되지 않아서 인스턴스 초기화 시점에 복잡한 계산을 피할 수 있다.
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String){
        self.name = name
    }
}

let changbumPosition: Position = Position(name: "changbum")

// 이 코드를 통해 point 프로퍼티로 처음 접근하며
// point 프로퍼티의 CoordinatePoint가 생성된다.
// 다중 스레드 환경에서는 스레드가 비슷한 시점에 접근한다면, 여러번 초기화될 수 있다.
print("changbum's Point : \(changbumPosition.point)")
*/

// 연산 프로퍼티
struct CoordinatePoint{
    var x: Int
    var y: Int

    var oppositePoint: CoordinatePoint{
        get{
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set(opposite){
            x = -opposite.x
            y = -opposite.y
        }
    }
    /*// 대칭점을 구하는 메서드 - 접근자
    // self 대신 CoordinatePoint를 사용해도 된다.
    func oppositePoint() -> Self{
        return CoordinatePoint(x: -x, y : -y)
    }
    
    // 대칭점을 설정하는 메서드 - 설정자
    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }*/
}

var changbumPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

// 현재 좌표
print(changbumPosition)

// 대칭 좌표
print(changbumPosition.oppositePoint)

changbumPosition.oppositePoint = CoordinatePoint(x: 15, y: 30)

print(changbumPosition)

// 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
/*class Account{
    var credit: Int = 0{
        willSet(newValue) {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
    
        didSet(oldValue) {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
    
        }
    }
    
    var dollarValue: Double{
        get{
            return Double(credit)
        }
        
        set{
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중 입니다.")
        }
    }
}

class ForeignAccount: Account{
    override var dollarValue: Double{
        willSet{
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경 될 예정입니다.")
        }
        
        didSet{
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
myAccount.credit = 1000

myAccount.dollarValue = 2
*/

// 저장변수의 감시자와 연산 변수
var workInPocket: Int = 2000{
    willSet{
        print("주머니의 돈이 \(workInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    didSet{
        print("주머니의 돈이 \(oldValue)원에서 \(workInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double{
    get{
        return Double(workInPocket) / 1000.0
    }
    set{
        workInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5


// 타입 프로퍼티와 인스턴스 프로퍼티
class AClass{
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0{
        didSet{
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int{
        get{
            return typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstace: AClass = AClass()
classInstace.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)

// 타입 프로퍼티의 사용
class Account{
    static let dollarExchangeRate: Double = 1000.0
    
    var credit: Int = 0
    
    var dollarValue: Double{
        get{
            return Double(credit)
        }
        set{
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
            print(credit)
        }
    }
}

var value:Account = Account()
value.dollarValue = 2000.0


// 키 경로
/*class Person {
    let name: String
    
    init(name: String){
        self.name = name
    }
}

struct Stuff{
    var name: String
    var owner: Person
}

let changbum = Person(name: "changbum")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook", owner: changbum)
var iMac = Stuff(name: "iMac", owner: changbum)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerKeyPath = \Stuff.owner

// \Stuff.owner.name과 같은 표현이 된다.
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])
print(iPhone[keyPath: ownerNameKeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerKeyPath] = hana

print(iMac[keyPath: stuffNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])*/

struct Person {
    let name: String
    let nickname: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let changbum: Person = Person(name: "changbum", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "ad", age: 100)
let happy: Person = Person(name: "happy", nickname: nil, age: 10)

let family: [Person] = [changbum, hana, happy]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickname)
let adults: [String] = family.filter(\.isAdult).map(\.name)

/*class LevelClass {
    var level: Int = 0 {
        didSet{
            print("Level \(level)")
        }
    }
    
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down!")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    func reset() {
        print("reset")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()

levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 3)

struct LevelStruct {
    var level: Int = 0{
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down!")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("reset")
        level = 0
    }
}

var levelClassInstance: LevelStruct = LevelStruct()

levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 3)*/


class LevelClass {
    var level: Int = 0
    
    // 클래스의 인스턴스는 참조 타입이라서 self 프로퍼티에 다른 참조를 할당할 수 없다
    /*func reset() {
        self = LevelClass()
    }*/
}

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 구조체나 열거형 등은 self 프로퍼티를 사용하여 자신 자체를 치환할 수 있다.
    mutating func reset() {
        print("reset")
        self = LevelStruct()
    }
}

var levelClassInstance: LevelStruct = LevelStruct()

levelClassInstance.levelUp()

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle:OnOffSwitch = OnOffSwitch.off
toggle.nextState()

struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)로 달려갑니다.")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)를 \(times)번 반복합니다.")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var dogs: Puppy = Puppy()
dogs.callAsFunction()
dogs()
dogs.callAsFunction(destination: "집")
dogs.callAsFunction(something: "재주넘기", times: 3)
dogs(name: "댕댕이")
