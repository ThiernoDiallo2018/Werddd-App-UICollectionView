//
//  HeaderCollectionView.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/29/23.
//


/*
 
 this one failed - was harding passing the data through the UISearchBar - didnt conform since
 this route is embedding the search into the UICollectionView()
 
 to use UISeachBar - need to use delegate as well - easier to use textfield
 
 */


/*

import UIKit


class HeaderCollectionView: UICollectionReusableView {
    
    static let id = "SearchHeader"
    
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.backgroundColor = .darkGray
        return stack
    }()
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Find a word"
        search.barTintColor = .darkGray
        search.layer.cornerRadius = 50
        return search
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(searchInfo), for: .touchUpInside)
        button.layer.cornerRadius = 30
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func searchInfo() {
        print("Hiiii")
    }
    
    func setupUI() {
        
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(button)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
}

*/
