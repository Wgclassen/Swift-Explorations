/*:
## Tipos
 
 Estudamos que, assim como na vida real, em programação é importante utilizar o objeto adequado para cada situação.
 
 Em *Swift*, cada valor possui um tipo, que tem suas próprias propriedades e comportamentos. Essa característica torna a linguagem mais segura e menos sujeita a erros.
 */
//:  - callout(Exercício): Suponha que um novo colega se juntou  à nossa turma. Ele tem uma forte bagagem em *Javascript*, e está estranhando alguns comportamentos da linguagem *Swift*. Por exemplo, ele portou o código abaixo de um projeto em *javascript*, que funcionava perfeitamente, porém em *Swift* estão ocorrendo vários erros de compilação. Você consegue explicar ao nosso novo colega as razões dos erros, e fazer o código funcionar?
var par1 = 5.0
var par2 = 7.5

func sum(par1: Double, par2: Double) -> Double {
    return par1 + par2
}

func subtraction(par1: Double, par2: Double) -> Double {
    return par1 - par2
}

func multiplication(par1: Double, par2: Double) -> Double {
    return par1 * par2
}

func division(par1: Double, par2: Double) -> Double {
    return par1 / par2
}

var sumResult = sum(par1: par1, par2: par2)
var subResult = subtraction(par1: par1,par2:  par2)
var mulResult = multiplication(par1: par1,par2: par2)
var divResult = division(par1: par1, par2: par2)

print("O resultado da soma é \(sumResult)")
print("O resultado da subtração é \(subResult)")
print("O resultado da multiplicação é \(mulResult)")
print("O resultado da divisão é \(divResult)")


/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/ReferenceManual/Types.html)


[Anterior](@previous)  |  página 6 of 7  |  [Próximo: Parâmetros e Resultados](@next)
 */
