//
//  SecondDefinitionViewController.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/20/23.
//

import UIKit

class SecondDefinitionViewController: UIViewController {
    
    // Of the full page
    
    // MARK: UI Properties
    
    
    let wordDetails: apiWordDetail // passed in so we can label out network data to the strings we want displayed

    let selectedWord: String //connects all the way back to the data point in defintion cell in our method - collectionWord.text = word
    let dataManager: DataManager
    var isFavorited: Bool = false {
        didSet {
           updateRightBarButton()
        }
    }
    
    // this scroll will house everything below and more on the Reusable UIVIew
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //this will contain all of the UI View below
    
    let pageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
        
    }()
    
    
   lazy var definitionInfo: DetailsView = {
       let view = DetailsView(title: "Definition" ,
                                 descriptionText: wordDetails.definition,
                                 partOfSpeech: wordDetails.partOfSpeech,
                                 backgroundColor: .white)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var synonymsInfo: DetailsView = {
       let view = DetailsView(title: "Synonym",
                                 descriptionText: wordDetails.synonyms?.joined(separator: ", "),
                                 partOfSpeech: nil,
                                 backgroundColor: .black)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var antonymsInfo: DetailsView = {
       let view = DetailsView(title: "Antonyms",
                                 descriptionText: wordDetails.antonyms?.joined(separator: ","),
                                 partOfSpeech: nil,
                                 backgroundColor: .white)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  lazy  var exampleInfo: DetailsView = {
      let view = DetailsView(title: "Example",
                                descriptionText: wordDetails.examples?.joined(separator: "\n\n"),
                                partOfSpeech: nil,
                                backgroundColor: .black )
      
      view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    // MARK: Properties
    
    
    //var definition: Definition // Remember - always need to init when passing in data into a new VC
  
    init(wordDetails: apiWordDetail, selectedWord: String, dataManager: DataManager = DataManager()) {
        self.wordDetails = wordDetails
        self.selectedWord = selectedWord
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        navigationSetUp()
        setUpUI()
        
        dataManager.fetchFavoriteWord(definition: wordDetails.definition ?? "What is happening", title: selectedWord) { favoriteWord in
            guard favoriteWord != nil else {
                isFavorited = false
                return
            }
            
            isFavorited = true
        }

    }
    
    // MARK: Setup
    
    func navigationSetUp() {
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let textAtrributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAtrributes
        
        navigationItem.title = selectedWord
    }
    
    func setUpUI() {
        addScrollView()
        addStackViews()
    }
    
    func addScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
                       ])
        
    }
    
    func addStackViews() {
        pageStackView.addArrangedSubview(definitionInfo)
        pageStackView.addArrangedSubview(synonymsInfo)
        pageStackView.addArrangedSubview(antonymsInfo)
        pageStackView.addArrangedSubview(exampleInfo)
        
        scrollView.addSubview(pageStackView)
        
        NSLayoutConstraint.activate([
            pageStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            pageStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            pageStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pageStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            definitionInfo.widthAnchor.constraint(equalTo: pageStackView.widthAnchor)

        ])
    }
    
     func updateRightBarButton() {
        if isFavorited {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(removeWordFromFavorites))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(addToFavorites))
        }
    }
    
    @objc func addToFavorites() {
        dataManager.createFavoriteWord(from: selectedWord, and: wordDetails)
        isFavorited = true
    }
    
    @objc func removeWordFromFavorites() {
        dataManager.delete(title: selectedWord, definition: wordDetails.definition ?? "Hahahah")
        isFavorited = false
    }
}
