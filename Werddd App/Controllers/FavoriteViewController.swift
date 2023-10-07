//
//  FavoriteVCViewController.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/25/23.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // - MARK: Properties
    
    let dataManager: DataManager
    var favoriteWords: [FavoriteWord]?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteWordCell.self, forCellReuseIdentifier: FavoriteWordCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // - MARK: Inits
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Favorites"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addViews()
        fetchFavoriteWords()

    }
    
    // - MARK: Methods
    func addViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func fetchFavoriteWords() {
        dataManager.fetchAllWords { favoriteWords in
            self.favoriteWords = favoriteWords
        }
    }
    
    func deleteFavoriteWord(_ word: FavoriteWord, atIndexPath indexPath: IndexPath) {
        
        do {
            try dataManager.deleteFavoriteWord(word)
            favoriteWords?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("You messed up")
        }
    }
    
    // - MARK: Logic
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteWords?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoriteWord = favoriteWords?[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteWordCell.identifier, for: indexPath) as! FavoriteWordCell

        cell.updateViews(with: favoriteWord)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Delete", message: "Do you want to delete this werdd from your Favorites?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
            guard let favoriteWord = self.favoriteWords?[indexPath.row] else { return }
            
            self.deleteFavoriteWord(favoriteWord, atIndexPath: indexPath)
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true, completion: nil)
    }
        
        
 }
    
