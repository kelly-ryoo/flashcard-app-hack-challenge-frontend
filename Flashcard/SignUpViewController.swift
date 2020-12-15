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
            view.addSubview(nameTextField)
            
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.backgroundColor = .white
            emailTextField.text = nil
            emailTextField.placeholder = "email@example.com"
            view.addSubview(emailTextField)
            
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.backgroundColor = .white
            passwordTextField.placeholder = "************"
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
                NetworkManager.postUserSignUp(name: nameText, email: emailText, pass: passwordText) { (userData) in
                    User.current = userData
                    print("it goes to authentication")
                    DispatchQueue.main.async {
                        let vc = ViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }

}
