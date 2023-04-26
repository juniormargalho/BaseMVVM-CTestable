//
//  AccessAccountViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 22/03/23.
//

import UIKit

class AccessAccountViewController: UIViewController {
    var viewModel: AccessAccountViewModel

    init(viewModel: AccessAccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AccessAccountViewController: AccessAccountViewModelDelegate {
    func showLoading(isShow: Bool) {
    }
}
