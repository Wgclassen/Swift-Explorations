/*:
## Constantes e Variáveis
 Em nosso treinamento estudamos a forma de definir constantes e variáveis na linguagem Swift, e vimos também que a Apple recomenda o uso preferencial de *let*, aplicando *var* somente quando necessário, ou seja, para identificadores que poderão sofrer alterações durante a execução do código.
 
 Vimos também que a definiçao de constantes e variáveis devem seguir os padrões de nomenclatura da linguagem, e como boa prática não devemos utilizar literais (de texto ou numéricas) diretamente no código, sem estarem associados à uma variável ou constante.
 
 */
//:  - callout(Exercício): O algoritmo a seguir deveria verificar se um quiz de tecnologia está corretamente construído. Em caso de todas as respostas estarem corretas o total de pontos deveria ser = 100, porém não é o que está acontecendo. Verique o que pode estar errado e se necessário efetue as modificações necessárias para deixar o código mais sustentável e seguro:

let questions = [
    "1. the process of converting a high-level language to machine language is known as compilations",
    "2. A source file contains code written in a programming language that is to be sent to the compiler",
    "3. Careful design of software can result in programs that will be efficient, error-free, and easy to maintain",
    "4. Writing code is the first step in the waterfall model of developing software",
    "5. Pseudo-code and flowcharts can be used to represent individual algorithms of a program",
    "6. Pseudo-code uses exact programming language syntax to represent a module in the larger program",
    "7. The C programming language is considered a structured programming language",
    "8. Select meaningful identifiers (names) for all the variables in the program",
    "9. the return statement cannot contain an expression",
    "10. Variables are named memory locations that have a type"
]
let answers = [
    "true",
    "true",
    "true",
    "false",
    "true",
    "false",
    "true",
    "true",
    "false",
    "true"
]

var index = 0
var score = 0

print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 1
print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 2
print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 3
print(questions[index])
if answers[index] == "false" {
    score += 10
}

index = 4
print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 5
print(questions[index])
if answers[index] == "false" {
    score += 10
}

index = 6
print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 7
print(questions[index])
if answers[index] == "true" {
    score += 10
}

index = 8
print(questions[index])
if answers[index] == "false" {
    score += 10
}

index = 9
print(questions[index])
if answers[index] == "true" {
    score += 10
}

print("O total de pontos é \(score)")

/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)


[Anterior](@previous)  |  página 3 of 7 |  [Próximo: Strings](@next)
 */
