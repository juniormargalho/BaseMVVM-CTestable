//
//  HomeViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 19/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    @IBOutlet weak var imageUserAvatar: UIImageView!
    @IBOutlet weak var labelGreetings: UILabel!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.callBack = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUser()
    }
    
    private func showAlert(_ title: String,_ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: HomeViewModelCallBack {
    func successGetImageFrom(response: Data) {
        imageUserAvatar.image = UIImage(data: response)
    }
    
    func failureGetImageFrom(message: String) {
        imageUserAvatar.image = UIImage(named: "ic_user_avatar")
    }
    
    func successFetchHome(response: UserModel) {
        let greetings = "Bem vindo(a)"
        if let firstName = response.firstName {
            labelGreetings.text = "Bem vindo(a), \(firstName)"
        }
        labelGreetings.text = greetings
    }
    
    func failureFetchHome(message: String) {
        showAlert("Falha", message)
    }
    
    func showLoading(isShow: Bool) {
        isShow ? print("loading...") : print("loaded")
    }
}
