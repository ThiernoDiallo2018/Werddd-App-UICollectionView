//
//  ViewController.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//


import UIKit
import Foundation

class MainViewController: UIViewController {
    //For the button HomeVC is passing it down to CardWithColor which is passing down the action to refresh button. Now the logic can be kept in our homeVC
    
    //Keep logic in view controllers
        
    lazy var cardView: CardViewWithColor = {
        let view = CardViewWithColor { [weak self] in
            self?.randomWordChosen()  //referring to the HomeVC
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdddd"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    let bottomViewContainer: UIView = {
        let bottomContainer = UIView()
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.layer.cornerRadius = 30
        return bottomContainer
    }()
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Thierno Diallo - Werdd App"
        
        view.backgroundColor = .gray
        
        setUpUI()
        
        let bottomViewController = BottomViewController()
        addChild(bottomViewController)
        bottomViewContainer.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParent: self)
        bottomViewController.view.frame = bottomViewContainer.frame
        
        
    }
    
    // MARK: - UI Setup
    
    func setUpUI() {
        setUpAppTitle()
        cardViewContainer()
        setUpBottomContainer()
        
    }
    
    
    func setUpAppTitle() {
        view.addSubview(appTitle)
        
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appTitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
    
    func cardViewContainer() {
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 30),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    
    func setUpBottomContainer() {
        view.addSubview(bottomViewContainer)
        
        NSLayoutConstraint.activate([
            bottomViewContainer.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 30),
            bottomViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    //MARK: - Actions
    
    func randomWordChosen() {
        let randomWord = definitions.randomElement()
        cardView.word.text = randomWord?.word
        cardView.type.text = randomWord?.type
        cardView.definition.text = randomWord?.definition
    }
    
    
    
}






