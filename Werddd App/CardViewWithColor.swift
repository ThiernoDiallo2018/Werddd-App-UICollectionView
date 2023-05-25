//
//  CardViewWithColor.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//

import UIKit
import Foundation

class CardViewWithColor: UIView {
    
    var completion: (() -> Void)? //new para - helps build logic since override init below cannot just accept any new parameter
    
    let word: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    let type: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = .italicSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    
    let definition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "creating a sequence of instructions to enable the computer to do something"
        label.font = .systemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    
    //needed to add the lazy var so the property would init at the same time as the others
    
    lazy var refreshButton: RefreshButton = {
        let button = RefreshButton { //the logic that is being passed in will be set to the completion property which is a closure in refreshbutton class
            
            self.completion?()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    init(completion: (() -> Void)?) {
        self.completion = completion
        
        super.init(frame: .zero)
        setUpUII()
    }
    
    
    
  /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUII()
        
    }
    
    */
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setUpUII() {
        backgroundColor = .black
        layer.cornerRadius = 30
        
        setupWord()
        setupBinaryOption()
        setupDefinition()
        setupButton()
        
    }
    
    
    
    
    func setupWord() {
        addSubview(word)
        
        NSLayoutConstraint.activate([
        word.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        word.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        
        ])
    }
    
    
    func setupBinaryOption() {
        addSubview(type)
        
        NSLayoutConstraint.activate([
            type.bottomAnchor.constraint(equalTo: word.bottomAnchor, constant: -4),
            type.leadingAnchor.constraint(equalTo: word.trailingAnchor, constant: 5),
            type.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])
        
    }
    
    func setupDefinition() {
        addSubview(definition)
        
        NSLayoutConstraint.activate([
            definition.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 20),
            definition.leadingAnchor.constraint(equalTo: word.leadingAnchor),
            definition.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
  ])
        
}
    
    func setupButton() {
        addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
                                    
        ])
    }
    
 }
