## Constants & Variables

'''swift
var s1 = "Hello, "
let s2 = "World!"
'''
var for mutable, you can change s1
let for immutable, you can not change s2

var ile yaratılan değişkenleri değiştirilebilirsiniz fakat let ile yaratılan sabitler değiştirilemez.

'''swift

s1 += s2
print(s1)
hello World!

s2 += s1
error: left side of mutating operator isn't mutable: 's2' is a 'let' constant
s2 += s1
~~ ^

repl.swift:2:1: note: change 'let' to 'var' to make it mutable
let s2 = " World!"
^~~
var
'''

## Optionals

'''swift

var s1: String
var s2: String?  
var s3: String!
'''

["Metin kutusu gibi bir yerden değer geliyorsa mutlaka opsiyonel tanımı yapılır. Çünkü değer gelip gelmeyeceğini bilemeyiz. Opsiyonel tanımlamak için değişken ya da sabitin sahip olacağı veri türünün yanına bir soru işareti — ? — koyarız. Örneğin bir Int? tanımlayarak şunu demek istiyoruz: Bu değişken ya da sabit Int türünden bir değer içerebilir ama hiç bir şey içermeyedebilir."](https://medium.com/mobil-dev/swift-dili-ve-opsiyonel-kavramı-410586abe4ae)


# Tuples & Optionals

'''swift

var s1 = (code:404, msg: "Not Found")

s1.code or s1.0 //returns 404
s1.msg  or s1.1 //returns "Not Found"

(Int, String)
//nothing is nil
(Int?, String?)
//int and string can be nil but tuples can't
(Int, String)?
//int and string can't be nil but tuples can
'''

# why Tuples?

'''swift

let result = CoolService.doSomethingCool()
if result.error != nil {
  print("Uh-oh, error: \(resut.error)")
}
else {
  print("The result is \(result.value)")
}
'''

*great for return values*

*unneed for arguments*

*Short-lived, Temporary*


## Protocols

'''swift


protocol Tuneable {
  var pitch: Double {get}
  func tuneSharp()
  func tuneFlat()
  }

class Guitar: Tuneable {
  var pitch: Double = 440

  func tuneSharp() {
    print("increasing string tension...")
    self.pitch += 5
  }

  func tuneFlat() {
    print("decreasing string tension...")
    self.pitch -= 5
  }
}


class Saxophone: Tuneable {
  var pitch: Double = 440

  func tuneSharp() {
    print("pushing mouthpiece in...")
    self.pitch += 1
  }

  func tuneFlat() {
    print("pulling mouthpiece out...")
    self.pitch -= 1
  }
}

let guitar = Guitar()
let sax = Saxophone()
let instruments: [Tuneable] = [guitar, sax]

for i in instruments {
i.tuneSharp()
}

'''

### Second example about Protocols

'''swift

protocol Tuneable {
  var pitch: Double {get}
  func tuneSharp()
  func tuneFlat()
  optional func transpose(hertz: Double)
  //when using optional you must add @objc to protocol
}

class Guitar: Tuneable {
  var pitch: Double = 440

  func tuneSharp() {
    print("increasing string tension...")
    self.pitch += 5
  }

  func tuneFlat() {
    print("decreasing string tension...")
    self.pitch -= 5
  }
}


class Saxophone: Tuneable {
  var pitch: Double = 440

  func tuneSharp() {
    print("pushing mouthpiece in...")
    self.pitch += 1
  }

  func tuneFlat() {
    print("pulling mouthpiece out...")
    self.pitch -= 1
  }
}

let guitar = Guitar()
let sax = Saxophone()
let instruments: [Tuneable] = [guitar, sax]

for i in instruments {
i.tuneSharp()
}
''''
