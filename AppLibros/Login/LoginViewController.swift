//
//  LoginViewController.swift
//  AppLibros
//
//  Created by Saúl Pérez on 22/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var logoImage : UIImageView?
    var buttonLogin : UIButton?
    var buttonSign : UIButton?
    var saludoLabel : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var userText : UITextField?
    var passText : UITextField?
    
    let azulMarino = UIColor(red: 53/255, green: 73/255, blue: 94/255, alpha: 1.00)
    let rojo = UIColor(red: 230/255, green: 76/255, blue: 60/255, alpha: 1.00)
    let rojito = UIColor(red: 192/255, green: 58/255, blue: 43/255, alpha: 1.00)



    override func viewDidLoad() {
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        var dbUser: [String: String] = appDelegate.dbUser
        
        dbUser.updateValue("pass", forKey: "usuario nuevo")
        appDelegate.dbUser = dbUser
        print(dbUser)

        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

       // self.setBackgroundImage("background-books", contentMode: .scaleAspectFit)
        initUI()
    }
    
    func initUI(){
        
        logoImage = UIImageView(frame: CGRect(x: 120, y: height/5 - 10, width: width-250, height: height/6))
        logoImage?.image = UIImage(named: "logo")
        view.addSubview(logoImage!)
        
        //label de saludo
        saludoLabel = UILabel(frame: CGRect(x: width/3, y: 330, width: width/3, height: 70))

        let date = Date()
        let calendar = Calendar.current
        let hora = calendar.component(.hour, from: date)
        print (hora)
        

        if hora > 0 && hora < 12{
            saludoLabel?.text = "¡Buenos días!"
        }else if hora >= 12 && hora < 19{
            saludoLabel?.text = "¡Buenas tardes!"
        }else if hora >= 19{
            saludoLabel?.text = "¡Buenas noches!"
        }
        
        saludoLabel?.textAlignment = .left
        saludoLabel?.adjustsFontSizeToFitWidth = true
        saludoLabel?.font = .boldSystemFont(ofSize: 22)
        view.addSubview(saludoLabel!)
        
        userText = UITextField(frame: CGRect(x: 40, y: 410, width: width - 80, height: 50))
        userText?.placeholder = " Introduce tu usuario"
        userText?.backgroundColor = .white
        userText?.layer.borderWidth = 1.5
        userText?.layer.borderColor = UIColor.darkGray.cgColor
        //userText?.autocapitalizationType = .allCharacters
        userText?.layer.cornerRadius = 10
        view.addSubview(userText!)
        
        passText = UITextField(frame: CGRect(x: 40, y: 500, width: width - 80, height: 50))
        passText?.placeholder = " Introduce tu contraseña"
        passText?.backgroundColor = .white
        passText?.layer.borderWidth = 1.5
        passText?.layer.borderColor = UIColor.darkGray.cgColor
        passText?.layer.cornerRadius = 10
        passText?.isSecureTextEntry = true
        view.addSubview(passText!)
        
        buttonLogin = UIButton (frame: CGRect(x: 90, y: 600, width: width - 180, height: 60))
        buttonLogin?.backgroundColor = rojo
        buttonLogin?.setTitle("Ingresar", for: .normal)
        buttonLogin?.layer.cornerRadius = 10
        //buttonLogin?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        buttonLogin?.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
        view.addSubview(buttonLogin!)
        
        buttonSign = UIButton (frame: CGRect(x: 10, y: height-75, width: width - 20, height: 60))
        buttonSign?.backgroundColor = .clear
        buttonSign?.setTitleColor(azulMarino, for: .normal) // Modificamos el color del titulo del boton
        buttonSign?.setTitle("¿Todavía no tienes cuenta? Regístrate", for: .normal)
        buttonSign?.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        view.addSubview(buttonSign!)
        
    }
    
    
    @objc func buttonAction1(){
        print("Button Login presionado")
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
 
        
        let dbUser: [String: String] = appDelegate.dbUser
        var sesion = appDelegate.sesion
        
        print(dbUser)

        let existeUser = dbUser[userText?.text ?? ""] != nil
        if existeUser && passText?.text ?? "" == dbUser[userText?.text ?? ""] {
                print("usuario correcto")
                sesion = userText?.text ?? ""
                appDelegate.sesion = sesion
                nextView()
//                let alert = UIAlertController(title: "¡Bienvenido!", message: "", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: {_ in nextView()}))
//                self.present(alert, animated: true, completion: nil)
                
            }else{
                print("usuario incorrecto")
                let alert = UIAlertController(title: "Error", message: "Usuario y/o contraseña incorrectos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "¿Desea registrarse?", style: .default, handler: {_ in siginView()}))
                self.present(alert, animated: true, completion: nil)

            }
        
        func nextView(){
            let vc = LibrosViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("Libros Screen")
        }

        func siginView(){
            let vc = SiginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("Libros Screen")
        }
        
    }
    
    @objc func buttonAction2(){
        print("Button Sigin presionado")
        let vc = SiginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("Sigin Screen")
        }

    @objc func buttonAction3(){
        print("Button Sigin presionado")
        let vc = LibrosViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        print("Sigin Screen")
        }

}


extension UIViewController {

    /// This function sets an image as the background of the view controller
    /// - Parameters:
    ///   - imageName: name of image
    ///   - contentMode:
    ///          .scaleAspectFill
    ///          .scaleAspectFit
    ///          .scaleToFill
    func setBackgroundImage(_ imageName: String, contentMode: UIView.ContentMode) {
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "background-books")
        backgroundImage.contentMode = contentMode
        self.view.insertSubview(backgroundImage, at: 0)
    }

}
