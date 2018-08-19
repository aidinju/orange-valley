//
//  logInViewController.swift
//  orangevalley
//
//  Created by aidin on 2/5/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import Alamofire

class logInViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let authURL = URL(string: "https://orangevalleycaa.org/api/auth/authentication.php")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        authenticator(url: authURL!, userName: userNameTextField.text!, password: passwordTextField.text!)
    }
    
    func authenticator(url : URL , userName : String , password : String) {
        let credintal = URLCredential.init(user: userName, password: password, persistence: .forSession)
        Alamofire.request(url, method: .post).authenticate(usingCredential: credintal).response { response in
            if let res = response.response{
                if res.statusCode == 200 {
                    let alert : UIAlertController = UIAlertController(title: "successful", message: "successfuly logged in", preferredStyle: UIAlertControllerStyle.alert)
                    let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (a : UIAlertAction) in
                        self.performSegue(withIdentifier: "logIntoMain", sender: nil)
                    })
                    alert.addAction(alertActionOK)
                    self.present(alert, animated: true, completion: {
                    })
                } else {
                    
                    let alert2 : UIAlertController = UIAlertController(title: "Failed", message: "can't log into server", preferredStyle: UIAlertControllerStyle.alert)
                    let alertActionOK2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (a : UIAlertAction) in
                       
                    })
                    alert2.addAction(alertActionOK2)
                    self.present(alert2, animated: true, completion: {
                    })
                    
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
