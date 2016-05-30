//: Playground - noun: a place where people can play

import UIKit

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