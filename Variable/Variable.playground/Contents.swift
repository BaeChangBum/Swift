
// 아버지가 방에 들어가신다
var radius = 3.123
let pi = 3.1415926535

radius * radius * pi

radius = 5.456

radius * radius * pi


func circlearea(r: Double) -> Double {
    return radius * radius * 3.14
}

circlearea(r: 3.123)
circlearea(r: 5.456)
circlearea(r: 8.97)


class Circle{
    var rad = 3.123
    let p = 4.14
    
    func cir(r: Double) -> Double {
        return rad * rad * 3.14
    } 
}
