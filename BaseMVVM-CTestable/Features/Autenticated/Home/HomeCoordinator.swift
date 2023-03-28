//
//  HomeCoordinator.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 22/03/23.
//

import UIKit

class HomeCoordinator: Coordinator {
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
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeViewNavigation {
    func goToAccessAccount() {
        // TODO: Instanciar o coordinator de AccessAccount e chamar o metodo start
    }
}
