//
//  BaseViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 26/04/23.
//

import UIKit

class BaseViewController: UIViewController {
    let loading: LoadingView = LoadingView.fromXib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingView()
    }
    
    func showLoading(_ isShow: Bool) {
        loading.showLoading(isShow)
        loading.isHidden = !isShow
    }
    
    private func setupLoadingView() {
        loading.isHidden = true
        loading.frame = view.bounds
        view.addSubview(loading)
        loading.bringSubviewToFront(view)
    }
}
