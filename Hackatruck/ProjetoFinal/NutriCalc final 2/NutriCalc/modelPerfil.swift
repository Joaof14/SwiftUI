//
//  modelPerfil.swift
//  models
//
//  Created by Student24 on 01/11/23.
//

import Foundation

//struct listaPerfil: Decodable,Hashable{
//    var listaP :[Perfil]
//
//}

struct Profile: Decodable, Hashable {
    var index: Int?
    var Nome: String?
    var Idade : Int?
    var Peso : Float?
    var Altura: Float?
    var sexo: String?
    var AtividadeFisica: String?
    var Alergia: String?
    var Doenca: String?
    var refeicaoc: [refeicao]
    
}

/*
struct refeicao : Decodable, Hashable{
    var nomerefeicao: String?
    var Horario: Int?
    var refeicaoalimento: [alimento]
 }
*/
