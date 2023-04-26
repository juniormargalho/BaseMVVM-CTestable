//
//  AccessAccountViewModel.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 10/04/23.
//

import Foundation

protocol AccessAccountViewModelDelegate: AnyObject {
    func showLoading(isShow: Bool)
}
    
class AccessAccountViewModel {
    weak var delegate: AccessAccountViewModelDelegate?
}
