import UIKit

func hello(name: String) -> String{
    return "Hello \(name)"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func introduce(name: String) -> String{
    // return을 생략 할 수 있다.
    //return "제 이름은 " + "\(name)" + "입니다."
    "제 이름은 " + "\(name)" + "입니다."
}

// name은 매개변수, "Jenny"는 전달인자.
let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)

// 매개 변수가 없느 경우
func helloWorld() -> String{
    return "Hello, wrold!"
}

print(helloWorld())

// 매개 변수가 여려 개인 경우
func sayHello(myName: String, yourName: String) -> String{
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "changbum", yourName: "Jenny"))

// from과 to라는 전달인자 레이블이 있으며
// myName과 name이라는 매개변수 이름이 있는 sayHello 함수
func sayHello(from myName: String, to name:String) -> String{
    return "Hello \(name)! I'm \(myName)"           // 함수 내부에서 전달 인자 레이블을 사용할 수 없다.
}

print(sayHello(from: "changbum", to: "Jenny"))      // 함수를 호출 할때는 매개변수 이름을 사용 할 수 없다.


// 전달인자 레이블이 없는 함수
func sayHello(_ name: String, _ times: Int = 3/* 기본 값 정의 가능*/) -> String{
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)" + " "
    }
    return result
}

// 전달인자 레이블을 변경하면 함수의 이름 자체가 변경
// 전달인자 레이블만 다르게 써주더라구 함수 중복 정의(오버로드)로 동작 할 수 있다.
func sayHello(to name: String, repeatCount times: Int) -> String{
    var result: String = ""
    
    for _ in 0..<times{
        result += "Hello \(name)" + " "
    }
    return result
}

// times 매개변수의 전달 값을 넘겨주지 않아 기본값 3반영
print(sayHello("chope"))
print(sayHello("chope", 2))
print(sayHello(to: "chope", repeatCount: 2))

// 가변 매개변수 0개 이상의 값을 받아올 수 있다.
// 가변 매개변수로 들어온 인자 값은 배열처럼 사용 가능
func sayHelloToFriends(me: String, frineds names: String...) -> String{
    var result: String = ""
    
    for friends in names{
        result += "Hello \(friends)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "Changbum", frineds: "Jay", "Jonhansson", "yagom"))
print(sayHelloToFriends(me: "Changbum"))


// inout 매개변수의 활용
// 참조는 inout 매개변수로 전달될 변수 또는 상수 앞에 &를 붙여 표현
// 함수가 호출되면, 매개변수로 넘겨진 변수가 복사
// 함수 몸체애서, 복사한 값을 수정
// 함수가 반환될 때, 변환된 값을 원본 변수에 재할 당
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]){
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]){
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])
print(numbers)

referenceParameter(&numbers)        // 참조를 표현하기 위해 & 붙여준다.
print(numbers[1])
print(numbers)


// 반환 값이 없는 함수
func sayHelloWorld(){
    print("Hello World!")
}
sayHelloWorld()

func sayHello(from myName: String, you name: String){
    print("Hello \(name)! I'm \(myName)")
}
sayHello(from: "changbum", you: "Jenny")

func sayGoodbye() -> Void{  // Void를 명시해주어도 상관 없다.
    print("Good bye")
}
sayGoodbye()


// 함수 타입의 사용
// Int 값을 입력 받아 계산 후 Int 값을 돌려주는 형태의 함수 CalculateTwoInts라는 별칭 사용
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts

print(mathFunction(2, 5))

mathFunction = multiplyTwoInts

print(mathFunction(2, 5))

// 절달인자로 함수를 전달받는 함수
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int){
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// 특정 조건에 따라 적절한 함수를 반환해주는 함수
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts{
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)

typealias MoveFunc = (Int) ->Int


func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc{
    func goRight(_ currentPosition: Int) -> Int{
        return currentPosition + 1
    }

    func goLeft(_ currentPosition: Int) -> Int{
        return currentPosition - 1
    }

    return shouldGoLeft ? goLeft : goRight
}


var position: Int = -4

// 현 위치가 0보다 크므로 전달되는 인자 값은 true가 된다.
let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로 갑시다.")

// 원점에 도착하면(현 위치가 0이면) 반복문이 종료된다.
while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}

// 종료되지 않는 함수
/*func crashAndBurn() -> Never{
    fatalError("Something very, very bad happened")
}

//crashAndBurn()  // 프로세스 종료 후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else{
        print("Error")
        crashAndBurn()
    }
    print("good")
}

someFunction(isAllIsWell: true)     // good
someFunction(isAllIsWell: false)    // Error*/

// 반환 값을 무시할 수 있는 함수
// @discardablResult를 사용
func say(_ something: String) -> String{
    print(something)
    return something
}
@discardableResult func discadableResultSay(_ something:String) -> String{
    print(something)
    return something
}

say("hello")

// 반환 값을 사용하지 않을 수 있다고 미리 알렸기 때문에
// 반환 값을 사용하지 않아도 컴파일러 경고가 발생하지 않는다
discadableResultSay("hello")
