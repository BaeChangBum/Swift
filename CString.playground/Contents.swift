import UIKit

var bitCoin = "Bitcoin"
let cheeseCoin = "CheeseCoin"

var long = """
    this string is
    far too long to
only fit on one line;
"""

print(bitCoin)
print(cheeseCoin)
print(long)
print(bitCoin + cheeseCoin)
print(bitCoin + " " + cheeseCoin)
print("I like bitcoin and cheeseCoin")
print("I like \(bitCoin) and \(cheeseCoin)")
print("I boutht \(1) \(cheeseCoin) for $\(1 * 1000)")

for char in cheeseCoin{
    print("char: \(char)")
}

print(cheeseCoin.count)
print(cheeseCoin.lowercased())
print(cheeseCoin.first)
print("".first)
print(bitCoin.removeFirst())    //removes and returns the first Element
print(bitCoin.replacingOccurrences(of: "it", with: "Ghost"))
print(bitCoin.sorted())
print(bitCoin.split(separator: "t"))

bitCoin.append(" is interesting.")
print(bitCoin)

if(bitCoin == cheeseCoin)
{
    print("I'm not sure why these are the same")
}
else
{
    print("Good.")
}
