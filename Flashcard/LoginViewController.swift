//
//  LoginViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/11/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var user: User!
    static public var loggedIn: Bool = false

    
    private let backButton = UIButton()
    
    private let loginLabel = UILabel()
    private let loginContLabel = UILabel()
    
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private var emailText: String = ""
    private var passwordText: String = ""
    
    private let loginButton = UIButton()
    private let signUpOptionLabel = UILabel()
    private let signUpButton = UIButton()
    
    private var getEmail: String = ""
    private var getPassword: String = ""
    
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
        
        
        loginLabel.text = "Log In"
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        loginLabel.textColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        view.addSubview(loginLabel)
        
        loginContLabel.text = "Log in to continue"
        loginContLabel.translatesAutoresizingMaskIntoConstraints = false
        loginContLabel.font = UIFont.systemFont(ofSize: 16.0)
        loginContLabel.textColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        view.addSubview(loginContLabel)
        
        
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textColor = UIColor.black
        view.addSubview(emailLabel)
        
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "email@example.com"
        //emailTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        view.addSubview(emailTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "************"
        //passwordTextField.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(red: 204/255, green: 226/255, blue: 202/255, alpha: 1)
        loginButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        loginButton.layer.cornerRadius = 25
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        signUpOptionLabel.text = "Don't have an account?"
        signUpOptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        signUpOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpOptionLabel.textColor = UIColor.black
        view.addSubview(signUpOptionLabel)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor.init(red: 169/255, green: 202/255, blue: 151/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = .white
        view.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)

        
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
        let textFieldToLabelPadding: CGFloat = 25
        
        let textFieldWidth: CGFloat = 300
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sidePadding),
            loginLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40)
            ])
        
        NSLayoutConstraint.activate([
            loginContLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            loginContLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15)
            ])

        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: loginContLabel.bottomAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalToConstant: textFieldWidth),
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: labelToTextFieldPadding)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: textFieldToLabelPadding)
            ])
        
        NSLayoutConstraint.activate([
            passwordTextField.widthAnchor.constraint(equalToConstant: textFieldWidth),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant:labelToTextFieldPadding)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -buttonPadding)
        ])
        
        NSLayoutConstraint.activate([
            signUpOptionLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpOptionLabel.widthAnchor.constraint(equalToConstant: 155),
            signUpOptionLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerYAnchor.constraint(equalTo: signUpOptionLabel.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: signUpOptionLabel.trailingAnchor, constant: 10)
        ])
    }
    
    @objc func loginPressed(){
        emailText = emailTextField.text ?? ""
        passwordText = passwordTextField.text ?? ""
        authenticateLogin()
    }
        
    @objc func signupPressed(){
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func authenticateLogin(){
        //post
        NetworkManager.postUserLogin(email: emailText, password: passwordText) { (userData) in
                //check if success
            User.current = userData
            print("it goes to authentication")
            DispatchQueue.main.async {
                let vc = ViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
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
