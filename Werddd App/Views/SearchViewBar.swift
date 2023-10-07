//
//  SearchViewBar.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/9/23.
//

import UIKit

//We need to pass this View with logic to our MainView - utilizing delegates


protocol SearchDelegate: AnyObject {
    
    func searchDefinitionAPI(search word: String?)
}

class SearchViewBar: UIView {
    
    weak var searchDefinitionsDelegate: (SearchDelegate)? // we have tied this delegate using this property

    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
 
    let textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Input a Definition"
        text.backgroundColor = .darkGray
        text.textColor = .systemBlue
        
        let searchIcon = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        
        
        let searchContainer: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        
        searchContainer.addSubview(searchIcon)
        
        text.leftView = searchContainer
        text.leftViewMode = .always
  
        return text
        
    }()
    
    

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    
    
    init(searchDefinitionsDelegate: SearchDelegate?) {
        super.init(frame: .zero)
        
        self.searchDefinitionsDelegate = searchDefinitionsDelegate
        setUpSearchBarUI()
    }
    
    required init?(coder: NSCoder) {
                    nil
        
    }
    
    @objc func searchButtonPressed() {
        print("Hiiii")
        
        searchDefinitionsDelegate?.searchDefinitionAPI(search: textField.text)
    }
    
    
    func setUpSearchBarUI() {
        backgroundColor = .darkGray
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 100)
                                    
                                    
        ])
        
    }
    
}
