//
//  LoginRegisterViewController.swift
//  mvvm.example
//
//  Created by Jay Beaudoin on 2023-03-21.
//

import Foundation
import UIKit

class LoginRegisterViewController: UIViewController {
    
    private let viewModel: LoginRegisterViewModel
    private let showSeller: Bool
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    init(viewModel: LoginRegisterViewModel) {
        self.viewModel = viewModel
        self.showSeller = viewModel.showSeller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        if showSeller {
            titleLabel.text = "Showing Seller"
        } else {
            titleLabel.text = "Showing Buyer"
        }
    }
    
}
