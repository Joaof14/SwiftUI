//
//  Menu.swift
//  NutriCalc
//
//  Created by Student11 on 30/10/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            TabView{
                
                
                VPerfil()
                    .tabItem(){
                        Label("Perfil", systemImage: "person.circle.fill")
                                }
                
                Dieta()
                    .tabItem(){
                        Label("Dieta", systemImage: "fork.knife")
                    }
                
               
                            
                Meta()
                    .tabItem(){
                        Label("Metas", systemImage: "chart.bar.fill")
                                }
                        }
            .onAppear(){
                UITabBar.appearance().backgroundColor = .white
            }
            .tint(.green)
        }.navigationBarBackButtonHidden(true)
        
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
