/*:
## Instâncias, Métodos e Propriedades
 
 Quando estudamos o playground da Apple *Instances, Methods and Properties*,  vimos muitos exemplos de criação de instâncias de tipos e uso de suas propriedades e métodos, mas sempre de tipos nativos da linguagem.
 
 Para expandir nosso conhecimento, o trecho de código a seguir contém um tipo, no caso, uma classe, criada pelo programador. Ao observar o código, você verá que esta classe foi criada para controlar um contador, e que ela contém uma propriedade e três métodos:
 */
 
 class Counter {
     var count = 0
     func increment() {
         count += 1
     }
     func increment(by amount: Int) {
         count += amount
     }
     func reset() {
         count = 0
     }
    func showValue() {
        print(count)
    }
 }
//:  - callout(Exercício 1): Utilizando o mesmo conceito de *dot syntax* que estudamos no playground da Apple, codifique uma sequência de instruções que execute as tarefas a seguir. Para vaildar os resultados, utilize a propriedade e os métodos da própria classe:
/*:
- `Crie uma instância do contador`
- `Adicione um no contador`
- `Acrescente cinco ao contador`
- `Reinicialize o contador para zero`
 */
// Codifique aqui sua solução
let counter1 = Counter()
counter1.showValue()
counter1.increment()
counter1.showValue()
counter1.increment(by: 5)
counter1.showValue()
counter1.reset()
counter1.showValue()
//:  - callout(Exercício 2): Crie um novo métódo na classe contador que retorne o valor corrente do contador. Trate o valor de retorno e faça os testes necessários para certificar-se que tudo esteja funcionando adequadamente:
// Codifique aqui sua solução




/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/LanguageGuide/Methods.html#)


[Anterior](@previous)  |  página 4 of 6  |  [Próximo: Vetores](@next)
 */
