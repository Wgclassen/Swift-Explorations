//------------------------------------------------
//-- Desafio Tupla
//------------------------------------------------

// Monte uma tupla com os detalhes do endereço da Foursys Curitiba

var nome_rua       : String = "Av. Copacabana"
var numero_rua : Int = 90
var nome_bairro  : String = "Alphaville"
var nome_cidade        : String    = "Barueri"

var fourSysEndereco = (nome_rua, numero_rua, nome_bairro, nome_cidade)

fourSysEndereco.2
fourSysEndereco.3

print("O endereço da empresa de Tecnologia Foursys é localizado na \(fourSysEndereco.0) no número: \(fourSysEndereco.1) no bairro de: \(fourSysEndereco.2) no município de: \(fourSysEndereco.3)" )

// Exiba os detalhes campo a campo


