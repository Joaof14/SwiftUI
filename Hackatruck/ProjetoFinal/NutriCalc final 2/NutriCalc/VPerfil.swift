//
//  Perfil.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI

struct perfilg {
    static var Globalv : [Perfil] = []
    static var proteina : Float = 0
    static var caloria : Float = 0
    static var gordura : Float = 0
    static var carboidrato : Float = 0
    
}

struct VPerfil: View {
    var user: Perfil = Perfil()
    @StateObject var qmp = ViewModel()
    

    var body: some View {
        ZStack{
            
            Rectangle().fill(Color("sacrament"))
                .ignoresSafeArea()
            
                List{
                    Group{
                        ForEach(qmp.perfis, id:\.self){ perfi in
                            
                        HStack{
                            Text("Nome:").bold()
                            Text(perfi.Nome)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("Email:").bold()
                            Text(perfi.Email)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("Idade:").bold()
                            Text(perfi.Idade)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("Peso:").bold()
                            Text(perfi.Peso)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("Altura:").bold()
                            Text(perfi.Altura)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("Sexo:").bold()
                            Text(perfi.Sexo)
                        }.foregroundColor(Color("forest"))
                        HStack{
                            Text("IMC:").bold()
                            Text(perfi.IMC)
                        }.foregroundColor(Color("forest"))
                    }
                    }
                    
                    Group{
                        VStack(alignment: .leading){
                            Text("Atividades Físicas:").bold()
                            ForEach(user.AtividadeFisica, id: \.self){txt in
                                Text(txt).multilineTextAlignment(.leading)
                            }
                        }.foregroundColor(Color("forest"))
                        VStack(alignment: .leading){
                            Text("Alergias:").bold()
                            ForEach(user.Alergias, id: \.self){txt in
                                Text(txt)
                            }
                        }.foregroundColor(Color("forest"))
                        VStack(alignment: .leading){
                            Text("Doenças:").bold()
                            ForEach(user.Doencas, id: \.self){txt in
                                Text(txt)
                        }
                    }.foregroundColor(Color("forest"))
                }
                }.scrollContentBackground(.hidden)
        }.onAppear(){
            qmp.fetchperfill()
            
        }
        
    }
}

struct VPerfil_Previews: PreviewProvider {
    static var previews: some View {
        VPerfil(user: Perfil())
    }
}
