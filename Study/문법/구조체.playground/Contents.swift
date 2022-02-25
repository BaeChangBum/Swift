import UIKit

/*struct BasicInformation{
    var name: String
    var age: Int
}

var changbum: BasicInformation = BasicInformation(name: "Changbum", age: 34)
changbum.age = 24
changbum.name = "Seba"

class Person{
    var height: Float = 0.0
    var weight: Float = 0.0
    
    // deinit 메서드는 디이니셜라이저라고 부르며, 소멸되기 직전 호출 된다.
    // 클래스당 하나만 구현할 ㅎ수 있으며, 매개변수와 반환 값을 가질 수 없다.
    deinit{
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var changbum2: Person = Person()
changbum2.height = 123.4
changbum2.weight = 123.4

let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4

var yagom: Person? = Person()
yagom = nil*/


struct BasicInformation{
    let name: String
    var age: Int
}

var changbumInfo:BasicInformation = BasicInformation(name: "Changbum", age: 34)
changbumInfo.age = 24

var friendInfo: BasicInformation = changbumInfo

print("Changbum's age \(changbumInfo.age)")
print("Frined's age \(friendInfo.age)")

friendInfo.age = 999

print("Changbum's age \(changbumInfo.age)")
print("Frined's age \(friendInfo.age)")

class Person{
    var height: Float = 0.0
    var weight: Float = 0.0
}

var Changbum:Person = Person()
var Friend: Person = Changbum

print("Changbum's age \(Changbum.height)")
print("Frined's age \(Friend.height)")

Friend.height = 185.5

// 185.5 frined는 changbum을 참조하기 때문에 값이 변경 된다.
print("Changbum's age \(Changbum.height)")
// 185.5 이를 통해 changbum이 참조하는 곳과 friend가 참조하는 곳이 같음을 알 수 있다.
print("Frined's age \(Friend.height)")

func changeBasicInfo(_ info: BasicInformation){
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person){
    info.height = 155.3
}

// changeBasicInfo로 전달되는 전달인자는 값이 복사되어 전달되기 때문에
// changbumInfo의 값만 전달되는 것이다.
changeBasicInfo(changbumInfo)
print("Changbum's age \(changbumInfo.age)")

// changePersonInfo로 전달인자로 changbum의 참조가 전달되었기 때문에
// changbum이 참조하는 값들에 변화
changePersonInfo(Changbum)
print("Changbum's height \(Changbum.height)")

