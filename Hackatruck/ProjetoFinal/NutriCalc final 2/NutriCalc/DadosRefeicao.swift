//
//  DadosRefeicao.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI


/*struct AlimentoAtualRow : View {
    let nome: String
    
    var body: some View {
        Text(nome)
    }
}*/

class AlimentosViewModel: ObservableObject {
    @Published var alimentos : [alimento] = []
}

struct alimentg {
    static var Globalv : Refeicao = Refeicao()
    
}

struct DadosRefeicao: View {
    var user: Perfil = Perfil()
    @Binding var refeicao: Refeicao
    @State var text = ""
    @StateObject var alimentosVM = AlimentosViewModel()
    
    @State var proteina : Float = 0
    @State var caloria : Float = 0
    @State var gordura : Float = 0
    @State var carboidrato : Float = 0
    

    
    func deleteItem(at offsets: IndexSet){
        
        var item : alimento?
        
        for index in offsets{
            item = refeicao.AlimentosRefeicao![index]
        }
        
        proteina = proteina - Float(item!.Proteinas)!
        caloria = caloria - Float(item!.Calorias)!
        gordura  = gordura - Float(item!.Gorduras)!
        carboidrato = carboidrato - Float(item!.Carboidratos)!
        
    refeicao.AlimentosRefeicao!.remove(atOffsets: offsets)
        
        
    }
    
    var body: some View {
        
        ZStack{
            
            Rectangle().fill(Color("sacrament"))
                .ignoresSafeArea()
            
            VStack{
                Text(refeicao.NomeRefeicao!).bold().font(.title).foregroundColor(.green)
                
                
                HStack{
                    VStack(){
                        VStack{
                            Text("Proteínas (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(String(format: "%.1f", proteina))")
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding()
                        .frame(width: 170)
                        .background(.red)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Gorduras (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(String(format: "%.1f", gordura))")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .frame(width: 170)
                        .background(.purple)
                        .cornerRadius(16)
                        
                        
                    }
                    
                    VStack(){
                        VStack{
                            Text("Carboidratos (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(String(format: "%.1f", carboidrato))")
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding()
                        .frame(width: 170)
                        .background(.blue)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Calorias (kcal)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(String(format: "%.1f", caloria))")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .frame(width: 170)
                        .background(.orange)
                        .cornerRadius(16)
                        
                    }
                }.padding()
                
                NavigationLink(destination: LAlimentos(refeicao: $refeicao )){
                    
                    Text("Adicionar Alimento")
                        .bold()
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                if(refeicao.AlimentosRefeicao!.count > 0){
                    List{
                    ForEach(refeicao.AlimentosRefeicao!, id: \.self){ alimento in
                        NavigationLink(destination: InfoAlimentos(food: alimento)){
                            
                            Text(alimento.NomeAlimento!)
                                .foregroundColor(Color("forest"))
                            
                            Spacer()
                            
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onAppear(){
                        proteina = 0
                        caloria = 0
                        carboidrato = 0
                        gordura = 0
                        
                            for alimentref in refeicao.AlimentosRefeicao! {
                                self.proteina = proteina + Float(alimentref.Proteinas)!
                                
                                caloria = caloria + Float(alimentref.Calorias)!
                                
                                gordura  = gordura + Float(alimentref.Gorduras)!
                                
                                carboidrato = carboidrato + Float(alimentref.Carboidratos)!
                            }
                        }.scrollContentBackground(.hidden)
                    
                    
                    
                    
                    
                    
                    
                }.scrollContentBackground(.hidden)

            }
            }
        }
    }
}

