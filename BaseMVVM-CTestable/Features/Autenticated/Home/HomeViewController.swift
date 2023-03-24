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
        viewModel.callBack = self
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
    func successFetchHome(response: UserModel) {
        if let firstName = response.firstName {
            print(firstName)
        }
        print("mais alguma coisa")
    }
    
    func failureFetchHome(message: String) {
        // Apresentar alert
    }
    
    func showLoading(isShow: Bool) {
        if isShow {
            // apresentar loading
        } else {
            // esconder loading
        }
    }
}
