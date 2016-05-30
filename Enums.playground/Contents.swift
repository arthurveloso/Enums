//: Playground - noun: a place where people can play

import UIKit

// Enum comum
enum PontosCardeais {
    case Norte
    case Sul
    case Leste
    case Oeste
}

// Enum com apenas uma linha
//enum PontosCardeais {
//    case Norte, Sul, Leste, Oeste
//}


// Enum com tipagem
enum Nome: String{
    case Elder = "Elder"
    case Arthur = "Arthur"
    case Albert = "Albert"
    case Vinhote = "Vinhote"
}

// Inicializando
var direcao = PontosCardeais.Norte

// Atribuição
direcao = .Sul

switch direcao  {
case .Norte:
    print("Direção Norte")
    break
case .Sul:
    print("Direção Sul")
    break
case .Leste:
    print("Direção Leste")
    break
case .Oeste:
    print("Direção Oeste")
    break
}



enum DeviceIOS{
    case iPhone(String), iPad(String), iWatch
}

var meuDevice = DeviceIOS.iPhone("6")

switch meuDevice {
    
case let .iPhone(model):
    
    print("iPhone \(model)")
    
case .iPad(let model):
    
    print("iPad \(model)")
    
case .iWatch:
    
    print("iWatch")
    
default:
    
    print("not an iOS device")
}


var seis = DeviceIOS.iPhone("6")
var seisPlus = DeviceIOS.iPhone("6 Plus")
var pad = DeviceIOS.iPad("Air")

func devices(primeiro: DeviceIOS, segundo: DeviceIOS) -> Bool {
    switch (primeiro, segundo) {
    case (.iPhone(let a), .iPhone(let b)) where a == b:
        return true
    case (.iPad(let a), .iPad(let b)) where a == b:
        return true
    case (.iWatch, .iWatch):
        return true
    default:
        return false
    }
}

print(devices(meuDevice, segundo: seis))
print(devices(meuDevice, segundo: seisPlus))
print(devices(seisPlus, segundo: pad))


enum Direcao: Int {
    case Up = 1
    case Down
    case Left
    case Right
    //    case a = 8
    //    case b
    //    case c
    //    case d
}

Direcao.Up.rawValue
Direcao.Down.rawValue
Direcao.Left.rawValue
Direcao.Right.rawValue
//Direcao.a.rawValue
//Direcao.b.rawValue
//Direcao.c.rawValue
//Direcao.d.rawValue




indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .Multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

//print(evaluate(product))


var passos : [Direcao] = [.Up, .Right, .Up, .Right, .Up]

func localizacao(passos: [Direcao])->(x: Int, y: Int){
    
    var local = (x: 0, y: 0)
    for passo in passos {
        switch passo {
        case .Up:
            local.y += 1
        case .Down:
            local.y -= 1
        case .Right:
            local.x += 1
        case .Left:
            local.x -= 1
        }
    }
    return local
}


print(localizacao(passos))

//Declaraçāo do enum
enum codigoDeBarra {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

//atribuição do enum a variável codigoDeBarra
var codigoDeBarraProduto = codigoDeBarra.UPCA(8, 85909, 51226, 3)

//Teste para UPCA
switch codigoDeBarraProduto {
case .UPCA(let numeroNoSistema, let fabricante, let produto, let checagem):
    print("UPC-A: \(numeroNoSistema), \(fabricante), \(produto), \(checagem).")
case .QRCode(let codigoDoProduto):
    print("QR code: \(codigoDoProduto).")
}

//Atribuindo QRCode à variável codigoDeBarraProduto
codigoDeBarraProduto = .QRCode("GrupoDosEnuns")

//Teste Para QRCode
switch codigoDeBarraProduto {
case .UPCA(let numeroNoSistema, let fabricante, let produto, let checagem):
    print("UPC-A: \(numeroNoSistema), \(fabricante), \(produto), \(checagem).")
case .QRCode(let codigoDoProduto):
    print("QR code: \(codigoDoProduto).")
}

enum Contato{
    case Email(String)
    case Celular(String),
    Telefone(String)
}

enum Sexo:Character {
    case FEMININO = "F",
    MASCULINO = "M",
    OUTROS = "O"
}

enum Humano{
    case Nome(String)
    case Idade(Int)
    case S(Character)
    indirect case pessoa(Humano, Humano, Humano)
    indirect case sexo(Humano)
}

let sexualidade = Humano.S(Sexo.OUTROS.rawValue)
let sexo = Humano.sexo(sexualidade)
let h = Humano.pessoa(Humano.Nome("Arthur"), Humano.Idade(24), sexo)

let sexualidade1 = Humano.S(Sexo.MASCULINO.rawValue)
let sexo1 = Humano.sexo(sexualidade)
let h1 = Humano.pessoa(Humano.Nome("Vinhote"), Humano.Idade(7), sexo)

let sexualidade2 = Humano.S(Sexo.MASCULINO.rawValue)
let sexo2 = Humano.sexo(sexualidade)
let h2 = Humano.pessoa(Humano.Nome("Albert"), Humano.Idade(97), sexo2)

let im = Humano.pessoa(h, h1, h2)

func imprimir(h: Humano)->String{
    switch h {
    case let .Nome(nome):
        return nome
        break
    case let .Idade(idade):
        return String(idade)
        break
    case let .S(sexo):
        return String(sexo)
        break
    case let .sexo(sexualidade):
        return imprimir(sexualidade)
        break
    case let .pessoa(nome, idade, sexo):
        return imprimir(nome) + ", " + imprimir(idade) + ", " + imprimir(sexo)
        break
    }
}

print(imprimir(im))

func fatorial(valor: Int)->Int{
    if valor == 0 || valor == 1 {
        return 1
    }else{
        return valor * fatorial(valor - 1)
    }
}

//fatorial(5)














