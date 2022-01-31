import UIKit

// 각 항목에 대해 아래와 같이 원시값을 설정할 수 있다.
enum School: String{
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
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")

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
let primary = School(rawValue: "유치원")
let graduate = School(rawValue: "석박사")

enum MainDish{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSaucs: Bool)
    case rice
}

var dinner:MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSaucs: true)
dinner = .rice
