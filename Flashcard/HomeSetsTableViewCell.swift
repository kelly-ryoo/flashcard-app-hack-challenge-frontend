//
//  HomeSetsTableViewCell.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import UIKit

class HomeSetsTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let name = UILabel()
    private let numOfTerms = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        name.textColor = UIColor.black
        name.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(name)
        
        numOfTerms.textColor = UIColor.black
        numOfTerms.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(numOfTerms)
        
        setUpConstraints()
    }
    
    private func setUpConstraints(){
        
        let containerPadding: CGFloat = 20
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: containerPadding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: containerPadding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: containerPadding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: containerPadding)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            name.heightAnchor.constraint(equalToConstant: 100),
            name.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            name.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            numOfTerms.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding),
            numOfTerms.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: padding),
            numOfTerms.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: padding),
            numOfTerms.trailingAnchor.constraint(equalTo: name.trailingAnchor, constant: padding)
        ])
        
    }
    
    func configure(for homeSet: FlashcardSet){
        self.name.text = homeSet.name
        self.numOfTerms.text = String(homeSet.flashcards.count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }

}

