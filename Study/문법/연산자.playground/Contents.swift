import UIKit

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
let errorOverflowResult: UInt8 = unsignedInterger + 1       // Error
let overflowValue: UInt8 = unsignedInterger &+ 1            // 0
