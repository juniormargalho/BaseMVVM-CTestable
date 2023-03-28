//
//  HomeViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 19/03/23.
//

import UIKit

protocol HomeViewNavigation {
    func goToAccessAccount()
}

class HomeViewController: UIViewController {
    weak var coordinator: HomeCoordinator?
    private let viewModel: HomeViewModel
    
    @IBOutlet weak var imageUserAvatar: UIImageView!
    @IBOutlet weak var labelGreetings: UILabel!
    @IBOutlet weak var viewGreetings: UIView!
    
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
        setupUI()
        viewModel.fetchUser()
    }
    
    private func showAlert(_ title: String,_ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupUI() {
        title = "HOME"
        imageUserAvatar.layer.cornerRadius = 2
        viewGreetings.layer.cornerRadius = 4
        viewGreetings.layer.shadowColor = UIColor.black.cgColor
        viewGreetings.layer.shadowRadius = 2
        viewGreetings.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewGreetings.layer.shadowOpacity = 0.3
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
        var greetings = "Bem vindo(a)"
        if let firstName = response.firstName {
            greetings = "Bem vindo(a), \(firstName)"
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
