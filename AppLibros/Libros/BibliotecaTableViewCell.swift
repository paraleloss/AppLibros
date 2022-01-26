//
//  BibliotecaTableViewCell.swift
//  AppLibros
//
//  Created by Saúl Pérez on 23/01/22.
//

import Foundation
import UIKit

class BibliotecaTableViewCell : UITableViewCell{
    
    let azulMarino = UIColor(red: 53/255, green: 73/255, blue: 94/255, alpha: 1.00)
    let rojo = UIColor(red: 230/255, green: 76/255, blue: 60/255, alpha: 1.00)
    let rojito = UIColor(red: 192/255, green: 58/255, blue: 43/255, alpha: 1.00)
    let gris = UIColor(red: 124/255, green: 132/255, blue: 120/255, alpha: 1.00)
    let amarillo = UIColor(red: 244/255, green: 239/255, blue: 209/255, alpha: 1.00)
    
    
    var ownContent : UIView?
    var tituloLibro : UILabel?
    var categoriaLabel : UILabel?
    var autorLabel : UILabel?
    var addButton : UIButton?
    var imageLibro : UIImageView?
    var libro : Libro?
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(libro : Libro){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        self.backgroundColor = .clear
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 0, width: width - 20, height: height/5))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        
        tituloLibro = UILabel(frame: CGRect(x: width/3, y: 10, width: width/2, height: 50))
        tituloLibro?.text = libro?.titulo
      //  tituloLibro?.textAlignment = .left
        tituloLibro?.numberOfLines = 0
        tituloLibro?.textColor = azulMarino
        tituloLibro?.backgroundColor = .clear
        tituloLibro?.font = .boldSystemFont(ofSize: 17)
        ownContent?.addSubview(tituloLibro!)
        
        categoriaLabel = UILabel(frame: CGRect(x: width/3, y: 80, width: width/2, height: 70))
        categoriaLabel?.text = libro?.categoria
        categoriaLabel?.font = .italicSystemFont(ofSize: 13.0)
        categoriaLabel?.textAlignment = .left
        categoriaLabel?.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(categoriaLabel!)
        
        autorLabel = UILabel(frame: CGRect(x: width/3, y: 50, width: width/2, height: 70))
        autorLabel?.text = libro?.autor
        autorLabel?.numberOfLines = 0
        autorLabel?.textAlignment = .left
        autorLabel?.adjustsFontSizeToFitWidth = true
        autorLabel?.font = .boldSystemFont(ofSize: 14)
        ownContent?.addSubview(autorLabel!)
        
        
        addButton = UIButton(frame: CGRect(x: width - 130, y: (height/5 - 10) - 55, width: width/4, height: 35))
        addButton?.backgroundColor = .clear
        addButton?.setTitle("más info ➡️", for: .normal)
        addButton?.setTitleColor(gris, for: .normal) // Modificamos el color del titulo del boton

        // addButton?.layer.borderWidth = 1
        ownContent?.addSubview(addButton!)
        
        
        
        imageLibro = UIImageView(frame: CGRect(x: 5, y: 0, width: width / 3 - 30, height: height/5 ))
        imageLibro?.image = UIImage(named: libro?.imagen ?? "")
        imageLibro?.backgroundColor = .clear
        imageLibro?.contentMode = .scaleAspectFit
        imageLibro?.layer.masksToBounds = true
        
        ownContent?.addSubview(imageLibro!)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
