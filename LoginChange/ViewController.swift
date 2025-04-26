//
//  ViewController.swift
//  LoginChange
//
//  Created by Rifluxyss on 12/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var userName: UITextField!
    @IBOutlet var userEmail: UITextField!
    @IBOutlet var userPass: UITextField!
    @IBOutlet var sumbitBtn: UIButton!
    
    var textViewKey="name"
    
    var arrMsg  = ["Please enter your Name ","Please enter the Email ","InValied Email","Please enter the Password","Invalied Password"]
    var alertMsg = ""
    
////    
//    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        print("viewDidAppear")
//    }
////    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear - NextPage")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        print("viewDidDisappear")
//    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "hjhjj", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = backButton
        
        titleLabel.font = .italicSystemFont(ofSize: 29.0)
        
        userName.placeholder = "Name"
        userName.minimumFontSize = .greatestFiniteMagnitude
        userName.textColor = .blue
        userName.font = .italicSystemFont(ofSize: 20.1)
        
        
        userEmail.placeholder = "UserID"
        userEmail.keyboardType = .emailAddress
        userEmail.minimumFontSize = .greatestFiniteMagnitude
        userEmail.textColor = .blue
        userEmail.font = .italicSystemFont(ofSize: 20.1)
        
        
        userPass.placeholder = "Password"
        userPass.minimumFontSize = .greatestFiniteMagnitude
        userPass.textColor = .blue
        userPass.isSecureTextEntry = true
        userPass.font = .italicSystemFont(ofSize: 20.1)
        
        
        sumbitBtn.setTitle("Login", for: .normal)
        
        
        userName.delegate = self
        userPass.delegate = self
        userEmail.delegate = self
        
        
    }

    @IBAction func OnSubmit(_ sender: Any) {
        
        if(userName.text?.isEmpty ?? false) {
            alertMsg = arrMsg[0]
            
            }
        else if(userEmail.text?.isEmpty ?? false) {
            alertMsg = arrMsg[1]
            
            }
        else if isValidEmail(email: userEmail.text ?? "") == false{
            alertMsg = arrMsg[2]
            
        }
        else if (userPass.text?.isEmpty ?? false){
            alertMsg = arrMsg[3]
        }
        
        else if isValidPassword(password:userPass.text ?? "") == false{
            alertMsg = arrMsg[4]
            
        }
        else{
            alertMsg = ""
        }
        
        if(alertMsg == ""){
            let alert = UIAlertController(title: nil, message: alertMsg, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .destructive) { (action) in self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(action)
            self.present(alert,animated: true, completion: nil)
            
        }
        else{
        
            
            let alert = UIAlertController(title: nil, message: "Login Successful", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "Done", style: .default) { (action) in
                
                let userInput = self.userName.text ?? ""
                UserDefaults.standard.set(userInput, forKey: self.textViewKey)
                    
                    let story = UIStoryboard(name: "Main", bundle: nil)
                    let vc = story.instantiateViewController(withIdentifier: "tabBar")
                    self.navigationController?.pushViewController(vc, animated: true)
                
//                    vc.modalPresentationStyle = .fullScreen
//                    self.navigationController?.present(vc, animated: true)
                
            }
            alert.addAction(action)
            self.present(alert,animated: true,completion: nil)
            
            
//            let vc = self.storyboard?.instantiateViewController(identifier: "resultPage") as! resultPage
//            
//            vc.username = userName.text!
//            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
       
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passRegEx = "^(?=.*[!@#$%^&*(),.?\":{}|<>]).{6,}$"

        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: password)
    }
    
    
    
}

extension ViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userName{
            userName.resignFirstResponder()
        }
        else if textField == userEmail{
            userEmail.resignFirstResponder()
        }
        else if textField == userPass{
            userPass.resignFirstResponder()
        }
        return true
        
    
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == userName{
            userName.backgroundColor = .white
        }else if textField == userPass {
            userPass.backgroundColor = .white
        }else{
            userEmail.backgroundColor = .white
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        userName.textColor = .red
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == userName{
            userName.backgroundColor = .lightText
        }else if textField == userPass {
            userPass.backgroundColor = .lightText
        }else{
            userEmail.backgroundColor = .lightText
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        userName.textColor = .systemGreen
    }
}

