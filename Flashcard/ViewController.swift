//
//  ViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/2/20.
//

import UIKit

protocol ReviewPressed : class{
    func pushSetViewController(selectedFSID: Int)
    func pushReviewSetViewController(selectedFSID: Int)

}

extension ViewController: ReviewPressed{
    func pushReviewSetViewController(selectedFSID: Int) {
        var setIndex: Int
            setIndex = 0
        for f in homeSets {
            if f.id == selectedFSID{ //not sure why compare f.id and selectedFSID while using setIndex to index
                let reviewSetViewController = ReviewSetViewController(fs: homeSets[setIndex])
                navigationController?.pushViewController(reviewSetViewController, animated: true)
                //break
            }
            setIndex+=1
        }
    }
    
    func pushSetViewController(selectedFSID: Int) {
        var setIndex: Int
            setIndex = 0
        for f in homeSets {
            if f.id == selectedFSID{ //not sure why compare f.id and selectedFSID while using setIndex to index
                let setViewController = SetViewController(fs: homeSets[setIndex])
                navigationController?.pushViewController(setViewController, animated: true)
                //break
            }
            setIndex+=1
        }
        //this pushes the nav view controller
    }
}

class ViewController: UIViewController {
    
    //private var refreshButton = UIBarButtonItem()
    
    private var profilePicture = UIImageView()
    private var userName = UILabel()
    private var numSets = UILabel()
    
    private var allSets = UITextView()
    private var sectionTitle = UILabel()
    
    private var addSetButton = UIButton()
    
    private let homeSetsTableView = UITableView()
    private let homeSetsReuseIdentifier = "homeFlashcardSetsReuse"
    private var homeSets: [Deck] = []

    
    /* testing */
//    var f1 = Deck(id: 1, name: "Spanish", userId: 1, cards: [Card(front: "Hola", back: "Hello")])
//    var f2 = Deck(id: 2, name: "[Italian 1201] U1", userId: 2, cards: [Card(front: "Hi", back: "Ciao")])
//    var f3 = Deck(id: 3, name: "Chinese Set", userId: 3, cards: [Card(front: "Hi", back: "Nihao")])
//    var f4 = Deck(id: 4, name: "jap1000", userId: 4, cards: [Card(front: "Hi", back: "Konnichiwa"), Card(front: "Thanks", back: "Arigato"), Card(front: "Bye", back: "Sayonara"), Card(front: "Good Morning", back: "Ohayo")])
//    var f5 = Deck(id: 5, name: "한국어 vocab", userId: 5,  cards: [Card(front: "Hi", back: "Annyeonhaseyo"), Card(front: "Bye", back: "Annyeon"), Card(front: "Thanks", back: "Gohmawo")])
//    var f6 = Deck(id: 6, name: "ARAB 1201 - U3", userId: 6, cards: [Card(front: "Hi", back: "Marhaba"), Card(front: "Thanks", back: "Shukram")])
//    var f7 = Deck(id: 7, name: "French", userId: 7, cards: [Card(front: "Hi", back: "Bonjour")])
//    var f8 = Deck(id: 8, name: "ARAB 1201 - U4", userId: 8, cards: [Card(front: "Hi", back: "Sabahal nour")])
//    var f9 = Deck(id: 9, name: "Thai flashcards", userId: 9, cards: [Card(front: "Hi", back: "Sawahdesee")])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
//        refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshViewController))
//        self.navigationItem.rightBarButtonItem = refreshButton
        
        homeSets = User.current?.decks ?? []

        /* basic setup*/
        view.backgroundColor = .white
        
        profilePicture = UIImageView(image: UIImage(named: "profile_picture"))
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.contentMode = .scaleAspectFit
        view.addSubview(profilePicture)
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "\(User.current?.name ?? "Name")"
        userName.textColor = UIColor(red: 158/255, green: 189/255, blue: 143/255, alpha: 1) // #9ebd8e
        userName.font = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
        view.addSubview(userName)
        
        numSets.translatesAutoresizingMaskIntoConstraints = false
        numSets.text = "\(homeSets.count) decks"
        numSets.textColor = UIColor(red: 158/255, green: 189/255, blue: 143/255, alpha: 1)
        numSets.font = UIFont.systemFont(ofSize: 16.0)
        view.addSubview(numSets)
        
