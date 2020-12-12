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
        private let signUpButton = UIButton()
        
        private var nameText: String = ""
        private var emailText: String = ""
        private var passwordText: String = ""
        
        weak var delegate: LoginDelegate?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            backButton.setTitle("< Back", for: .normal)
            backButton.setTitleColor(.black, for: .normal)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
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
            signUpContLabel.font = UIFont.systemFont(ofSize: 15.0)
            signUpContLabel.textColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(signUpContLabel)
            
            
            nameLabel.text = "Name"
            nameLabel.font = UIFont.systemFont(ofSize: 19.0)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.textColor = UIColor.black
            view.addSubview(nameLabel)
            
            
            emailLabel.text = "Email"
            emailLabel.font = UIFont.systemFont(ofSize: 19.0)
            emailLabel.translatesAutoresizingMaskIntoConstraints = false
            emailLabel.textColor = UIColor.black
            view.addSubview(emailLabel)
            
            passwordLabel.text = "Password"
            passwordLabel.font = UIFont.systemFont(ofSize: 19.0)
            passwordLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(passwordLabel)
            
            
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(nameTextField)
            
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(emailTextField)
            
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
            view.addSubview(passwordTextField)
            
            signUpButton.setTitle("Sign Up", for: .normal)
            signUpButton.setTitleColor(.black, for: .normal)
            signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            signUpButton.backgroundColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
            signUpButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
            signUpButton.layer.cornerRadius = 15
            view.addSubview(signUpButton)
            signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)

            setUpConstraints()
            
            view.backgroundColor = UIColor.white
            
            // Do any additional setup after loading the view.
        }
        
        @objc func dismissViewController(){
            print("Dismissed")
            self.navigationController?.popViewController(animated: true)
        }
        
        func setUpConstraints(){
            
            NSLayoutConstraint.activate([
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:15),
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
                ])
            
            NSLayoutConstraint.activate([
                signUpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
                ])
            
            NSLayoutConstraint.activate([
                signUpContLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                signUpContLabel.topAnchor.constraint(equalTo: signUpLabel.topAnchor, constant: 40)
                ])
            
            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                nameLabel.topAnchor.constraint(equalTo: signUpContLabel.topAnchor, constant: 45)
                ])
            
            NSLayoutConstraint.activate([
                nameTextField.widthAnchor.constraint(equalToConstant: 150),
                nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 45)
                ])

            NSLayoutConstraint.activate([
                emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                emailLabel.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: 45)
                ])
            
            NSLayoutConstraint.activate([
                emailTextField.widthAnchor.constraint(equalToConstant: 150),
                emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20)
                ])
            
            NSLayoutConstraint.activate([
                passwordLabel.widthAnchor.constraint(equalToConstant: 100),
                passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30)
                ])
            
            NSLayoutConstraint.activate([
                passwordTextField.widthAnchor.constraint(equalToConstant: 150),
                passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
                passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant:20)
            ])
            
            NSLayoutConstraint.activate([
                signUpButton.widthAnchor.constraint(equalToConstant: 150),
                signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant:50)
            ])
        }
        
        @objc func signUpPressed(){
            nameText = nameTextField.text ?? ""
            emailText = emailTextField.text ?? ""
            passwordText = passwordTextField.text ?? ""
            
            postRequest()
        }
            
        func postRequest(){
            if emailText != "" && passwordText != ""{
                //FIX
                //POST REQUEST TO SEND DATA
                NetworkManager.postUser(name: nameText, email: emailText, pass: passwordText)
                //FIX
                let vc = ViewController()
                navigationController?.pushViewController(vc, animated: true)
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

