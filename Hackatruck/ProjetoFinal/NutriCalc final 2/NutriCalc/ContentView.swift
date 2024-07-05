//
//  ContentView.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("forest"), Color("jade"), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea()
                
            VStack {
                VStack{
                    Image(systemName: "fork.knife.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                    
                    Text("NutriCalc")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                }
                .padding(.bottom, 60)
                
                
                NavigationLink(destination: Menu()){
                    
                    Text("Entrar")
                        .bold()
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("jade"))
                        .shadow(radius: 10)
                    }
                }
            }
        }.tint(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
