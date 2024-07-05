//
//  DadosRefeicao.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI


class RefeicoesViewModel: ObservableObject{
    @Published var refeicoes : [Refeicao] = []
}


struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}

struct Dieta: View {
    var user: Perfil = Perfil()
    var nome: String = ""
    @StateObject var viewModel = RefeicoesViewModel()
    @State var text = ""
    @State var proteina : Float = 0
    @State var caloria : Float = 0
    @State var gordura : Float = 0
    @State var carboidrato : Float = 0
    
    
    
    func adicionarRefeicao() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let novaRefeicao = Refeicao(NomeRefeicao: text, AlimentosRefeicao: [])
        viewModel.refeicoes.append(novaRefeicao)
        text = ""
    }
    
    func move(from source: IndexSet, to destination: Int){
        viewModel.refeicoes.move(fromOffsets: source, toOffset: destination)
    }
    
    func magica(_ sinal : Bool){

        if(sinal){
            proteina = 0
            gordura = 0
            caloria = 0
            carboidrato = 0
        }
        
        for  a in viewModel.refeicoes{
            for b in a.AlimentosRefeicao! {
                if(sinal){
                   
                    
                    proteina += Float(b.Proteinas)!
                    gordura += Float(b.Gorduras)!
                    caloria += Float(b.Calorias)!
                    carboidrato += Float(b.Carboidratos)!
                }else{
                    proteina -= Float(b.Proteinas)!
                    gordura -= Float(b.Gorduras)!
                    caloria -= Float(b.Calorias)!
                    carboidrato -= Float(b.Carboidratos)!
                }
            }
        }
        
        perfilg.proteina = self.proteina
        perfilg.gordura =  self.gordura
        perfilg.caloria =  self.caloria
        perfilg.carboidrato = self.carboidrato
    }
    
    func deleteItem(at offsets: IndexSet){
        
        magica(false)
        
        var item : Refeicao?
        
        for index in offsets{
            item = viewModel.refeicoes[index]
        }

        
        viewModel.refeicoes.remove(atOffsets: offsets)
        perfilg.Globalv[0].Refeicoes?.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack{
            
            Rectangle().fill(Color("sacrament"))
                .ignoresSafeArea()
            
            VStack{
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
                VStack{
                    Text("Adicionar Refeição:")
                        .bold()
                        .foregroundColor(.white)
                    
                    HStack{
                        SuperTextField(
                            placeholder: Text("Nova refeição").foregroundColor(.white),
                            text: $text
                        )
                        .frame(width: 150)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 1)
                        )
                        
                        
                        Button{
                            self.adicionarRefeicao()
                            
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 1)
                )
                
                Spacer()
                
                if(viewModel.refeicoes.count > 0) {
                    List{
                        ForEach(viewModel.refeicoes.indices, id: \.self) { idx in
                            //ForEach(viewModel.refeicoes, id:\.self){ refeicao in
                            NavigationLink(destination: DadosRefeicao(refeicao: $viewModel.refeicoes[idx])){
                                HStack{
                                    Image(systemName: "fork.knife.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color("jade"))
                                    
                                    Text(self.viewModel.refeicoes[idx].NomeRefeicao!)
                                        .foregroundColor(Color("jade"))
                                    
                                    Spacer()
                                }
                                //                                }.onTapGesture {
                                //                                    //perfilg.Globalv[0].Refeicoes?.append(refeicao)
                                //                                    viewModel.refeicoes.append(self.viewModel.refeicoes[idx])
                                //
                                //                                    //print(refeicao)
                                //                                }.onChange(of: viewModel.refeicoes){newdata in
                                //                                    //perfilg.Globalv[0].Refeicoes?
                                //                                }
                            }
                        }
                        .onMove(perform: move)
                        .onDelete(perform: deleteItem)
                        
                    }
                    .onAppear(){
                        magica(true)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

struct Dieta_Previews: PreviewProvider {
    static var previews: some View {
        Dieta(user: Perfil())
    }
}
