//
//  LoginViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/11/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let backButton = UIButton()
    
    private let loginLabel = UILabel()
    private let loginContLabel = UILabel()
    
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    
    private var emailText: String = ""
    private var passwordText: String = ""
    
    private var getEmail: String = ""
    private var getPassword: String = ""
    
    weak var delegate: LoginDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        loginLabel.text = "Log In"
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        loginLabel.textColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        view.addSubview(loginLabel)
        
        
        loginContLabel.text = "Log in to continue"
        loginContLabel.translatesAutoresizingMaskIntoConstraints = false
        loginContLabel.font = UIFont.systemFont(ofSize: 15.0)
        loginContLabel.textColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        view.addSubview(loginContLabel)
        
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 19.0)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textColor = UIColor.black
        view.addSubview(emailLabel)
        
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 19.0)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        view.addSubview(emailTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        loginButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        loginButton.layer.cornerRadius = 15
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)

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
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
            ])
        
        NSLayoutConstraint.activate([
            loginContLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
            loginContLabel.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 40)
            ])

        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:30),
            emailLabel.topAnchor.constraint(equalTo: loginContLabel.topAnchor, constant: 45)
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
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant:50)
        ])
    }
    
    @objc func loginPressed(){
        emailText = emailTextField.text ?? ""
        passwordText = passwordTextField.text ?? ""
        authenticateLogin()
    }
        
    func authenticateLogin(){
        if emailText == getEmail && passwordText == getPassword{
            
            let secondViewController:ViewController = ViewController()

            self.present(secondViewController, animated: true, completion: nil)
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
