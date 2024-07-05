//
//  Models.swift
//  NutriCalc
//
//  Created by Student02 on 06/11/23.
//

import Foundation

struct Objetivo: Codable, Hashable {
    var Proteinas: String = ""
    var Carboidratos: String = ""
    var Gorduras: String = ""
    var Calorias: String = ""
}

struct alimento: Codable, Hashable {
    var Index: Int?
    var NomeAlimento: String?
    var Proteinas: String = ""
    var Carboidratos: String = ""
    var Gorduras: String = ""
    var Calorias: String = ""
    var FibraAlimentar: String?
    var TipoAlimento: String?
    
}

struct Refeicao: Codable, Hashable {
    //var id: String?
    var NomeRefeicao: String?
    var HorarioRefeicao: String?
    var AlimentosRefeicao: [alimento]?
}

struct Perfil: Codable, Hashable {
    var Index: String = ""
    var Nome: String = "Anderson"
    var Email: String = "teste@testmail.com"
    var Idade: String = "999"
    var Peso: String = "1"
    var Altura: String = "1.000,00"
    var Sexo: String = "helicoptero"
    var IMC: String = "nenhum"
    var AtividadeFisica: [String] = ["nenhuma"]
    //var Gordura: String = "Opcional"
    var Alergias: [String] = ["nenhuma"]
    var Doencas: [String] = ["nenhuma"]
    var Refeicoes: [Refeicao]? = []
    var Metas:  Objetivo = Objetivo()
    
}

