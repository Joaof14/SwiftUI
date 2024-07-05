//
//  InfoAlimento.swift
//  NutriCalc
//
//  Created by Student02 on 30/10/23.
//

import SwiftUI

struct InfoAlimento: View {
    var body: some View {
        VStack{
            
            HStack{
                Text("Carboidratos:")
                Text("Proteínas:")
            }
            HStack{ Text("Lipídeos:")
                Text("Calorias:")}
            Spacer()
            VStack{
                Text("Adicionar Alimento")
                
            }
        }
    }
}

struct InfoAlimento_Previews: PreviewProvider {
    static var previews: some View {
        InfoAlimento()
    }
}
