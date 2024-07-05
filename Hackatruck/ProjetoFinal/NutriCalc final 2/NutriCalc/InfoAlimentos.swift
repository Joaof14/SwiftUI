//
//  InfoAlimento.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI

struct InfoAlimentos: View {
    var food: alimento = alimento()
    var body: some View {
        ZStack{
            Rectangle().fill(Color("sacrament"))
                .ignoresSafeArea()
        
            VStack{
                VStack {
                    Text(food.NomeAlimento ?? "Nome Alimento").font(.title).foregroundColor(.white).bold()
                    
                    Text(food.TipoAlimento ?? "tipo de alimento").foregroundColor(.white).font(.title2).padding(.bottom)
                    Text("Para porção de 100 gramas:")
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                ScrollView{
                    VStack{
                        VStack{
                            Text("Proteínas (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(food.Proteinas)")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .shadow(radius: 12.6)
                        .frame(width: 350)
                        .background(.red)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Gorduras (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(food.Gorduras)")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .shadow(radius: 12.6)
                        .frame(width: 350)
                        .background(.purple)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Carboidratos (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(food.Carboidratos)")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .frame(width: 350)
                        .background(.blue)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Calorias (kcal)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(food.Calorias)")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .frame(width: 350)
                        .background(.orange)
                        .cornerRadius(16)
                        
                        VStack{
                            Text("Fibras (g)")
                                .bold()
                                .foregroundColor(.white)
                            Text("\(food.FibraAlimentar ?? "")")
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .frame(width: 350)
                        .background(.green)
                        .cornerRadius(16)
                    }
                    
                }
            }
        }
    }
}

struct InfoAlimentos_Previews: PreviewProvider {
    static var previews: some View {
        InfoAlimentos(food: alimento())
    }
}
