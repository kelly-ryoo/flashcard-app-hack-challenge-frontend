//
//  ViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let homeSetsTableView = UITableView()
    private let homeSetsReuseIdentifier = "homeFlashcardSetsReuse"
    private var homeSets: [FlashcardSet] = []
    
    /* testing */
    var f1 = FlashcardSet(name: "Title: Flashcard 1", flashcards: ["Hello" : "Hello"])
    var f2 = FlashcardSet(name: "Title Flashcard 2", flashcards: ["Hi" : "Hi"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* basic setup*/
        title = "Flashcard"
        navigationController?.navigationBar.tintColor = .white
        
        homeSetsTableView.delegate = self
        homeSetsTableView.dataSource = self
        homeSetsTableView.backgroundColor = UIColor.black
        homeSetsTableView.translatesAutoresizingMaskIntoConstraints = false
        homeSetsTableView.separatorStyle = .none
        homeSetsTableView.register(HomeSetsTableViewCell.self, forCellReuseIdentifier: homeSetsReuseIdentifier)
        view.addSubview(homeSetsTableView)
        
        getSets()
        setupConstraints()

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homeSetsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            homeSetsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeSetsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeSetsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func getSets(){
        /* do something with network manager
         NetworkManager.getSets(completion: { fs in
             self.homeSets = fs
             self.homeSetsTableView.reloadData()
         })
         */
        
        self.homeSets = [f1, f2]
        self.homeSetsTableView.reloadData()
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fs = homeSets[indexPath.row]
        let setViewController = SetViewController(fs: fs)
        navigationController?.pushViewController(setViewController, animated: true)
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
        return cell
//        return UITableViewCell()
    }
}

