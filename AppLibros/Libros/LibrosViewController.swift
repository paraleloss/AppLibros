//
//  LibrosViewController.swift
//  AppLibros
//
//  Created by Saúl Pérez on 23/01/22.
//

import UIKit


struct CustomData {
    var title: String
    var url: String
    var backgroundImage: UIImage
}
   
class LibrosViewController: UIViewController {

    
    var topCollection: UICollectionView!
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    let azulMarino = UIColor(red: 53/255, green: 73/255, blue: 94/255, alpha: 1.00)
    let rojo = UIColor(red: 230/255, green: 76/255, blue: 60/255, alpha: 1.00)
    let rojito = UIColor(red: 192/255, green: 58/255, blue: 43/255, alpha: 1.00)
    let gris = UIColor(red: 124/255, green: 132/255, blue: 120/255, alpha: 1.00)
    let amarillo = UIColor(red: 244/255, green: 239/255, blue: 209/255, alpha: 1.00)
    
    var tableView : UITableView?
    var dataSource : LibroObject?
    var tableLabel : UILabel?
    var holaLabel : UILabel?
    var sesionLabel : UILabel?
    var backButton : UIButton?
    var indicaLabel : UILabel?
    
    var buttonAutores : UIButton?
    var buttonCategorias : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
        view.backgroundColor = .systemGray5
        initUI()
    }

    func initUI(){
        
        backButton = UIButton(frame: CGRect(x: width - 100, y: 50, width: 100, height: 40))
        backButton?.backgroundColor = .clear
        backButton?.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        backButton?.setTitleColor(gris, for: .normal)
        backButton?.setTitle("log out🚪", for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        view.addSubview(backButton!)
        
        
        holaLabel = UILabel(frame: CGRect(x: 30, y: 100, width: width/3, height: 70))
        holaLabel?.text = "Hola:"
        holaLabel?.textColor = rojo
        holaLabel?.textAlignment = .left
        holaLabel?.font = .boldSystemFont(ofSize: 28)
        view.addSubview(holaLabel!)
        
        indicaLabel = UILabel(frame: CGRect(x: 30, y: 200, width: width, height: 70))
        indicaLabel?.text = "Mira lo más nuevo en libros:"
        indicaLabel?.textColor = gris
        indicaLabel?.numberOfLines = 0
        indicaLabel?.textAlignment = .left
        indicaLabel?.font = .boldSystemFont(ofSize: 16)
        view.addSubview(indicaLabel!)
        
        //label del user
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
 
        let sesion = appDelegate.sesion
        
 
        sesionLabel = UILabel(frame: CGRect(x: width/3, y: 100, width: width, height: 100))
        sesionLabel?.text = sesion + "!"
        sesionLabel?.textColor = azulMarino
        //sesionLabel?.textAlignment = .left
        indicaLabel?.numberOfLines = 0

        sesionLabel?.font = .boldSystemFont(ofSize: 54)
        view.addSubview(sesionLabel!)
        print(sesion)
        
        
        // Collection View de las images de los libros
        
        
        
        tableView = UITableView(frame: CGRect(x: 10, y: height/3, width: width - 20, height: height - 250))
        tableView?.backgroundColor = .clear
        tableView?.layer.cornerRadius = 10
        tableView?.delegate = self
        tableView?.dataSource = self
        
        //setupView()
        view.addSubview(tableView!)
        getData()
     
        
    }

    func getData(){

        //libros
        let libro1 = Libro(titulo: "No-Cosas", descripcion: "El mundo se vacía de cosas y se llena de información inquietante como voces sin cuerpo. La digitalización desmaterializa y descorporeíza.", autor: "Byung-Chul Han", imagen: "libro1", categoria: "Ficción")
        let libro2 = Libro(titulo: "La sabiduría de todos los tiempos", descripcion: "Esta obra recoge fragmentos de algunos de los más excelsos maestros del pensamiento de todos los tiempos, desde Pitágoras hasta la madre Teresa, desde Buda hasta Gandhi.", autor: "Wayne W. Dyer", imagen: "libro2", categoria: "Autosuperación")
        let libro3 = Libro(titulo: "El año de la muerte de Ricardo Reis", descripcion: "Una lúcida meditación, a través de un poeta y una ciudad, sobre el sentido de toda una época.", autor: "José Saramago", imagen: "libro3", categoria: "Literatura")
        let libro4 = Libro(titulo: "El viaje del Elefante", descripcion: "Cómico relato de José Saramago en el que un elefante asiático, regalo de reyes, debe viajar por Europa para seguir ridículos deseos reales.", autor: "José Saramago", imagen: "libro4", categoria: "Literatura")
        let libro5 = Libro(titulo: "El Arte de Amarte", descripcion: "Versión Fan art del primer tomo de: El sensacional y afamado Arte de amarte Por: Nappa El sayayin Booktuber seductor poeta animado", autor: "Napa", imagen: "libro5", categoria: "Poemas")
        let libro6 = Libro(titulo: "Mundo Extraño", descripcion: "Traemos por fin un nuevo libro de cuentos de Ovejero, uno de los más destacados autores españoles, primero en México y después en España.", autor: "José Ovejero", imagen: "libro6", categoria: "Literatura")
        let libro7 = Libro(titulo: "No Longer Human", descripcion: "Portraying himself as a failure, the protagonist of Osamu Dazai's No Longer Human narrates a seemingly normal life even while he feels himself incapable of understanding human beings. ", autor: "Osamu Dazai", imagen: "libro7", categoria: "Ficción")
        let libro8 = Libro(titulo: "Cuentos", descripcion: "Por fin, reunidos en un solo volumen, los tres libros de cuentos de Carlos Castán, un nombre que ya forma parte de la historia del cuento en España", autor: "Carlos Castán", imagen: "libro8", categoria: "Cuentos")
        let libro9 = Libro(titulo: "Antes del Paraíso", descripcion: "Vuelve el gran cuentista vasco, cuyo libro anterior recibió el elogio unánime de la crítica y obtuvo el Premio Setenil al mejor libro de cuentos del año", autor: "Pedro Ugarte", imagen: "libro9", categoria: "Cuentos")
        let libro10 = Libro(titulo: "El mundo de las Cabezas Vacías", descripcion: "A través de una prosa cuidada e inteligente, donde una pátina de ironía no siempre conduce al humor, los cuentos de Pedro Ugarte se leen con una facilidad engañosa, porque en ellos aguardan bifurcaciones que pueden llevar al lector a algún rincón de su propia biografía, en un juego lleno de sorpresas.", autor: "Pedro Ugarte", imagen: "libro10", categoria: "Sociedad")


        let biblioteca = LibroObject(libro: [libro1,libro2,libro3,libro4,libro5,libro6,libro7,libro8,libro9,libro10,])
       
        dataSource = biblioteca
        tableView?.reloadData()
        
/*        dataSoruce?.categorias = dataSoruce?.categorias?.filter({$0.nombre == "Desayuno"})
 */
    }
    
    @objc func actionButton(){
//        let lib = dataSource?.autor
//        let vc = OpcionesViewController()
//        vc.book = lib
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
    }
    
    @objc func backAction(){
        print("De regreso")
        dismiss(animated: true)
    }

}

extension LibrosViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //dataSource?.libro?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libroObj = dataSource?.libro?[indexPath.row]
        let cell = BibliotecaTableViewCell(libro: libroObj!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/4
    }
}



extension LibrosViewController : UITableViewDelegate{

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        return view
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lib = dataSource?.libro?[indexPath.row]
        let vc = DetailBookViewController()
        vc.book = lib
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
        
    }
}





