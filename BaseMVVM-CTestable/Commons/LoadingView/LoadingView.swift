//
//  LoadingView.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 26/04/23.
//

import UIKit

final class LoadingView: UIView {
    @IBOutlet weak var activityIndicatorLoading: UIActivityIndicatorView!

    func showLoading(_ isShow: Bool) {
        DispatchQueue.main.async {
            if isShow {
                self.activityIndicatorLoading.startAnimating()
            } else {
                self.activityIndicatorLoading.stopAnimating()
            }
        }
    }
}
