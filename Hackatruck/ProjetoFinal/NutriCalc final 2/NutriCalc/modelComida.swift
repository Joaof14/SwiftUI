//
//  modelComida.swift
//  models
//
//  Created by Student24 on 01/11/23.
//

import Foundation




//"index": 0,
//"Nome": "Arroz, integral, cozido",
//"Umidade(%)": "70.1",
//"Energia (kcal)": 124,
//"Energia (kJ)": 517,
//"Proteina(g)": 2.6,
//"Lipideos(g)": 1,
//"Colesterol(mg)": "nan",
//"Carboidrato(g)": 25.8,
//"Fibra Alimentar(g)": "2.7",
//"Cinzas(g)": "0.5",
//"Calcio(mg)": "5",
//"Magnesio(mg)": "59",
//"Tipo": "Cereais e Derivados"
//
//struct apialimento: Decodable, Hashable{
//    var alimentoslista: [alimento]
//}

struct food: Decodable, Hashable {
    var index: Int?
    var Nome: String?
    var Energia1 : Int?
    var Proteina : Float?
    var Lipideos: Float?
    var carboidrato: Float?
    var fibraAlimentar: String?
    var Tipo: String?
    
}
