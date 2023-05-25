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
    
    
   lazy var definitionInfo: ReusableUIView = {
       let view = ReusableUIView(title: "Definition" , descriptionText: definition.definition, partOfSpeech: definition.type, backgroundColor: .white)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var synonymsInfo: ReusableUIView = {
       let view = ReusableUIView(title: "Synonym", descriptionText: definition.synonyms, partOfSpeech: "", backgroundColor: .black)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var antonymsInfo: ReusableUIView = {
       let view = ReusableUIView(title: "Antonyms", descriptionText: definition.antonyms, partOfSpeech: "", backgroundColor: .white)
       view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  lazy  var exmapleInfo: ReusableUIView = {
      let view = ReusableUIView(title: "Example", descriptionText: definition.example, partOfSpeech: "", backgroundColor: .black )
      view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    // MARK: Properties
    
    
    var definition: Definition // Remember - always need to init when passing in data into a new VC
  
    init(definition: Definition) {
        self.definition = definition
        
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

    }
    
    // MARK: Setup
    
    func navigationSetUp() {
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let textAtrributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAtrributes
        
        navigationItem.title = definition.word
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
        pageStackView.addArrangedSubview(exmapleInfo)
        
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
    
}
