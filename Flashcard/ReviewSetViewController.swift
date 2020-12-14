//
//  ReviewSetViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/12/20.
//

import UIKit

class ReviewSetViewController: UIViewController {
    
    private var fset: Deck!
    private var label = UILabel()
    private var count: Int
    private var cards: [Card]!
    private var card: Card!
    private var front: Bool
    private var timer: Timer
    
    private var tOrD = UILabel() //term or definition
    
//    private let backButton = UIButton()

    init(fs: Deck) {
        self.fset = fs
        self.count = 0
        self.front = true
        self.timer = Timer()
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
//        backButton.setTitle("< Back", for: .normal)
//        backButton.setTitleColor(.black, for: .normal)
//        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(backButton)
//        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        view.backgroundColor = UIColor.white
        
        cards = fset.cards
        card = cards[count]
        
        tOrD.text = "Term"
        tOrD.font = UIFont.systemFont(ofSize: 13.0)
        tOrD.textColor = UIColor.lightGray
        tOrD.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tOrD)
        
        
        label.text = card.front
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)

        setUpConstraints()
    }
    
    @objc func timerFired() {
        
        if count >= cards.count{
            label.text = "Done"
            timer.invalidate()
        }else{
            card = cards[count]
            if front == true{
                tOrD.text = "Term"
                label.text = card.front
                front = false
                print(front)
            }else if front == false{
                tOrD.text = "Definition"
                label.text = card.back
                front = true
                print(front)
                count = count + 1
            }
        }
        
        print(count)

    }
    
    
    @objc func dismissViewController(){
        print("Dismissed")
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUpConstraints(){
        
//        NSLayoutConstraint.activate([
//            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:15),
//            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
//            ])
        
        NSLayoutConstraint.activate([
            tOrD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tOrD.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:50)
        ])
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }

}
