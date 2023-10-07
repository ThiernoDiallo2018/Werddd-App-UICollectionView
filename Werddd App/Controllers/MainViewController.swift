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

    let networkingRandom: NetworkingLead
    
        
    lazy var cardView: CardViewWithColor = {
        let view = CardViewWithColor { [weak self] in
            self?.loadRandomWordChosen()  //referring to the MainVC - talking to it
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    let appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdddd"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    
    lazy var favoritesListButton: UIButton = {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "heart.text.square.fill", withConfiguration: symbolConfiguration)

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = UIColor.systemPink
        button.addTarget(self, action: #selector(favoritesListButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    let bottomViewContainer: UIView = {
        let bottomContainer = UIView()
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.layer.cornerRadius = 40
        return bottomContainer
    }()
    
    
    
    // MARK: - Life Cycle
    
    init(networkingRandom: NetworkingLead = NetworkingLead()) {
        self.networkingRandom = networkingRandom
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TD Werdd App"
        
        view.backgroundColor = .gray
        
        
        let bottomViewController = BottomViewController()
        addChild(bottomViewController)
        bottomViewContainer.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParent: self)
        bottomViewController.view.frame = bottomViewContainer.frame
        
        
        setUpUI()
        
    }
    
    // MARK: - UI Setup
    
    func setUpUI() {
        setUpAppHeader()
        cardViewContainer()
        setUpBottomContainer()
        loadRandomWordChosen()
        
    }
    
    
    
    func setUpAppHeader() {
        headerStackView.addArrangedSubview(appTitle)
        headerStackView.addArrangedSubview(favoritesListButton)
        
        view.addSubview(headerStackView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
    
 
     func loadRandomWordChosen() {
        
        networkingRandom.networkingRandomWordURL { [weak self] result in
            switch result {
            case .success(let randomWord):
                DispatchQueue.main.async {
                    self?.cardView.word.text = randomWord.word
                    self?.cardView.type.text = randomWord.results?.first?.partOfSpeech
                    self?.cardView.definition.text = randomWord.results?.first?.definition
                }
            case .failure( _):
                print("\(String(describing: self?.networkingRandom.errorNotice))")
            }

            }
        }
    
    @objc func favoritesListButtonPressed() {
        navigationController?.pushViewController(FavoriteViewController(dataManager: DataManager()), animated: true)
    }
}
    
    




/*
func randomWordChosen() {
    let randomWord = definitions.randomElement()
    cardView.word.text = randomWord?.word
    cardView.type.text = randomWord?.type
    cardView.definition.text = randomWord?.definition
}
*/
