/*:
## Tomada de Decisões
 Quando estudamos pensamento computacional vimos que a seleção é um dos conceitos mais importantes para construirmos estruturas de decisão em lógica de programação.
 
 Quando traduzimos o conceito para a codificação, a seleção é implementada na prática através de comandos if-else e switch-case.
 
 Nos exercícios a seguir iremos revisar esse conceito essencial.
 
 */
//:  - callout(Exercício): Estamos desenvolvendo uma nova *skill* para a Alexa, onde se a frase do usuário contiver as palavras "acorde" ou "alarme", a Alexa deve criar um novo registro de alarme. O nosso foco aqui é a construção da seleção das palavras, portanto para efeitos práticos declare a frase do usuário como uma *constante* e o registro de alarme como um simples comando *print()*:
import Foundation

// Codifique aqui a solução com if-else:
let alarmTrigger = "alarme"
let acordeTrigger = "acorde"
let userPhrase = "Alexa, eu estou treinando um acorde de guitarra"

if userPhrase.contains(acordeTrigger) || userPhrase.contains(alarmTrigger) {
 print("Entendido, preparando alarme!")
}
/*:
- Experiment: É bem provável que você tenha utilizado um comando if-else para resolver o problema descrito pelo exercício anterior. A ideia aqui é que você crie uma solução com os mesmos resultados práticos, porém utilizando a estrutura lógica switch-case. Após efetuar todos os testes, qual destas duas construções lógicas você acha mais adequada para o problema apresentado?
*/
// Codifique aqui a solução com switch-case:
switch userPhrase.contains("acorde"){
case true:
    print ("Deu!")
case false:
    print("Num deu")
}

/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)


[Anterior](@previous)  |  página 3 of 6 |  [Próximo: Instâncias, Métodos e Propriedades](@next)
 */
