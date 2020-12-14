//
//  NewCardTableViewCell.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/13/20.
//

import UIKit

protocol saveInfoDelegate: class {
    func saveInfo(index: Int, front: String, back: String)
    func deleteCell(index: Int)
}

class NewCardTableViewCell: UITableViewCell {
    weak var delegate: saveInfoDelegate?
    
    private let containerView = UIView()
    private let term = UITextField()
    private let definition = UITextField()
    var indexPath: Int!
    
    private let removeCellButton = UIButton()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        contentView.addSubview(containerView)
        
        term.textColor = UIColor.black
        term.text = nil
        term.placeholder = "term"
        term.font = UIFont.systemFont(ofSize: 20)
        term.delegate = self
        term.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(term)
        
        definition.textColor = UIColor.black
        definition.text = nil
        definition.placeholder = "defintion"
        definition.delegate = self
        definition.font = UIFont.systemFont(ofSize: 20)
        definition.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(definition)
        
        removeCellButton.translatesAutoresizingMaskIntoConstraints = false
        removeCellButton.setTitle("-", for: .normal)
        removeCellButton.setTitleColor(.white, for: .normal)
        removeCellButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        removeCellButton.contentVerticalAlignment = .center
        removeCellButton.contentHorizontalAlignment = .center
        removeCellButton.backgroundColor = UIColor.init(displayP3Red: 169/255, green: 202/255, blue: 151/255, alpha: 1)
        removeCellButton.layer.cornerRadius = 15
        removeCellButton.addTarget(self, action: #selector(removePressed), for: .touchUpInside)
        containerView.addSubview(removeCellButton)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            term.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            term.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            definition.topAnchor.constraint(equalTo: term.bottomAnchor, constant: padding),
            definition.leadingAnchor.constraint(equalTo: term.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            removeCellButton.widthAnchor.constraint(equalToConstant: 30),
            removeCellButton.heightAnchor.constraint(equalToConstant: 30),
            removeCellButton.topAnchor.constraint(equalTo: term.topAnchor),
            removeCellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
    func configure(for index: Int, card: Card){
        self.term.text = card.front
        self.definition.text = card.back
        self.indexPath = index
    }
    
}

extension NewCardTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
        if textField == term {
            delegate?.saveInfo(index: indexPath, front: textField.text ?? "", back: definition.text ?? "")
        } else {
            delegate?.saveInfo(index: indexPath, front: term.text ?? "", back: textField.text ?? "")
        }
    }
    @objc func removePressed() {
        delegate?.deleteCell(index: indexPath)
    }
}
