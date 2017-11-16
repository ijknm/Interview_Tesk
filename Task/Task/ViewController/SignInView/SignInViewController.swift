//
//  SignInViewController.swift
//  Task
//
//  Created by praveen on 11/14/17.
//  Copyright © 2017 com.praveen.praveen. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

    @IBOutlet weak var ibEmailId: UITextField!
    @IBOutlet weak var ibPassWord: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func didTapOnNewUserButton(_ sender: Any) {
        // Needs implement funcationality
    }
    
    // Sign In Button Tapped
    @IBAction func didTapOnSignInButton(_ sender: Any) {
        if ibEmailId.text != nil && ibEmailId.text != "" {
            if self.isValidEmail(emailId: ibEmailId.text!){
                if ibPassWord.text != nil && ibPassWord.text != "" {
                    if self.validatePassword(password: ibPassWord.text!){
                        self.performSegue(withIdentifier: "SignView", sender: nil)
                    }else  {
                        //Password does not contains minimum charecter
                        self.showAlertMessage(title: "Error", message: "Password should contain atleast 8 characters, 1 uppercase and 1 number and 1 special charecter")
                    }
                }else{
                    // Passwordt Enter
                   self.showAlertMessage(title: "Error", message: "Please enter Password")
                }
            }else{
                // Email not valide
              self.showAlertMessage(title: "Error", message: "Please enter Correct Email Id")
            }
        }else{
            // Email ID Not Enter
            self.showAlertMessage(title: "Error", message: "Please enter Email Id")
        }
    }
     
    // Validate Email ID
    func isValidEmail(emailId:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailId)
    }
    
    //Validate Password Password should contain atleast 8 characters, 1 uppercase and 1 number and 1 special charecter
    func validatePassword(password: String) -> Bool{
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }
    
}