        allSets.translatesAutoresizingMaskIntoConstraints = false
        allSets.backgroundColor = UIColor.init(red: 204/255, green: 226/255, blue: 202/255, alpha: 1)
        allSets.isEditable = false
        view.addSubview(allSets)
        
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.text = "All Sets"
        sectionTitle.textColor = .black
        sectionTitle.textAlignment = .left
        view.addSubview(sectionTitle)
        
        addSetButton.translatesAutoresizingMaskIntoConstraints = false
        addSetButton.setTitle("+", for: .normal)
        addSetButton.setTitleColor(.black, for: .normal)
        addSetButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        addSetButton.contentVerticalAlignment = .center
        addSetButton.contentHorizontalAlignment = .center
        addSetButton.backgroundColor = .white
        addSetButton.layer.cornerRadius = 15
        addSetButton.addTarget(self, action: #selector(pushCreateDeckController), for: .touchUpInside)
        view.addSubview(addSetButton)
        
        homeSetsTableView.delegate = self
        homeSetsTableView.dataSource = self
        homeSetsTableView.backgroundColor = UIColor.white
        homeSetsTableView.translatesAutoresizingMaskIntoConstraints = false
        //homeSetsTableView.separatorStyle = .none
        homeSetsTableView.register(HomeSetsTableViewCell.self, forCellReuseIdentifier: homeSetsReuseIdentifier)
        view.addSubview(homeSetsTableView)

        setupConstraints()

    }
    
    private func setupConstraints() {
        
        let imageSize: CGFloat = 100
        
        NSLayoutConstraint.activate([
            profilePicture.widthAnchor.constraint(equalToConstant: imageSize),
            profilePicture.heightAnchor.constraint(equalToConstant: imageSize),
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            profilePicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: profilePicture.topAnchor, constant: 10),
            userName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            numSets.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 15),
            numSets.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            allSets.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 40),
            allSets.heightAnchor.constraint(equalToConstant: 50),
            allSets.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allSets.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
//            sectionTitle.topAnchor.constraint(equalTo: allSets.topAnchor, constant: 10),
//            sectionTitle.bottomAnchor.constraint(equalTo: allSets.bottomAnchor, constant: -10),
            sectionTitle.centerYAnchor.constraint(equalTo: allSets.centerYAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: allSets.leadingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            addSetButton.topAnchor.constraint(equalTo: allSets.topAnchor, constant: 10),
            addSetButton.bottomAnchor.constraint(equalTo: allSets.bottomAnchor, constant: -10),
            addSetButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addSetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addSetButton.heightAnchor.constraint(equalToConstant: 30),
            addSetButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            //homeSetsTableView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            homeSetsTableView.topAnchor.constraint(equalTo: allSets.bottomAnchor, constant: 20),
            homeSetsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeSetsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeSetsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
    
    public func pushNavViewController(selectedFS: Deck){
        print(selectedFS.id)
        let sv = SetViewController(fs: selectedFS)
        present(sv, animated: true, completion: nil)
    }
    
//    private func getFlashcardSets() {
//        NetworkManager.getFlashcardSets { flashcardSets in
//            self.sets = flashcardSets
//
//            DispatchQueue.main.async {
//                self.homeSetsTableView.reloadData()
//            }
//        }
//    }
    
    @objc func pushCreateDeckController() {
        let newViewController = CreateDeckViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func dismissViewController(){
        print("Dismissed")
        self.navigationController?.popViewController(animated: true)
    }

    func refreshViewController() {
        homeSets = User.current?.decks ?? []
        homeSetsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshViewController()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fs = homeSets[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! HomeSetsTableViewCell
        
        //let setViewController = SetViewController(fs: fs)
        //navigationController?.pushViewController(setViewController, animated: true)
        //don't need it cuz we present??
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeSetsReuseIdentifier) as? HomeSetsTableViewCell else { return UITableViewCell() }
        let homeSet = homeSets[indexPath.row]
        cell.configure(for: homeSet)
        cell.delegate = self

        return cell
    }
}

