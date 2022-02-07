import UIKit

// 각 항목에 대해 아래와 같이 원시값을 설정할 수 있다.
/*enum School: String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

//var highestEducationLevel: School = School.university
//var highestEducationLevel: School = .university   // 위와 같은 표현이다.
// highestEducationLevel = .graduate                // 내부항목으로만 값을 변경해줄 수 있다.

let highestEducationLevel: School = School.university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")*/

enum WeekDays: Character
{
    case mon = "월"
    case tue = "화"
    case wed = "수"
    case thu = "목"
    case fri = "금"
    case sat = "토"
    case sun = "일"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)입니다.")

// 일부 항목만 원시 값을 설정 할 수 있으며, 첫 항목 기준으로 0부터 1씩 늘어난다.
enum Numbers: Int{
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")

// 올바르지 않은 원시 값을 통해 생성하려고 한다면 nil을 반환한다.
//let primary = School(rawValue: "유치원")
//let graduate = School(rawValue: "석박사")

enum PastaTaste{
    case cream, tomato
}

enum PizzaDough{
    case cheeseCrust, thin, original
}

enum PizzaTopping{
    case pepperoni, cheese, bacon
}

enum MainDish{
    case pasta(/*taste:String*/taste: PastaTaste)                                           // 열거형으로도 변경 가능
    case pizza(/*dough:String, topping:String*/dough: PizzaDough, topping: PizzaTopping)    // 열거형으로도 변경 가능
    case chicken(withSaucs: Bool)
    case rice
}

var dinner:MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)

//var dinner:MainDish = MainDish.pasta(taste: "크림")
//dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
//dinner = .chicken(withSaucs: true)
//dinner = .rice

// 열거형에 포함된 모든 케이스를 알아야 할 때
/*enum School: CaseIterable{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

// 원시 값을 갖는 열거형이라면 원시값의 타입 다음에 쉼표를 쓴다.
// enum School: String, CaseIterable

let allCases: [School] = School.allCases
print(allCases)
*/

// CaseIterable 프로토콜을 통해 모든 케이스를 알수 있다.
// enum의 case 값들을 for in loop나 forEach 등오로 순회 할 수 있다.
// case 문이 추가되거나, 삭제되어도 수정이 쉽다.
enum School: String, CaseIterable{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    // available 속성을 통해 특정 케이스를 플랫폼에 따라 사용 가능
    // ios 버전에 따라
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School]{
        let all: [School] = [.primary,
                             .elementary,
                             .middle,
                             .high,
                             .college,
                             .university]
        
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases: [School] = School.allCases
print(allCases)
// allCases 타입 프로퍼티를 통해 기존 배열에서 사용할 수 있던, map, compactMap reducr/ joined, count, isEmpty등의 프로퍼티도 사용 가능
print(allCases.count)

// 열거형 항목의 연관 값이 열거형 자신의 값이고자 할때 indirect 사용
indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression{
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5+4) * 2 = \(result)")


// 비교 가능한 열거형 Comparable
// 앞에 위치한 케이스가 더 작은 값이 된다.
enum Condition: Comparable{
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition{
    print("제 상태가 더 좋군요")
}
else{
    print("당신의 상태가 더 좋아요")
}

enum Device: Comparable{
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)
