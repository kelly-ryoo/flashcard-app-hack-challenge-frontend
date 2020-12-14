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
    
    private let seeTerms = UIButton()
    private let review = UIButton()
    
    
    weak var delegate: ReviewPressed?
    
    public var id : Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red: 169/255, green: 202/255, blue: 151/255, alpha: 1.0) /* #a9ca97 */

        contentView.addSubview(containerView)
        
        name.textColor = UIColor.black
        name.font = UIFont.systemFont(ofSize: 20)
        name.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(name)
        
        numOfTerms.textColor = UIColor.black
        numOfTerms.font = UIFont.systemFont(ofSize: 14)
        numOfTerms.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(numOfTerms)
        
        seeTerms.setTitle("See Terms", for: .normal)
        seeTerms.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(seeTerms)
        seeTerms.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        review.setTitle("Review", for: .normal)
        review.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(review)
        review.addTarget(self, action: #selector(reviewPressed), for: .touchUpInside)


        setUpConstraints()
    }
    

    private func setUpConstraints(){
        
        let padding: CGFloat = 15

        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            //containerView.widthAnchor.constraint(equalToConstant: 300),
            //containerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            name.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            name.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            numOfTerms.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding),
            numOfTerms.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            numOfTerms.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            seeTerms.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -padding),
            //seeTerms.topAnchor.constraint(equalTo: containerView.centerYAnchor),
            //review.leadingAnchor.constraint(equalTo: numOfTerms.trailingAnchor, constant: padding),
            seeTerms.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            review.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: padding),
            review.trailingAnchor.constraint(equalTo: seeTerms.trailingAnchor)
        ])
        
    }
    
    func configure(for homeSet: Deck){
        self.name.text = homeSet.name
        self.numOfTerms.text = "Number of Items: " + String(homeSet.cards.count)
        self.id = homeSet.id
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
    
    @objc func buttonPressed(){
        //name.text="changed"
        delegate?.pushSetViewController(selectedFSID: id)
    }
    
    @objc func reviewPressed(){
        delegate?.pushReviewSetViewController(selectedFSID: id)
    }

}

