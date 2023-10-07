//
//  BottomViewController.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//

import UIKit

class BottomViewController: UIViewController {

    // MARK: Properties
    
    let networkingDetails: NetworkingLead
    
    var words: [apiWordDetail]?
    var selectedWord: String? // //connects all the way back to the data point in defintion cell in our method - collectionWord.text = word LAYERS
    
    
    
    
   lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 175, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DefinitionCellView.self, forCellWithReuseIdentifier: DefinitionCellView.ID)
       /*
       collectionView.register(HeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.id)
       */
        collectionView.backgroundColor = .darkGray
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        
    }()
    
    
    lazy var searchView: SearchViewBar = {
        let search = SearchViewBar(searchDefinitionsDelegate: self)
        search.translatesAutoresizingMaskIntoConstraints =  false
        search.layer.cornerRadius = 20
        search.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return search
    }()
    
    
    
    // MARK: - Logic
    init(networkingDetails: NetworkingLead = NetworkingLead()) {
        self.networkingDetails = networkingDetails
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMove(toParent parent: UIViewController?) {} // This pushed onto the ViewControllerMain and added as a subview to the BottomContainer UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()

    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        view.addSubview(searchView)
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }

}
    
extension BottomViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefinitionCellView.ID, for: indexPath) as? DefinitionCellView else {
            
            return UICollectionViewCell()
        }
    
        
        cell.passingInData(words?[indexPath.row], word: selectedWord) // //connects all the way back to the data point in defintion cell in our method - collectionWord.text = word
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedWord = selectedWord,
              let selectedWordDetails = words?[indexPath.row] else {
            print("The code failed")
            return
        }
        navigationController?.pushViewController(SecondDefinitionViewController(wordDetails: selectedWordDetails, selectedWord: selectedWord), animated: true)
  
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.id, for: indexPath) as? HeaderCollectionView else {
            
            return UICollectionReusableView()
        }
        return headerView
    }
    
    */
    
}



extension BottomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
}



extension BottomViewController: SearchDelegate {
    func searchDefinitionAPI(search word: String?) {

        guard let word = word, !word.isEmpty else {
            print("Invalid")
            return
        }

        networkingDetails.networkingWordDetailsURL(word) { [weak self] result in
            switch result {
            case .success(let word):
                DispatchQueue.main.async {
                    self?.words = word.results?.filter { $0.definition != nil}
                    self?.selectedWord = word.word
                    self?.collectionView.reloadData()
                }
            case.failure( _ ):
                print("You fucked up Thierno")
            }
            
        }



    }
}





  
