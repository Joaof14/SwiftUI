//
//  Meta.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI
import Charts
struct Meta: View {
    @State var caloria: Float = 0
    @State var carboidrato: Float = 0
    @State var proteina: Float = 0
    @State var gordura: Float = 0
    
    var body: some View {
        ZStack{
            
            Rectangle().fill(Color("sacrament"))
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    
                    Chart {
                                BarMark(x: .value("Type", "Calorias"),
                                        y: .value("Population", caloria))
                                .foregroundStyle(.orange)

                                BarMark(x: .value("Type", "carboidrato"),
                                        y: .value("Population", carboidrato))
                                .foregroundStyle(.blue)

                                BarMark(x: .value("Type", "proteina"),
                                        y: .value("Population", proteina))
                                .foregroundStyle(.red)
                        
                        BarMark(x: .value("Type", "gordura"),
                                y: .value("Population", gordura))
                        .foregroundStyle(.purple)
                            }
                            .aspectRatio(1, contentMode: .fit)
                            .padding()
                        
                    
                    
                    VStack(alignment: .leading){
                        Text("Calorias")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        ProgressView("\(String(format: "%.1f", caloria))/ 2000 kcal", value: caloria, total: 2000)
                            .padding()
                            .foregroundColor(.white)
                            .tint(.orange)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("jade"), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(16)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Carboidratos")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        ProgressView("\(String(format: "%.1f", carboidrato)) / 250 g", value: carboidrato, total: 250)
                            .padding()
                            .foregroundColor(.white)
                            .tint(.blue)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("jade"), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(16)
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Proteínas")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        ProgressView("\(String(format: "%.1f", proteina)) / 150 g", value: proteina, total: 150)
                            .padding()
                            .foregroundColor(.white)
                            .tint(.red)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("jade"), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(16)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Lipídeos")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        ProgressView("\(String(format: "%.1f", gordura)) / 70 g", value: gordura, total: 70)
                            .padding()
                            .foregroundColor(.white)
                            .tint(.purple)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("jade"), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(16)
                    
                }.onAppear(){
                   self.proteina = perfilg.proteina
                    self.gordura = perfilg.gordura
                     self.caloria = perfilg.caloria
                   self.carboidrato = perfilg.carboidrato
                }.padding()
                
            }.padding().frame(width: 400)
        }.ignoresSafeArea()
    }
}

struct Meta_Previews: PreviewProvider {
    static var previews: some View {
        Meta()
    }
}
