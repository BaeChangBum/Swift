import UIKit
import Swift

let hello: String = "Hello"
let yagom: String = "yagom"

var greet: String = hello + " " + yagom + "!"
print(greet)

var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString)

isSameString = hello == "hello"
print(isSameString)

//Tuple
var person: (name: String, age: Int, Height: Double) = ("changbum", 100, 82.5)

print("name: \(person.name), age : \(person.age), Height : \(person.Height)")

typealias PersonTuple = (name: String, age: Int)

let changbum: PersonTuple = ("yagom", 23)
let eric: PersonTuple = ("Eric", 32)

print("name: \(changbum.name), age: \(changbum.age)")
print("name: \(eric.name), age: \(eric.age)")

//Array
var names: Array<String> = ["yagom", "chulsoo", "youngee"]
var renames: [String] = ["yagom", "chulsoo", "youngee"]

var emptyArray: [Any] = [Any]()
var emptyArrays: [Any] = Array<Any>()

print(names[2])
names[2] = "changbum"
print(names[2])

//마지막에 추가
names.append("elsa")
// 마지막에 추가
names.append(contentsOf: ["John", "max"])
// Index 5의 위치에 삽입
names.insert(contentsOf: ["John2", "max2"], at:5)

print(names)

let firstItem: String = names.removeFirst()
let lastItem: String = names.removeLast()
let indexZeroItem: String = names.remove(at: 0)

print(names)
print(names[1...3])
print(names.count)

//Dictionary
typealias StringIntDictionary = [String: Int]
// key is String, Value Int type. This is an Empty Dictionary
//var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
//var numberForName: [String: Int] = [String: Int]()
//var numberForName: StringIntDictionary = StringIntDictionary()
// 위와 같으며, 키와 값 타입을 정확히 명시해줬다면 [:]만으로도 Empty Dictionary를 생성
//var numberForName: [String: Int] = [:]
var numberForName: [String: Int] = ["changbum": 100, "Chulsoo": 200, "John": 300]

print(numberForName.isEmpty)
print(numberForName.count)

//print(numberForName.removeValue(forKey: "changbum"))
//print(numberForName.removeValue(forKey: "changbum"))
//print(numberForName["changbum", default: 0])

// Set
//var name2: Set<String> = Set<String>()
//var name3: Set<String> = []

var name2: Set<String> = ["changbum", "chulsoo", "younghee", "changbumn"]
var numbers = [100, 200, 300]
print(type(of: numbers))

print(name2.isEmpty)
print(name2.count)

let englishClassStudents: Set<String> = ["John", "Chulsoo", "yagom"]
let koreanClassStudents: Set<String> = ["jenny", "yagom", "Chulsoo", "haha", "minsoo"]

// 교집합
let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)
print(intersectSet)

// 여집합
let symmetricDiffset: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)
print(symmetricDiffset)

// 합집합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)
print(unionSet.sorted())

// 차집합
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)
print(subtractSet)

let 새: Set<String> = ["비둘기","닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

print(새.isDisjoint(with: 포유류))  // 서로 배타적인가?
print(새.isSubset(of: 동물))       // 새가 동물의 부분집합인가?
print(동물.isSuperset(of: 포유류))  // 동물은 포유류의 전체집합인가?
print(동물.isSuperset(of: 새))     // 동물은 새의 전체집합인가?


var Test:String = "Test"
