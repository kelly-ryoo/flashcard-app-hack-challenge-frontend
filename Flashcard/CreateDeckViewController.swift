//
//  CreateDeckViewController.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/12/20.
//

import UIKit

class CreateDeckViewController: UIViewController {
    
    var backButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem!
    
    var deckName = UITextField()
    var newCardCellButton = UIButton()
    
    private let newTerms = UITableView()
    private let cellReuseIdentifier = "cellReuse"
    
    private var deckReq: DeckRequest!
    //private var deck: Deck!
    //[Card] = [Card(front: "Hello", back: "Bonjour")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white

        saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDeck))
        self.navigationItem.rightBarButtonItem = saveButton
        
        backButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissViewController))
        self.navigationItem.leftBarButtonItem = backButton
        
        view.backgroundColor = UIColor.init(red: 204/255, green: 226/255, blue: 202/255, alpha: 1)
        
        deckName.translatesAutoresizingMaskIntoConstraints = false
        deckName.text = nil
        deckName.font = UIFont.systemFont(ofSize: 20)
        deckName.placeholder = "Deck Name"
        deckName.textAlignment = .left
        deckName.clearsOnBeginEditing = true
        view.addSubview(deckName)
        
        deckReq = DeckRequest(name: deckName.text ?? "", tag_ids: [], cards: [])
        
        newCardCellButton.translatesAutoresizingMaskIntoConstraints = false
        newCardCellButton.setTitle("+", for: .normal)
        newCardCellButton.setTitleColor(.white, for: .normal)
        newCardCellButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        newCardCellButton.contentVerticalAlignment = .center
        newCardCellButton.contentHorizontalAlignment = .center
        newCardCellButton.backgroundColor = UIColor.init(displayP3Red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        newCardCellButton.layer.cornerRadius = 20
        newCardCellButton.addTarget(self, action: #selector(newCard), for: .touchUpInside)
        view.addSubview(newCardCellButton)
        
        newTerms.delegate = self
        newTerms.dataSource = self
        newTerms.backgroundColor = UIColor.white
        newTerms.translatesAutoresizingMaskIntoConstraints = false
        newTerms.register(NewCardTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        view.addSubview(newTerms)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            deckName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            deckName.heightAnchor.constraint(equalToConstant: 24),
            deckName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            deckName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            newCardCellButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newCardCellButton.topAnchor.constraint(equalTo: deckName.bottomAnchor, constant: padding),
            newCardCellButton.heightAnchor.constraint(equalToConstant: 40),
            newCardCellButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            newTerms.topAnchor.constraint(equalTo: newCardCellButton.bottomAnchor, constant: padding),
            newTerms.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            //newTerms.bottomAnchor.constraint(equalTo: save.bottomAnchor, constant: CGFloat(100*(deck.cards.count))),
            newTerms.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newTerms.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func dismissViewController(){
        print("Dismissed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func newCard() {
        deckReq.cards.append(Card(front: "", back: ""))
        newTerms.reloadData()
    }
    
    @objc func saveDeck() {
        view.endEditing(true)
        deckReq.name = deckName.text ?? ""
        deckReq.tag_ids = []
        //var cards = deckReq.cards ?? []
        createDeck()
    }
    
    func createDeck() {
        // post
        NetworkManager.postDeck(deckReq: deckReq) { (deckData) in
    //            self.deck = deckData
    //            DispatchQueue.main.async {
    //                let vc = ViewController()
    //                vc.getDeck(deck: self.user.decks)
    //            }
            User.current?.decks.append(deckData)
            print(User.current?.decks.count)
            self.dismissViewController()
        }
    }

}

extension CreateDeckViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deckReq.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = deckReq.cards[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewCardTableViewCell
        cell.configure(for: indexPath.row, card: card)
        cell.delegate = self
        return cell
        //return UITableViewCell()
    }
}

extension CreateDeckViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // needs to adjust based on definition length
        return 100
    }

}

extension CreateDeckViewController: saveInfoDelegate {
    func saveInfo(index: Int, front: String, back: String) {
        deckReq.cards[index].front = front
        deckReq.cards[index].back = back
        newTerms.reloadData()
    }
    func deleteCell(index: Int) {
        deckReq.cards.remove(at: index)
        newTerms.reloadData()
    }
}
