//
//  DetailBookViewController.swift
//  AppLibros
//
//  Created by Saúl Pérez on 23/01/22.
//

import UIKit

class DetailBookViewController: UIViewController {
    
    let azulMarino = UIColor(red: 53/255, green: 73/255, blue: 94/255, alpha: 1.00)
    let rojo = UIColor(red: 230/255, green: 76/255, blue: 60/255, alpha: 1.00)
    let rojito = UIColor(red: 192/255, green: 58/255, blue: 43/255, alpha: 1.00)
    let gris = UIColor(red: 124/255, green: 132/255, blue: 120/255, alpha: 1.00)
    let amarillo = UIColor(red: 244/255, green: 239/255, blue: 209/255, alpha: 1.00)
    
    
    var book : Libro?
    var backButton : UIButton?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
    //MARK: - Definicion del primer elemento
    var libroContentView : UIView?
    var libroImage : UIImageView?
    var productCard : UIView?
    var tituloLibro : UILabel?
    var autorLibro : UILabel?
    var catLibro : UILabel?
    
    //MARK: - Definicion de descripcion
    var descripcionView : UIView?
    var labelTitleDescription : UILabel?
    var descriptionTextView : UILabel?

    
    //MARK: - Definicion del tercer elemento
    var autorContentView : UIView?
    var autorImage : UIImageView?
    var nameAutor : UILabel?
    var bioAutor : UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = azulMarino
        initUI()
    }
     
    var autores = [
        
        "José Ovejero" : "De 1988 a 2001 trabajó como intérprete. Ha tocado todos los géneros: poesía, cuento, novela, ensayo, libro de viajes y teatro. Ha obtenido varios premios, entre ellos el Primavera 2005 por Las vidas ajenas.",
        "Byung-Chul Han" : "Es un filósofo y ensayista surcoreano experto en estudios culturales y profesor de la Universidad de las Artes de Berlín. Escribe en idioma alemán y está considerado como uno de los filósofos más destacados del pensamiento contemporáneo por su crítica al capitalismo, la sociedad del trabajo, la tecnología y la hipertransparencia.",
        "Osamu Dazai" : "Nacido bajo el nombre de Shūji Tsushima (津島 修治 Tsushima Shūji?), fue un novelista japonés, considerado uno de los escritores del siglo XX más apreciados de Japón.",
        "Napa" : "Es un guerrero saiyano de élite proveniente del Planeta Vegeta y era el anterior compañero de Vegeta. Antes de la destrucción del Planeta Vegeta, Nappa era el general del Ejército Saiyano bajo el Imperio de Freeza y el ayudante del Príncipe Vegeta.",
        "Wayne W. Dyer" : "Nació en Detroit en 1940, en un barrio pobre. Creció como huérfano y fue cuidado por un tío. Sirvió en la Marina estadounidense antes de estudiar en la Wayne State University, donde obtuvo su doctorado en psicología.",
        "José Saramago" : "Fue un escritor portugués. En 1998 se le otorgó el Premio Nobel de Literatura. La Academia Sueca destacó su capacidad para «volver comprensible una realidad huidiza, con parábolas sostenidas por la imaginación, la compasión y la ironía",
        "Pedro Ugarte" : "(Bilbao, 1963) ha dedicado buena parte de su trabajo literario a la narrativa breve, con libros como Los traficantes de palabras, Manual para extranjeros, La isla de Komodo y Mañana será otro día.",
        "Carlos Castán" : "Aunque de origen altoaragonés, nació en Barcelona en 1960. Es licenciado en Filosofía por la Universidad Autónoma de Madrid, ciudad en la que ha transcurrido buena parte de su vida y donde actualmente trabaja como profesor de filosofía en la enseñanza pública.",
    ]
    
    var autores2 = [ //las fotos

        "José Ovejero" : "foto1",
        "Byung-Chul Han" : "foto2",
        "Osamu Dazai" : "foto3",
        "Napa" : "foto4",
        "Wayne W. Dyer" : "foto5",
        "José Saramago" : "foto6",
        "Pedro Ugarte" : "foto7",
        "Carlos Castán" : "foto8",
    ]

    
    //Byung-Chul Han, Napa, Osamu Dazai, José Ovejero,Wayne W. Dyer, José Saramago, Pedro Ugarte, Carlos Castán

    
    func initUI(){

        
        backButton = UIButton(frame: CGRect(x: 10, y: 50, width: 100, height: 40))
        backButton?.backgroundColor = .clear
        backButton?.setTitleColor(amarillo, for: .normal)
        backButton?.setTitle("← Regresar", for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        view.addSubview(backButton!)
        
        libroView()
        descriptView()
        autorView()
        
    }
    
    
    func libroView(){
        libroContentView = UIView(frame: CGRect(x: 20, y: 130, width: width - 40, height: height/3))
        //libroContentView?.backgroundColor = .systemBlue
        view.addSubview(libroContentView!)
        
        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/6))
        productCard?.backgroundColor = amarillo
        productCard?.layer.cornerRadius = 15
        libroContentView?.addSubview(productCard!)
        
        libroImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 30)/3, height: height/4 - 20))
        libroImage?.image = UIImage(named: book?.imagen ?? "")
        libroImage?.contentMode = .scaleAspectFit
        libroContentView?.addSubview(libroImage!)
        
        tituloLibro = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y:10 , width: (width - 40) - (((width - 40)/3) + 40), height: 30))
        tituloLibro?.text = book?.titulo ?? ""
        tituloLibro?.textAlignment = .center
        tituloLibro?.font = .boldSystemFont(ofSize: 16)
        productCard?.addSubview(tituloLibro!)
        
        autorLibro = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y: 30, width: (width - 40) - (((width - 40)/3) + 40), height: (height/8) - 60))
        autorLibro?.text = book?.autor
        autorLibro?.font = .systemFont(ofSize: 13)
        autorLibro?.textAlignment = .center
        autorLibro?.backgroundColor = .clear
        productCard?.addSubview(autorLibro!)
        
        catLibro = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y: 55, width: (width - 40) - (((width - 40)/3) + 40), height: (height/8) - 60))
        catLibro?.text = book?.categoria
        catLibro?.textAlignment = .center
        catLibro?.font = .italicSystemFont(ofSize: 11.0)
        productCard?.addSubview(catLibro!)
        
    }
    
    
    func descriptView(){
        descripcionView = UIView(frame: CGRect(x: 20, y:  400, width: width - 40, height: height/5))
        descripcionView?.backgroundColor = amarillo
        descripcionView?.layer.cornerRadius = 15
        view.addSubview(descripcionView!)
        
        labelTitleDescription = UILabel(frame: CGRect(x: 150, y:10 , width: 300 , height: 30))
        labelTitleDescription?.text = "Sinópsis"
        labelTitleDescription?.textAlignment = .center
        labelTitleDescription?.numberOfLines = 0
        labelTitleDescription?.textAlignment = .left
        labelTitleDescription?.font = .boldSystemFont(ofSize: 16)
        descripcionView?.addSubview(labelTitleDescription!)
        
        descriptionTextView = UILabel(frame: CGRect(x: 7 , y: 11 , width: 340 , height: 150))
        descriptionTextView?.text = book?.descripcion
        descriptionTextView?.font = .systemFont(ofSize: 13)
        descriptionTextView?.textAlignment = .center
        descriptionTextView?.numberOfLines = 0
        descriptionTextView?.backgroundColor = .clear
        descripcionView?.addSubview(descriptionTextView!)
        
    }
    
    
    func autorView(){
        autorContentView = UIView(frame: CGRect(x: 20, y: 600, width: width - 40, height: height/4))
        autorContentView?.backgroundColor = amarillo
        autorContentView?.layer.cornerRadius = 15
        view.addSubview(autorContentView!)
        
        autorImage = UIImageView(frame: CGRect(x: 10, y: 5, width: (width - 40)/3, height: height/4 - 20))
        
        var autorAux2 : String?
         autorAux2 = book?.autor ?? ""
         print(autorAux2!)
        let existeAutor2 = autores2[autorAux2 ?? ""] != nil
        
            if existeAutor2 {
                print("Encontré la foto")
                let value2 = autores2[autorAux2 ?? ""]
                print(value2!)
                autorImage?.image = UIImage(named: value2 ??  "")
            }else{
                print("No encontré la foto")
            }
        
        autorImage?.layer.masksToBounds = true
        autorImage?.layer.cornerRadius = 70
       autorImage?.contentMode = .scaleAspectFit
        autorContentView?.addSubview(autorImage!)
        
        nameAutor = UILabel(frame: CGRect(x: width/2 - 150, y:10 , width: 300 , height: 30))
        nameAutor?.text = book?.autor
        nameAutor?.textAlignment = .center
        nameAutor?.font = .boldSystemFont(ofSize: 16)
        autorContentView?.addSubview(nameAutor!)
        
        bioAutor = UILabel(frame: CGRect(x: width/3, y: 50, width: width/2, height: 100))
      
        var autorAux : String?
         autorAux = book?.autor ?? ""
         print(autorAux!)
        let existeAutor = autores[autorAux ?? ""] != nil
            
            if existeAutor {
                print("es el mismo")
                let value = autores[autorAux ?? ""]
                print(value!)
                bioAutor?.text = value
            }else{
                bioAutor?.text = "Biografía no encontrada en nuestra base de datos."
                autores[autorAux ?? ""] = "Nuevo"
                print("no es el mismo")
                printContent(autores)
            }
                                
        bioAutor?.font = .systemFont(ofSize: 14)
        bioAutor?.textAlignment = .right
        bioAutor?.backgroundColor = .clear
        bioAutor?.numberOfLines = 0
        autorContentView?.addSubview(bioAutor!)
        
    }
    

    
    
    @objc func backAction(){
        print("De regreso")
        dismiss(animated: true)
    }

}
