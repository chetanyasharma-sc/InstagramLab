//
//  LoginViewController.swift
//  InstagramLab
//
//  Created by chetanya sharma on 10/8/21.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onlogin(_ sender: Any) {
        
        let username = userNameField.text!
        let password = PasswordField.text!
        PFUser.logInWithUsername(inBackground: 
                                    username, password: password) { (user, error )in
            if user != nil
            {
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            }
            else{
                
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func onsignup(_ sender: Any) {
        
        let user = PFUser()
        user.username = userNameField.text
        user.password = PasswordField.text
        user.signUpInBackground { success, error in
            if success {
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
                
            }
            else{
                
                print("Error \(error?.localizedDescription)")
                
                
            }
        }
        
         
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
