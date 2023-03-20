//
//  HomeViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 19/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUser()
    }
}

extension HomeViewController: HomeViewModelCallBack {
    func showLoading(_ isLoad: Bool) {
        if isLoad {
            // show
        } else {
            // hide
        }
    }
}
