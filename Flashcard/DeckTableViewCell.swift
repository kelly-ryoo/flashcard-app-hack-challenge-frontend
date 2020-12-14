//
//  DeckTableViewCell.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/11/20.
//

import UIKit

class DeckTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let term = UILabel()
    private let definition = UILabel()
    
    public var id : Int = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.layer.backgroundColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1).cgColor
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red: 155/255, green: 184/255, blue: 152/255, alpha: 1) // #9bb898
        contentView.addSubview(containerView)
        
        term.textColor = UIColor.black
        term.font = UIFont.systemFont(ofSize: 20)
        term.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(term)
        
        definition.textColor = UIColor(red: 75, green: 75, blue: 75, alpha: 1)
        definition.font = UIFont.systemFont(ofSize: 18)
        definition.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(definition)
        
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            term.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            term.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            definition.topAnchor.constraint(equalTo: term.bottomAnchor, constant: padding),
            definition.leadingAnchor.constraint(equalTo: term.leadingAnchor)
        ])
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure(for set: Deck, index: Int){
        self.term.text = set.cards[index].front
        self.definition.text = set.cards[index].back
        self.id = set.id
    }
    
}
