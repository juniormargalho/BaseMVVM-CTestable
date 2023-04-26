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
    func failureFetchHome()
    func successGetImageFrom(response: Data)
    func failureGetImageFrom()
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
                self?.getImageFrom(stringURL: user.avatar)
                self?.callBack?.successFetchHome(response: user)
            case .failure:
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.failureFetchHome()
            }
        }
    }
    
    func didHandleConfirmButton() {
        callBack?.showLoading(isShow: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.callBack?.showLoading(isShow: false)
        }
    }
    
    private func getImageFrom(stringURL: String) {
        service.getImageFrom(stringURL: stringURL) { [weak self] result in
            switch result {
            case .success(let data):
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.successGetImageFrom(response: data)
            case .failure:
                self?.callBack?.showLoading(isShow: false)
                self?.callBack?.failureGetImageFrom()
            }
        }
    }
}
