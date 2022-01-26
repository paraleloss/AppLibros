//
//  SiginViewController.swift
//  AppLibros
//
//  Created by Saúl Pérez on 23/01/22.
//

import UIKit

class SiginViewController: UIViewController {

    var camposContentView : UIView?
    var backButton : UIButton?
    var buttonLogin : UIButton?
    var userName : UITextField?
    var userText : UITextField?
    var passText : UITextField?
    var passText2 : UITextField?
    var saludoLabel : UILabel?
    
    let azulMarino = UIColor(red: 53/255, green: 73/255, blue: 94/255, alpha: 1.00)
    let rojo = UIColor(red: 230/255, green: 76/255, blue: 60/255, alpha: 1.00)
    let rojito = UIColor(red: 192/255, green: 58/255, blue: 43/255, alpha: 1.00)
    let gris = UIColor(red: 124/255, green: 132/255, blue: 120/255, alpha: 1.00)
    let amarillo = UIColor(red: 244/255, green: 239/255, blue: 209/255, alpha: 1.00)
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
       // self.setBackgroundImage("background-books", contentMode: .scaleAspectFit)
        initUI()
        camposView()
    }
    
    func initUI(){
        
        backButton = UIButton(frame: CGRect(x: 10, y: 50, width: 100, height: 40))
        backButton?.backgroundColor = .clear
        backButton?.setTitleColor(azulMarino, for: .normal)
        backButton?.setTitle("← Regresar", for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        view.addSubview(backButton!)
        
        //label de saludo
        saludoLabel = UILabel(frame: CGRect(x: 20, y: 80, width: width-40, height: 200))
        saludoLabel?.textAlignment = .left
        saludoLabel?.text = "Estás a punto de ingresar a la mejor colección de libros:"
        saludoLabel?.numberOfLines = 0
        saludoLabel?.textAlignment = .center
        saludoLabel?.textColor = rojito
        saludoLabel?.font = .boldSystemFont(ofSize: 20)
        view.addSubview(saludoLabel!)

        
        buttonLogin = UIButton (frame: CGRect(x: 60, y: 700, width: width - 120, height: 60))
        buttonLogin?.backgroundColor = azulMarino
        buttonLogin?.layer.cornerRadius = 15
        buttonLogin?.setTitle("Registrarse", for: .normal)
        buttonLogin?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(buttonLogin!)
        

    }
    
    func camposView(){
        
        camposContentView = UIView(frame: CGRect(x: 20, y: height/4 + 50, width: width - 40, height: height/2 - 50))
        camposContentView?.backgroundColor = amarillo
        camposContentView?.layer.cornerRadius = 20
        view.addSubview(camposContentView!)
        
        userName = UITextField(frame: CGRect(x: 20, y: 50, width: width - 80, height: 50))
        userName?.placeholder = " Introduce un usuario"
        userName?.backgroundColor = .white
        userName?.layer.borderWidth = 1.5
        userName?.layer.borderColor = UIColor.darkGray.cgColor
        userName?.layer.cornerRadius = 10
        camposContentView?.addSubview(userName!)
        
        userText = UITextField(frame: CGRect(x: 20, y: 125, width: width - 80, height: 50))
        userText?.placeholder = " Introduce un correo"
        userText?.backgroundColor = .white
        userText?.layer.borderWidth = 1.5
        userText?.layer.borderColor = UIColor.darkGray.cgColor
        userText?.layer.cornerRadius = 10
        camposContentView?.addSubview(userText!)
        
        passText = UITextField(frame: CGRect(x: 20, y: 200, width: width - 80, height: 50))
        passText?.placeholder = " Introduce una contraseña"
        passText?.backgroundColor = .white
        passText?.layer.borderWidth = 1.5
        passText?.layer.borderColor = UIColor.darkGray.cgColor
        passText?.layer.cornerRadius = 10
        passText?.isSecureTextEntry = true
        camposContentView?.addSubview(passText!)
        
        passText2 = UITextField(frame: CGRect(x: 20, y: 275, width: width - 80, height: 50))
        passText2?.placeholder = " Repite la contraseña"
        passText2?.backgroundColor = .white
        passText2?.layer.borderWidth = 1.5
        passText2?.layer.borderColor = UIColor.darkGray.cgColor
        passText2?.layer.cornerRadius = 10
        passText2?.isSecureTextEntry = true
        camposContentView?.addSubview(passText2!)
        
    }
    

    @objc func buttonAction(){
        print("Button Registrarse presionado")
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        var dbUser: [String: String] = appDelegate.dbUser
        
//        dbUser.updateValue("pass", forKey: "usuario nuevo")
//        appDelegate.dbUser = dbUser
        print(dbUser)

        let existeUser = dbUser[userText?.text ?? ""] != nil
        
        //let pass = userDatabase[existeUser] != nil
            if existeUser {
                print("¡Usuario ya existe!")
                let alert = UIAlertController(title: "¡Error!", message: "Usuario ya existe", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }else{
                dbUser.updateValue(passText?.text ?? "", forKey: userName?.text ?? "")
                appDelegate.dbUser = dbUser
                print("Nuevo usuario registrado")
                let alert = UIAlertController(title: "Registrado con éxito", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in siginView()}))
                self.present(alert, animated: true, completion: nil)

            }
        
        func siginView(){
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("Libros Screen")
        }
        
    }
    

    
    @objc func backAction(){
        print("De regreso")
        dismiss(animated: true)
        
    }
}

