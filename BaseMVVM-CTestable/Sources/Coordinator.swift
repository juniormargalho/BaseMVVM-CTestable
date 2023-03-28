//
//  Coordinator.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 28/03/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var child: Coordinator? { get set }
    
    func start()
}
