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
struct CoordinatePoint{
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


// 연산 프로퍼티
