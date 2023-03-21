//
//  ViewController.swift
//  mvvm.example
//
//  Created by Jay Beaudoin on 2023-03-21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.spacing = 50
        stack.distribution = .fillEqually
        
        stack.backgroundColor = .cyan
        
        return stack
    }()
    
    private lazy var sellerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        
        button.setTitleColor(.white, for: .normal)

        button.setTitle("Seller", for: .normal)
        
        button.addTarget(self, action: #selector(showLoginView(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buyerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        
        button.setTitleColor(.white, for: .normal)
        
        button.setTitle("Buyer", for: .normal)
        
        button.addTarget(self, action: #selector(showLoginView(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            vStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            vStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250)
        ])
        
        vStack.addArrangedSubview(sellerButton)
        vStack.addArrangedSubview(buyerButton)
    }
    
    @objc private func showLoginView(_ sender: UIButton) {
        var showSeller: Bool = false
        
        if sender == buyerButton {
            showSeller = false
        } else if sender == sellerButton {
            showSeller = true
        }
        
        let loginRegisterViewController = LoginRegisterViewController(viewModel: .init(showSeller: showSeller))
        
        navigationController?.pushViewController(loginRegisterViewController, animated: true)
    }
    
}

