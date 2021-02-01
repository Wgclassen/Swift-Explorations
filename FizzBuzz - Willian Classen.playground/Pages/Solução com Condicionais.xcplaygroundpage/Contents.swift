/*:
 ## Solução do FizzBuzz com Condicionais
 
 A solução mais utilizada para o desafio é utilizando condicionais e, naturalmente, um loop:
 
 */
// Codifique aqui sua solução
/*
 Escreva um programa que imprima os números de 1 a 100
 Para números divisíveis por 3, imprima "Fizz"
 Para números divisíveis por 5, imprima “Buzz”
 Para números divisíveis por 3 e 5, imprima “FizzBuzz”
 */

let numberLimit = 100
let Fizz = 3
let Buzz = 5

for number in 0 ..< numberLimit {
    if (number+1) % Fizz == 0 && (number+1) % Buzz == 0 {
        print("FizzBuzz")
    } else if (number+1) % Buzz == 0 {
        print("Buzz")
    } else if (number+1) % Fizz == 0 {
        print("Fizz")
    } else {
        print (number+1)
    }
}


/*:
 [Anterior](@previous)  |  página 2 de 3  |  [Próximo: Solução com Switch](@next)
 */
