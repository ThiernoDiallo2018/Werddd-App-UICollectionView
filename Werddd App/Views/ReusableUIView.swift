//
//  ReusableUIView.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/24/23.
//

import UIKit

// this is the view of our UIViews on SecondDetailVC

// the resuable View we will be passing into our Second Def VC

class ReusableUIView: UIView {
    
// this will contain the stackView below plus the title label

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 20
        return stackView
    }()
    
    // this will contain part of speech and description label

    let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()

    let partsOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.isHidden = true // can manipulate with the properties we pass in with a boolean
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: Properties
    
    // Need to set these up so we can connect our data to the string properties to our data model
    let title: String?
    let descriptionText: String?
    let partOfSpeech: String?
    
    init(title: String?, descriptionText: String?, partOfSpeech: String?, isHidden: Bool = false, backgroundColor: UIColor = .white ) {
        self.title = title
        self.descriptionText = descriptionText
        self.partOfSpeech = partOfSpeech
        
        super.init(frame: .zero)
        
        // these two are properties that come with UIView already. The properties above arent
        self.isHidden = isHidden
        self.backgroundColor = backgroundColor
        
        configureViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        layer.cornerRadius = 25
        
        titleLabel.text = title
        descriptionLabel.text = descriptionText
        partsOfSpeech.text = partOfSpeech
        
        partsOfSpeech.isHidden = partOfSpeech == nil
        
        configuredDescriptionStackView()
        configureTitleLabel()
        configureStacks()
    }
    func configuredDescriptionStackView() {
        descriptionStackView.addArrangedSubview(partsOfSpeech)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(descriptionStackView)
        
    }
    func configureTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        
    }
    func configureStacks() {
        addSubview(stackView) // we have added everything the view of UIView here
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
    }
    
}
