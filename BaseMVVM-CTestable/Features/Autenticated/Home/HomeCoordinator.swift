//
//  HomeCoordinator.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 22/03/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var child: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = HomeService()
        let viewModel = HomeViewModel(service: service)
        let homeViewController = HomeViewController(viewModel: viewModel)
        homeViewController.coordinator = self
        child = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}

extension HomeCoordinator: HomeViewNavigation {
    func goToAccessAccount() {
        let accessAccountCoordinator = AccessAccountCoordinator(navigationController: navigationController)
        accessAccountCoordinator.start()
    }
}
