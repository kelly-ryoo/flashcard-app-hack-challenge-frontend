//
//  SignUpViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/11/20.
//

import UIKit

class SignUpViewController: UIViewController {

        private let backButton = UIButton()
        
        private let signUpLabel = UILabel()
        private let signUpContLabel = UILabel()
        
        private let nameLabel = UILabel()
        private let emailLabel = UILabel()
        private let passwordLabel = UILabel()
        
        private let nameTextField = UITextField()
        private let emailTextField = UITextField()
        private let passwordTextField = UITextField()
        
        private var nameText: String = ""
        private var emailText: String = ""
        private var passwordText: String = ""
    
        private let signUpButton = UIButton()
        private let loginOptionLabel = UILabel()
        private let loginButton = UIButton()
        
        weak var delegate: LoginDelegate?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor.white
                        
            backButton.setTitle("< Back", for: .normal)
            backButton.setTitleColor(.black, for: .normal)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(backButton)
            backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
            
            signUpLabel.text = "Sign Up"
            signUpLabel.translatesAutoresizingMaskIntoConstraints = false
            signUpLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
            signUpLabel.textColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
            view.addSubview(signUpLabel)
            
            signUpContLabel.text = "Sign up to join"
            signUpContLabel.translatesAutoresizingMaskIntoConstraints = false
            signUpContLabel.font = UIFont.systemFont(ofSize: 16.0)
            signUpContLabel.textColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
            view.addSubview(signUpContLabel)
            
            
            nameLabel.text = "Name"
            nameLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.textColor = UIColor.black
            view.addSubview(nameLabel)
            
            emailLabel.text = "Email"
            emailLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            emailLabel.translatesAutoresizingMaskIntoConstraints = false
            emailLabel.textColor = UIColor.black
            view.addSubview(emailLabel)
            
            passwordLabel.text = "Password"
            passwordLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
            passwordLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(passwordLabel)
            
            
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameTextField.backgroundColor = .white
            nameTextField.text = nil
            nameTextField.placeholder = "Please enter your full name"
            //nameTextField.setUnderline()
            //nameTextField.addBottomBorder()
            //nameTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(nameTextField)
            
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.backgroundColor = .white
            emailTextField.text = nil
            emailTextField.placeholder = "email@example.com"
            //emailTextField.setUnderLine()
            //emailTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(emailTextField)
            
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.backgroundColor = .white
            //passwordTextField.text = nil
            passwordTextField.placeholder = "************"
            //passwordTextField.isSecureTextEntry = true
            //passwordTextField.textContentType = .oneTimeCode
            //passwordTextField.setUnderLine()
            //passwordTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(passwordTextField)
            
            signUpButton.setTitle("Sign Up", for: .normal)
            signUpButton.setTitleColor(.black, for: .normal)
            signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            signUpButton.backgroundColor = UIColor(red: 204/255, green: 226/255, blue: 202/255, alpha: 1)
            signUpButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
            signUpButton.layer.cornerRadius = 25
            view.addSubview(signUpButton)
            signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
            
            loginOptionLabel.text = "Have an account?"
            loginOptionLabel.font = UIFont.systemFont(ofSize: 15.0)
            loginOptionLabel.translatesAutoresizingMaskIntoConstraints = false
            loginOptionLabel.textColor = UIColor.black
            view.addSubview(loginOptionLabel)
            
            loginButton.setTitle("Log In", for: .normal)
            loginButton.setTitleColor(UIColor.init(red: 169/255, green: 202/255, blue: 151/255, alpha: 1), for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            loginButton.backgroundColor = .white
            view.addSubview(loginButton)
            loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)

            setUpConstraints()
        
        }
        
        @objc func dismissViewController(){
            print("Dismissed")
            self.navigationController?.popViewController(animated: true)
        }
        
        func setUpConstraints(){
            
            let sidePadding: CGFloat = 30
            let buttonPadding: CGFloat = 200
            let labelToTextFieldPadding: CGFloat = 30
            let textFieldToLabelPadding: CGFloat = 20
            
            let textFieldWidth: CGFloat = 300
            
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:15),
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
                ])
            
            NSLayoutConstraint.activate([
                signUpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sidePadding),
                signUpLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40)
                ])
            
            NSLayoutConstraint.activate([
                signUpContLabel.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                signUpContLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 15)
                ])
            
            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                nameLabel.topAnchor.constraint(equalTo: signUpContLabel.bottomAnchor, constant: 30)
                ])
            
            NSLayoutConstraint.activate([
                nameTextField.widthAnchor.constraint(equalToConstant: textFieldWidth),
                nameTextField.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: labelToTextFieldPadding)
                ])

            NSLayoutConstraint.activate([
                emailLabel.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: textFieldToLabelPadding)
                ])
            
            NSLayoutConstraint.activate([
                emailTextField.widthAnchor.constraint(equalToConstant: textFieldWidth),
                emailTextField.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: labelToTextFieldPadding)
                ])
            
            NSLayoutConstraint.activate([
                passwordLabel.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: textFieldToLabelPadding)
                ])
            
            NSLayoutConstraint.activate([
                passwordTextField.widthAnchor.constraint(equalToConstant: textFieldWidth),
                passwordTextField.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
                passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: labelToTextFieldPadding)
            ])
            
            NSLayoutConstraint.activate([
                signUpButton.widthAnchor.constraint(equalToConstant: 250),
                signUpButton.heightAnchor.constraint(equalToConstant: 50),
                signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                signUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -buttonPadding)
            ])
            
            NSLayoutConstraint.activate([
                loginOptionLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
                loginOptionLabel.widthAnchor.constraint(equalToConstant: 125),
                loginOptionLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            ])
            
            NSLayoutConstraint.activate([
                loginButton.centerYAnchor.constraint(equalTo: loginOptionLabel.centerYAnchor),
                loginButton.leadingAnchor.constraint(equalTo: loginOptionLabel.trailingAnchor, constant: 10)
            ])
            
        }
        
        @objc func signUpPressed(){
            nameText = nameTextField.text ?? ""
            emailText = emailTextField.text ?? ""
            passwordText = passwordTextField.text ?? ""
            
            postRequest()
        }
    
        @objc func loginPressed() {
            let vc = LoginViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
            
        func postRequest(){
            if emailText != "" && passwordText != ""{
                //POST REQUEST TO SEND DATA
                NetworkManager.postUserSignUp(name: nameText, email: emailText, pass: passwordText) { (isLoggedIn) in
                    if isLoggedIn == true{
                        let vc = ViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }

    }

extension UITextField {
//    func setUnderLine() {
//        let border = CALayer()
//        let width = CGFloat(0.5)
//        border.borderColor = UIColor.lightGray.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
//
//        border.borderWidth = width
//        self.layer.addSublayer(border)
//        self.layer.masksToBounds = true
//    }
    func setUnderLine(){
        let border = CALayer()
        let lineWidth = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.bounds = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: self.frame.size.height)
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineWidth, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = lineWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        }
    func underline(borderColor: UIColor) {
            
            self.borderStyle = UITextField.BorderStyle.none
            self.backgroundColor = UIColor.clear
            
            let borderLine = UIView()
            let height = 2.0
            borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
            
            borderLine.backgroundColor = borderColor
            self.addSubview(borderLine)
        }
    func setUnderline() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}
