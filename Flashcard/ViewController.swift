//
//  ViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/2/20.
//

import UIKit

protocol ReviewPressed : class{
    func pushSetViewController(selectedFSID: Int)
}

extension ViewController: ReviewPressed{
    func pushSetViewController(selectedFSID: Int) {
        var setIndex: Int
            setIndex = 0
        for f in homeSets {
            //print(setIndex)
            if f.id == selectedFSID{
                pushNavViewController(selectedFS: homeSets[setIndex])
                break
            }
            setIndex+=1
        }
        //this pushes the nav view controller
    }
}


class ViewController: UIViewController {
    
    private let homeSetsTableView = UITableView()
    private let homeSetsReuseIdentifier = "homeFlashcardSetsReuse"
    private var homeSets: [FlashcardSet] = []
    
    /* testing */
    var f1 = FlashcardSet(name: "Spanish Vocab Set", id: 1, flashcards: ["Hi" : "Hola"])
    var f2 = FlashcardSet(name: "[Italian 1201] U1", id: 2, flashcards: ["Hi" : "Ciao"])
    var f3 = FlashcardSet(name: "Chinese Set", id: 3, flashcards: ["Hi" : "Nihao"])
    var f4 = FlashcardSet(name: "jap1000", id: 4, flashcards: ["Hi" : "Konnichiwa", "Thanks":"Arigato", "Bye":"Sayonara","Good morning":"Ohayo"])
    var f5 = FlashcardSet(name: "한국어 vocab",id: 5,  flashcards: ["Hi" : "Annyeonghaseyo",  "Bye": "Annyeong", "Thanks":"Gohmawo"])
    var f6 = FlashcardSet(name: "ARAB 1201 - U3", id: 6, flashcards: ["Hi" : "Marhaba", "Thanks":"Shukram"])
    var f7 = FlashcardSet(name: "french", id: 7, flashcards: ["Hi" : "Bonjour"])
    var f8 = FlashcardSet(name: "ARAB 1201 - U4", id: 8, flashcards: ["Hi" : "Sabahal nour"])
    var f9 = FlashcardSet(name: "Thai flashcards", id: 9, flashcards: ["Hi" : "Sawahdesee"])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* basic setup*/
        self.navigationItem.title = "Flashcard App"
        
        homeSetsTableView.delegate = self
        homeSetsTableView.dataSource = self
        homeSetsTableView.backgroundColor = UIColor.white
        homeSetsTableView.translatesAutoresizingMaskIntoConstraints = false
        homeSetsTableView.separatorStyle = .none
        homeSetsTableView.register(HomeSetsTableViewCell.self, forCellReuseIdentifier: homeSetsReuseIdentifier)
        view.addSubview(homeSetsTableView)
//        .addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)

        
        getSets()
        setupConstraints()

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homeSetsTableView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            homeSetsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20),
            homeSetsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            homeSetsTableView.widthAnchor.constraint(equalToConstant: 300),

        ])
    }
    
    private func getSets(){
        /* do something with network manager
         NetworkManager.getSets(completion: { fs in
             self.homeSets = fs
             self.homeSetsTableView.reloadData()
         })
         */
        
        self.homeSets = [f1, f2, f3, f4, f5, f6, f7, f8]
        self.homeSetsTableView.reloadData()
    }
    
    public func pushNavViewController(selectedFS: FlashcardSet){
        print(selectedFS.id)
        let sv = SetViewController(fs: selectedFS)
        present(sv, animated: true, completion: nil)
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fs = homeSets[indexPath.row]
        let setViewController = SetViewController(fs: fs)
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
//        return UITableViewCell()
    }
}

