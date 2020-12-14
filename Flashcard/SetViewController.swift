//
//  SetViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import UIKit

class SetViewController: UIViewController {
    
    private let allTerms = UILabel()
    private let numTerms = UILabel()
    
    private let setTableView = UITableView()
    private let deckReuseIdentifier = "setReuse"
    private var fset: Deck!
    //private let backButton = UIButton()

    

    init(fs: Deck) {
        super.init(nibName: nil, bundle: nil)
        self.fset = fs

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = UIColor(red: 204/255, green: 226/255, blue: 202/255, alpha: 1)
        
//        backButton.setTitle("< Back", for: .normal)
//        backButton.setTitleColor(.black, for: .normal)
//        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(backButton)
//        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)

        title = fset.name
        view.backgroundColor = UIColor.white
        
        allTerms.translatesAutoresizingMaskIntoConstraints = false
        allTerms.text = "All terms"
        allTerms.textColor = .black
        allTerms.font = UIFont.systemFont(ofSize: 16.0)
        allTerms.textAlignment = .left
        view.addSubview(allTerms)
        
        numTerms.translatesAutoresizingMaskIntoConstraints = false
        numTerms.text = "\(fset.cards.count) terms"
        numTerms.textColor = .black
        numTerms.font = UIFont.systemFont(ofSize: 16.0)
        numTerms.textAlignment = .left
        view.addSubview(numTerms)
        
        setTableView.delegate = self
        setTableView.dataSource = self
        setTableView.backgroundColor = UIColor.white
        setTableView.translatesAutoresizingMaskIntoConstraints = false
        setTableView.register(DeckTableViewCell.self, forCellReuseIdentifier: deckReuseIdentifier)
        view.addSubview(setTableView)
        
        setupConstraints()
    }
    
    @objc func dismissViewController(){
        print("Dismissed")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:15),
//            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
//            ])
        
        NSLayoutConstraint.activate([
            allTerms.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:30),
            allTerms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)

        ])
        
        NSLayoutConstraint.activate([
            numTerms.topAnchor.constraint(equalTo: allTerms.topAnchor),
            //numTerms.widthAnchor.constraint(equalToConstant: 75),
            numTerms.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),

        ])
        
        NSLayoutConstraint.activate([
            setTableView.topAnchor.constraint(equalTo: allTerms.bottomAnchor, constant: 25),
            setTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            setTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }


}

extension SetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fset.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: deckReuseIdentifier, for: indexPath) as? DeckTableViewCell else { return UITableViewCell() }
        //let fset = fset[indexPath.row]
        cell.configure(for: fset, index: indexPath.row) //fset.flashcards[indexPath.row]
        //cell.delegate = self

        return cell
    }
}

extension SetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // needs to adjust based on definition length
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fs = fset
        let cell = tableView.cellForRow(at: indexPath) as! DeckTableViewCell

    }
}

