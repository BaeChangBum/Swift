import UIKit
import Foundation

// 삼항 연산자
var valueA:Int = 3
var valueB:Int = 5

var biggerValue: Int = valueA > valueB ? valueA : valueB

valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB

var stringA:String = ""
var stringB:String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0
resultValue = stringB.isEmpty ? 1.0 : 0.0


// 오버플로 연산자
/*
&+ 오버플로에 대한 덧셈
&- 오버플로에 대한 뺄셈
&* 오버플로에 대한 곱셈
*/

var unsignedInterger: UInt8 = 0
//let errorUnderflowResult: UInt8 = unsignedInterger - 1      // Error
let underflowdValue: UInt8 = unsignedInterger &- 1          // 255

unsignedInterger = UInt8.max                                // 255
//let errorOverflowResult: UInt8 = unsignedInterger + 1       // Error
let overflowValue: UInt8 = unsignedInterger &+ 1            // 0


// 전위 연산자
/*prefix operator **
// prefix를 func 키워드 앞에 사용하여 아래 연산자를 사용하겠다는 의미
prefix func ** (value: Int) -> Int {
    return value * value
}

let minsuFive: Int = -5
let sqrtMinsuFive: Int = **minsuFive

print(sqrtMinsuFive)*/

prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "Changbum"
var isEmptyString: Bool = !stringValue

print(isEmptyString)

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString)

prefix operator **

prefix func ** (value: String) -> String {
    return value + " " + value
}

let resultString: String = **"changbum"
print(resultString)


postfix operator **
postfix func ** (value: Int) -> Int {
    return value + 10
}

infix operator ** : MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloChangbum: String = "Hello Changbum"
let changbum: String = "Changbum"
let isContainsChangbum: Bool = helloChangbum ** changbum

// 클래스 및 구조체의 비교 연산자
class car {
    var modelYear: Int?
    var modelName: String?
}

struct SmartPhone {
    var company: String?
    var model: String?
}

func == (lhs: car, rhs: car) -> Bool {
    return lhs.modelName == rhs.modelName
}

func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}

let myCar = car()
myCar.modelName = "S"

let yourCar = car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "SE"

var yourPhone = SmartPhone()
yourPhone.model = "6"

print(myCar == yourCar)
print(myPhone == yourPhone)
