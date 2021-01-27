/*:
## Nomenclatura e Identificadores
 Em nosso treinamento estudamos a importância de se utilizar uma nomenclatura apropriada, para identificarmos com facilidade os elementos de um programa.
 
 Vimos também que os identificadores devem ser definidos de forma clara e representar bem o que eles significam. Na Swift, utilizamos o padão *camel case* para definir os identificadores. Além disso, normalmente os identificadores são escritos utilizando a língua inglesa como referência.
 */
//:  - callout(Exercício): O trecho de código a seguir está calculando a média aritmética de um aluno, o número de faltas, e verificando se ele passou de ano. A lógica está funcionando, porém os identificadores estão fora do padrão de boas práticas que estudamos.  O seu papel será ajustar os identificadores, porém sem interferir no funcionamento do algoritmo:
let nota1 = 5.0
let nota2 = 7.5
let faltasDoAluno = 25

let calcMedia = (nota1 + nota2) / 2

if (calcMedia > 6.0 && faltasDoAluno < 26) {
    print("Aluno aprovado com média \(calcMedia)")
} else {
    print("Aluno reprovado")
}

/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html)


[Anterior](@previous)  |  página 2 de 7  |  [Próximo: Constantes e Variáveis](@next)
 */
