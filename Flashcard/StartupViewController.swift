//
//  StartupViewController.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/11/20.
//

import UIKit

class StartupViewController: UIViewController {
    
    var loginButton = UIButton()
    var signupButton = UIButton()
    var image: UIImageView!
    
    var appLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
//        title = "Flashcard App Name"
        view.backgroundColor = .white
        
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        appLabel.text = "Flashcard App Name"
        appLabel.textColor = .black
        view.addSubview(appLabel)
        
        image = UIImageView(image: UIImage(named: "insert_image"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        loginButton.backgroundColor = UIColor.init(displayP3Red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        loginButton.layer.cornerRadius = 4
        loginButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        view.addSubview(loginButton)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setTitle("Create an Account", for: .normal)
        signupButton.setTitleColor(UIColor.init(displayP3Red: 169/255, green: 202/255, blue: 151/255, alpha: 1), for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        //signupButton.backgroundColor = .white
        signupButton.layer.cornerRadius = 4
        view.addSubview(signupButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        let spacing: CGFloat = 150
        
        let screenSize: CGRect = UIScreen.main.bounds
        let imageWidth: CGFloat = screenSize.width
        let imageHeight: CGFloat = (screenSize.height)/3
        
        NSLayoutConstraint.activate([
            appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            appLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 20),
            image.widthAnchor.constraint(equalToConstant: imageWidth),
            image.heightAnchor.constraint(equalToConstant: imageHeight)
            
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -spacing),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 75)
            ])

        NSLayoutConstraint.activate([
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            signupButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
    }

    
}
