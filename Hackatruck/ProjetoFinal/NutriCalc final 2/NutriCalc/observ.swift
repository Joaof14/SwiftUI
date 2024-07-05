//
//  requestisobs.swift
//  models
//
//  Created by Student24 on 01/11/23.
//

import Foundation


class ViewModel: ObservableObject{
    @Published var alimentos: [alimento] = []
    @Published var perfis: [Perfil] = []
    func fetch(){
        //DECLARAR A URL (endpoint)
        guard let url = URL(string: "http://192.168.128.172:1880/alimentoler") else{
            return
        }
        //CRIAR A TAREFA(TASK) - DECODIFICAR E SALVAR NO ARRAY
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let dadosDecodificados = try JSONDecoder().decode([alimento].self, from: data)
                DispatchQueue.main.async {
                    self?.alimentos = dadosDecodificados
                }
            } catch {
                print(error)
            }
        }
        //EXECUTAR A TAREFA
        task.resume()
    }
    
    func fetchperfill(){
        //DECLARAR A URL (endpoint)
        guard let url = URL(string: "http://192.168.128.172:1880/perfiller") else{
            return
        }
        //CRIAR A TAREFA(TASK) - DECODIFICAR E SALVAR NO ARRAY
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let dadosDecodificados = try JSONDecoder().decode([Perfil].self, from: data)
                DispatchQueue.main.async {
                    self?.perfis = dadosDecodificados
                    perfilg.Globalv = dadosDecodificados
                }
            } catch {
                print(error)
            }
        }
        //EXECUTAR A TAREFA
        task.resume()
    }
    
    func fetchperfil(novoperfil : Perfil){
        //DECLARAR A URL (endpoint)
        guard let url = URL(string: "http://192.168.128.172:1880/pefiller") else{return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do{
            let data = try JSONEncoder().encode(novoperfil)
            
            request.httpBody = data
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        //CRIAR A TAREFA(TASK) - DECODIFICAR E SALVAR NO ARRAY
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
                                                               if let error = error{
            print("Error encoding to JSON: \(error.localizedDescription)")
                return
            }
            
            
            guard let  httpResponse = response as? HTTPURLResponse else {
                print("Error in put resource: invalide response")
                    return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource update successfully")
            } else {
                print("Error deleting resource: status code \(httpResponse.statusCode)")
            }
        }
        //EXECUTAR A TAREFA
        task.resume()
    }
    
}
