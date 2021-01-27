/*:
## Parâmetros e Resultados
 
 Vimos que as funções, mesmo as mais simples, organizam e reutilizam código de programação, diminuindo as repetições e redundâncias.
 
 As funções com parâmetros e resultados são ainda mais poderosas, tornano o código menos específico e mais flexível.

 */
//:  - callout(Exercício): O código a seguir procura validar o login de um usuário no sistema. Porém da forma que foi escrito é necessário repetir uma série de linhas para testar cada cenário diferente. O seu papel será simplificar o código, evitando as redundâncias da versão atual.
let generalPassword = "123ICantChange"
let generalUser = "User123"

var userTyped = ""
var passwordTyped = ""

func loginCheck (login: String, senha: String){
    if(login == generalUser && senha == generalPassword) {
        print("Olá, \(login)! A empresa lhe dá as boas vindas!")
    } else if (login == generalUser) {
        print("Senha incorreta. Tente novamente, por favor.")
    } else {
        print("Houve um problema no seu login. Verifique os dados digitados, por favor.")
    }
}

userTyped = "User123"
passwordTyped = "123ICantChange"
loginCheck(login: userTyped, senha: passwordTyped)

passwordTyped = "123ICanChange"
loginCheck(login: userTyped, senha: passwordTyped)

userTyped = "Fulano"
passwordTyped = "123ICantChange"
loginCheck(login: userTyped, senha: passwordTyped)

userTyped = "Willian"
passwordTyped = "Não lembro"
loginCheck(login: userTyped, senha: passwordTyped)
/*:
  Para mais informações, consulte: [The Swift Programming Language.](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)


[Anterior](@previous)  |  página 7 of 7
 */

