//
//  HomeViewModel.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 19/03/23.
//

import Foundation

protocol HomeViewModelCallBack: AnyObject {
    func showLoading(_ isLoad: Bool)
}

final class HomeViewModel {
    weak var callBack: HomeViewModelCallBack?
    
    func fetchUser() {
        callBack?.showLoading(true)
        
        // consumo sucesso
        callBack?.showLoading(false)
        // consumo falha
        callBack?.showLoading(false)
    }
}
