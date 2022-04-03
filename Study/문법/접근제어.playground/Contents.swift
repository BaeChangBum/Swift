import UIKit

/*public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

// 같은 타입의 익스텐션에서는 private 요소에 접근 가능
extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(fileprivateVariable))")
    }
    
    private func privateMethod() {
        print("\(self.privateVariable), \(fileprivateVariable))")
    }
    
    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(fileprivateVariable))")
    }
}

struct AnotherType {
    var someInstace: SomeType = SomeType()
    
    mutating func someMethod() {
        self.someInstace.publicMethod()
        
        // 같은 파일에 속해 있는 코드이므로 fileprivate 접근 수준 요소에 접근 가능
        self.someInstace.fileprivateVariable = 100
        self.someInstace.fileprivateMethod()
        
        // 다른 타입 내부의 코드이므로 private 요소에 접근 불가
        /*self.someInstace.privateVariable = 100
        self.someInstace.privateMethod()*/
    }
}

var anotherInstace = AnotherType()
anotherInstace.someMethod()*/

public struct SomeType {
    // 비공개 접근수준 저장 프로퍼티
    private var count: Int = 0
    
    // 공개 접근수준 저장 프로퍼티
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 프로퍼티
    // 설정자는 비공개 접근 수준
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    // 내부 접근수준 저장 프로퍼티
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 내부 접근수준 저장 프로퍼티
    // 설정자는 비공개 접근 수준
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get{
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    // 설정자는 내부 접근 수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}


var someInstance: SomeType = SomeType()

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 100

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.internalGetOnlyComputedProperty)
//someInstance.internalGetOnlyComputedProperty = 100

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[])
someInstance[] = 100

// 외부에서 접근자만, 같은 모듈 내에서는 설정자도 사용 가능
print(someInstance[0])
someInstance[0] = 100
