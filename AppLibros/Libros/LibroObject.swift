//
//  LibroObject.swift
//  AppLibros
//
//  Created by Saúl Pérez on 23/01/22.
//

import Foundation
import UIKit


class LibroObject{
    var libro : [Libro]?
    
    init(libro : [Libro]){
        self.libro = libro
    }
        
}

class Libro{
    var titulo : String?
    var descripcion : String?
    var imagen : String?
    var autor : String?
    var categoria : String?
    
    
    init(titulo : String, descripcion : String, autor : String, imagen : String, categoria : String){
        self.titulo = titulo
        self.descripcion = descripcion
        self.imagen = imagen
        self.autor = autor
        self.categoria = categoria
        
    }
  
}

