//
//  AccessAccountCoordinator.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 09/05/23.
//

import UIKit

final class AccessAccountCoordinator: Coordinator {
    var navigationController: UINavigationController
    var child: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let accessViewController = AccessAccountViewController()
        accessViewController.coordinator = self
        child = self
        navigationController.pushViewController(accessViewController, animated: true)
    }
}
