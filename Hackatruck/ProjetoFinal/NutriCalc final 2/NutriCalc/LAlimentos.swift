//
//  LAlimentos.swift
//  NutriCalc
//
//  Created by Student02 on 07/11/23.
//

import SwiftUI

struct LAlimentos: View {
    @State private var foods: [alimento] = [
        alimento(NomeAlimento: "Batata"),
        alimento(NomeAlimento: "Arroz"),
        alimento(NomeAlimento: "cenoura")
    ]
    @StateObject var qm = ViewModel()
    
    @Binding var refeicao : Refeicao
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle().fill(Color("sacrament"))
                
                VStack{
                    ScrollView{
                        
                        TextField(
                            "Busque Seu Alimento",
                            text: $searchText
                        ).padding(.top, 40)
                        .padding(30).background(.white)
                        
                        VStack{
                            
                            
                            ForEach(filteredMessages, id:\.self){ food in
                                HStack{
                                    Button(){
                                        refeicao.AlimentosRefeicao?.append(food)
                                    } label: {
                                        Image(systemName: "plus.app.fill")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                    NavigationLink(destination : InfoAlimentos(food: food)){
                                        
                                        VStack(alignment: .leading){
                                            Text(food.NomeAlimento!).foregroundColor(.white).font(.title2)
                                        }
                                    }
                                }.padding()
                                    .foregroundColor(.white)
                                
                            }.navigationTitle("Alimentos").foregroundColor(.white)
                            
                        }
                        
                    }.onAppear(){
                        qm.fetch()
                    }
                }
            }.ignoresSafeArea()
        }
    }
    
    var filteredMessages: [alimento] {
        if searchText.isEmpty {
            return qm.alimentos
        } else {
            return qm.alimentos.filter { $0.NomeAlimento!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

//struct LAlimentos_Previews: PreviewProvider {
//    static var previews: some View {
//        LAlimentos()
//    }
//}
