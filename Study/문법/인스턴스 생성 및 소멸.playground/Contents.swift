import UIKit
import Darwin

struct Area {
    var squareMeter: Double
    
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter sqareMeter: Double) {
        self.squareMeter = sqareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)


/*class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let changbum: Person = Person(name: "changbum")
print(changbum.name)
print(changbum.age)

changbum.age = 99
print(changbum.age)

changbum.name = "Jenny"
print(changbum.name)*/


struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

// 구조체는 사용자 정의 이니셜라이저를 구현하지 않으면 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저인 멤버와이즈 이니셜라이즈를 제공
let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 프로퍼티에 기본값이 있는 경우
// 필요한 매개변수만 사용하여 초기화 가능
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)

// 아래의 열거형은 두 개의 사용자 정의 이니셜라이저가 있다.
// 첫 번째 사용자 정의 이니셜라이저는 나이를 전달받아
// 나이에 맞는 학교를 case로 구분한 이니셜라이저를 초기화
// 두 번째 사용자 정의 이니셜라이저는 태어난 해와 현재 연도를 전달받아 나이로 계산한 후
// 첫 번째 이니셜라이저에 초기화를 위임
// 이렇게 초기화 위임 방법 사용 시 코드를 중복으로 사용하지 않아도 된다.
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를 사용 가능
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)

class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

let changbum: Person? = Person(name: "changbum", age: 99)

if let person: Person = changbum {
    print(person.name)
}
else {
    print("Person wasn't initialized")
}

let chope: Person? = Person(name: "chope", age: -10)

if let person: Person = chope {
    print(person.name)
}
else {
    print("Person wasn't initialized")
}

let eric: Person? = Person(name: "", age: 30)

if let person: Person = eric {
    print(person.name)
}
else {
    print("Person wasn't initialized")
}

