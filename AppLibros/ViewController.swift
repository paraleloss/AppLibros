//
//  ViewController.swift
//  AppLibros
//
//  Created by Saúl Pérez on 20/01/22.
//

import UIKit

class ViewController: UIViewController {
    

    var timer : Timer?
    var logoImage : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        initUI()
        view.backgroundColor = .systemGray5
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: false)
        viewWillDisappear(true)
    }
    
    func initUI(){
        logoImage = UIImageView(frame: CGRect(x: 70, y: height/3, width: width-170, height: height/4))
        logoImage?.image = UIImage(named: "logo")
        view.addSubview(logoImage!)
    }
    
    
    @objc func timerAction()
    {
        if timer != nil {
            timer?.invalidate()
            dismiss(animated: true, completion: {
                let vc = LoginViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print("Login Screen")
            })
        }
    }


}



