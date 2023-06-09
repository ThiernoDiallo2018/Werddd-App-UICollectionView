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
    
    weak var searchDefinitions: (SearchDelegate)? // we have tied this delegate using this property

    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.backgroundColor = .darkGray
        return stack
    }()
 
    let textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Input a Definition"
        text.backgroundColor = .darkGray
        
        let searchIcon = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        
        
        let searchContainer: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        
        searchContainer.addSubview(searchIcon)
        
        text.leftView = searchContainer
        text.leftViewMode = .whileEditing
  
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
    
    
    
    init(searchDefinitions: SearchDelegate?) {
        super.init(frame: .zero)
        
        self.searchDefinitions = searchDefinitions
    }
    
    required init?(coder: NSCoder) {
nil
        
    }
    
    @objc func searchButtonPressed() {
        print("Hiiii")
        
        searchDefinitions?.searchDefinitionAPI(search: textField.text)
    }
    
    
    func setUpSearchBarUI() {
        backgroundColor = .white
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(button)
        
        addSubview(stackView)
        
    }
    
}
