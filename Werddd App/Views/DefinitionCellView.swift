//
//  DefinitionCellView.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/19/23.
//

import UIKit

class DefinitionCellView: UICollectionViewCell {
    
    // In terms of properties - need ID, stack, 3 labels
    
    static let ID = "ViewCellForDefinitions"

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    /*
    
    private let view: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .black
        uiView.layer.cornerRadius = 20
        return uiView
        
    }()
    
     */


    
    
    private let collectionWord: UILabel = {
        let word = UILabel()
       // word.translatesAutoresizingMaskIntoConstraints = false
        word.textColor = .white
        word.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return word
    }()
    
    private let collectionSpeech: UILabel = {
        let label = UILabel()
      //  label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 10)
        return label
    }()
    
    private let collectionDefinition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectionCell()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpCollectionCell() {
        
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 20
        
        stackView.addArrangedSubview(collectionWord)
        stackView.addArrangedSubview(collectionSpeech)
        
        contentView.addSubview(stackView)
        contentView.addSubview(collectionDefinition)
        
        
        stackView.spacing = .leastNormalMagnitude
    
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            collectionDefinition.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            collectionDefinition.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            collectionDefinition.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
        
    }
    
    func passingInData(from data: Definition) {
        collectionWord.text = data.word
        collectionSpeech.text = data.type
        collectionDefinition.text = data.definition
    }
}

