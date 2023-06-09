//
//  BottomViewController.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//

import UIKit



class BottomViewController: UIViewController {
    
    // MARK: Properties
    
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
       
       
       
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        
    }()
    
    
    
    // MARK: - Logic
    
    override func didMove(toParent parent: UIViewController?) {} // This pushed onto the ViewControllerMain and added as a subview to the BottomContainer UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
    
        
    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .darkGray
        collectionView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }

}
    
extension BottomViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return definitions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefinitionCellView.ID, for: indexPath) as? DefinitionCellView else {
            return UICollectionViewCell()
        }
        cell.passingInData(from: definitions[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(SecondDefinitionViewController(definition: definitions[indexPath.row]), animated: true)
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









    
    /*
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .gray
        return tableView
        
    }()
    
    override func didMove(toParent parent: UIViewController?) {}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.separatorColor = .white
        tableView.layer.cornerRadius = 30

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.contentView.backgroundColor = .black -- this will mess up the cells - need to change colors in the viewDidLoad()
    
        
        var contentsOfCell = cell.defaultContentConfiguration()
        
        contentsOfCell.text = definitions[indexPath.row].word
        contentsOfCell.secondaryText = definitions[indexPath.row].definition
        
    
        cell.contentConfiguration = contentsOfCell
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }

}


*/
