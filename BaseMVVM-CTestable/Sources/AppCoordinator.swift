//
//  AppCoordinator.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 28/03/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var child: Coordinator?
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        child = coordinator
        child?.start()
    }
}
