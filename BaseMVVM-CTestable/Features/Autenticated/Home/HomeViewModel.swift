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
    func successGetImageFrom(response: Data)
    func failureGetImageFrom(message: String)
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
                self?.getImageFrom(StringURL: user.avatar)
                self?.callBack?.successFetchHome(response: user)
            case .failure:
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.failureFetchHome(message: "Não foi possível carregar informações do Usuário")
            }
        }
    }
    
    func getImageFrom(StringURL: String) {
        service.getImageFrom(StringURL: StringURL) { [weak self] result in
            switch result {
            case .success(let data):
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.successGetImageFrom(response: data)
            case .failure:
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.failureGetImageFrom(message: "Não foi possivel carregar a imagem do usuário")
            }
        }
    }
}
