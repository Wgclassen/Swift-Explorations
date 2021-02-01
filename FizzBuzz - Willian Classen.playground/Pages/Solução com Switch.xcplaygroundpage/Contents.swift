/*:
 ## Solução do FizzBuzz com Switch Case
 
 Uma boa alternativa para solucionar o enigma é utilizando switch e, naturalmente, um loop também:
 
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
    switch true {
    case (number+1) % Fizz == 0 && (number+1) % Buzz == 0:
        print("FizzBuzz")
    case (number+1) % Fizz == 0:
        print("Fizz")
    case (number+1) % Buzz == 0:
        print("Buzz")
    default:
        print(number+1)
    }
}
/*:
 [Anterior](@previous)  |  página 3 of 3
 */
