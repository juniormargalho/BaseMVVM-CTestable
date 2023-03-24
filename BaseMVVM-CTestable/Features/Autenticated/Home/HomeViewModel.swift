//
//  HomeViewModel.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 19/03/23.
//

import Foundation

protocol HomeViewModelCallBack: AnyObject {
    func showLoading(isShow: Bool)
    func successFetchHome(response: UserModel)
    func failureFetchHome(message: String)
}

final class HomeViewModel {
    private let service: HomeServiceProtocol
    weak var callBack: HomeViewModelCallBack?
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func fetchUser() {
        callBack?.showLoading(isShow: true)
        service.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.successFetchHome(response: user)
            case .failure:
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.failureFetchHome(message: "Usuário não encontrado")
            }
        }
    }
    
    func fetchUserFirstName() {
        
    }
    
    private func capitalize(text: String) -> String {
        return text.capitalized
    }
}

// Explicar chamada e tratamento
