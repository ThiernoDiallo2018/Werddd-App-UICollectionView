//
//  RefreshButton.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//
import UIKit

class RefreshButton: UIButton {
    
    var completion: (() -> Void)? //this is helping us pass in logic into our buttonTapped - layers
    
    init(completion: (() -> Void)?) {
        super.init(frame: .zero)
        
        self.completion = completion
        setUpUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        tintColor = .white
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "button.programmable", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
                completion?()
    }
    
}
