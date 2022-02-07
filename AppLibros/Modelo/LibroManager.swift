//
//  LibroManager.swift
//  AppLibros2
//
//  Created by Saúl Pérez on 05/02/22.
//

import Foundation

struct LibroManager{
    
    func parse(comp : @escaping ([VolumeInfo]) -> ()){
        let api = URL(string: "https://www.googleapis.com/books/v1/volumes?q=baldor")
        
        URLSession.shared.dataTask(with: api!){
        
            data, response, error in
        if error != nil{
            print(error?.localizedDescription)
            print("no funcionó")
            return
        }
        do{
            let result = try JSONDecoder().decode(LibroData.self, from: data!)
            //comp(result.title as String)
            print("Parse func result:")
            print(result)
        } catch{
            
        }
            } .resume()
    }// func parse
    
}
