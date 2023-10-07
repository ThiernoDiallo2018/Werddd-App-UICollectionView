//
//  FavoriteWordCell.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/25/23.
//

import UIKit

class FavoriteWordCell: UITableViewCell {
    
    static let identifier = FavoriteWordCell.self.description()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Creamsicle")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Rubik-Bold", size: 18)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 4
        return label
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Rubik-LightItalic", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        titleLabel.text = "title"
        partsOfSpeechLabel.text = "parts of speech"
        subtitleLabel.text = "subtitle"
        
        contentView.backgroundColor = .white
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(partsOfSpeechLabel)
        containerView.addSubview(subtitleLabel)
        
        contentView.addSubview(containerView)
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        partsOfSpeechLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            partsOfSpeechLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -12)
        ])
    }
    
    func updateViews(with favoriteWord: FavoriteWord) {
        titleLabel.text = favoriteWord.title
        subtitleLabel.text = favoriteWord.definition
        partsOfSpeechLabel.text = favoriteWord.partOfSpeech
    }
    
}

