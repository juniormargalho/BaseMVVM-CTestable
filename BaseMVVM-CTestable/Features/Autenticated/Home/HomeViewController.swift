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

class HomeViewController: BaseViewController {
    // MARK: Properties
    weak var coordinator: HomeCoordinator?
    private let viewModel: HomeViewModel
    private let baseButtonViewConfirm = BaseButtonView.fromXib()
    private let baseButtonViewCancel = BaseButtonView.fromXib()
    private let baseTextFieldViewName = BaseTextFieldView.fromXib()
    private let baseTextFieldViewPassword = BaseTextFieldView.fromXib()
    
    // MARK: Outlets
    @IBOutlet weak var imageUserAvatar: UIImageView!
    @IBOutlet weak var labelGreetings: UILabel!
    @IBOutlet weak var viewGreetings: UIView!
    @IBOutlet weak var viewButtonConfirm: UIView!
    @IBOutlet weak var viewButtonCancel: UIView!
    @IBOutlet weak var viewTextFieldName: UIView!
    @IBOutlet weak var viewTextFieldPassword: UIView!
    
    // MARK: Initializers
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.callBack = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        bindEvents()
        setupUI()
        viewModel.fetchUser()
    }
    
    // MARK: Methods
    private func bindEvents() {
        baseButtonViewConfirm.didHandleButton = { [weak self] in
            self?.viewModel.didHandleConfirmButton()
        }
        
        baseButtonViewCancel.didHandleButton = { [weak self] in
            guard let name = self?.baseTextFieldViewName.textField.text else { return }
            if name != "junior" {
                self?.baseTextFieldViewName.update(state: .errorState, errorMessage: "Campo inválido")
            } else {
                self?.baseTextFieldViewName.update(state: .defaultState)
            }
        }
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
        setupViewGreetings()
        setupViewTextFieldName()
        setupViewTextFieldPassword()
        setupViewButtonConfirm()
        setupViewButtonCancel()
    }
    
    private func setupViewGreetings() {
        labelGreetings.font = .roboto(size: 14, weight: .medium)
        viewGreetings.layer.cornerRadius = 4
        viewGreetings.layer.shadowColor = UIColor.black.cgColor
        viewGreetings.layer.shadowRadius = 2
        viewGreetings.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewGreetings.layer.shadowOpacity = 0.5
    }
    
    private func setupViewTextFieldName() {
        viewTextFieldName.addSubview(baseTextFieldViewName)
        baseTextFieldViewName.fillSuperView()
        baseTextFieldViewName.setup(type: .defaultType, title: "Nome")
    }
    
    private func setupViewTextFieldPassword() {
        viewTextFieldPassword.addSubview(baseTextFieldViewPassword)
        baseTextFieldViewPassword.fillSuperView()
        baseTextFieldViewPassword.setup(type: .securityType, title: "Senha")
    }
    
    private func setupViewButtonConfirm() {
        viewButtonConfirm.addSubview(baseButtonViewConfirm)
        baseButtonViewConfirm.fillSuperView()
        baseButtonViewConfirm.setup(title: "Confirmar",
                                    titleColor: .white,
                                    backgroundColor: .baseColor(.basePrimary))
    }
    
    private func setupViewButtonCancel() {
        viewButtonCancel.addSubview(baseButtonViewCancel)
        baseButtonViewCancel.fillSuperView()
        baseButtonViewCancel.setup(title: "Cancelar",
                                   titleColor: .white,
                                   backgroundColor: .baseColor(.baseSecondary))
    }
}

// MARK: Extensions
extension HomeViewController: HomeViewModelCallBack {
    func successGetImageFrom(response: Data) {
        imageUserAvatar.image = UIImage(data: response)
    }
    
    func failureGetImageFrom() {
        imageUserAvatar.image = UIImage(named: "ic_user_avatar")
    }
    
    func successFetchHome(response: UserModel) {
        var greetings = "Bem vindo(a)"
        if let firstName = response.firstName, firstName != "" {
            greetings = "Bem vindo(a), \(firstName)"
        }
        labelGreetings.text = greetings
    }
    
    func failureFetchHome() {
        showAlert("Falha", "Não foi possível carregar informações do Usuário")
    }
    
    func showLoading(isShow: Bool) {
        showLoading(isShow)
    }
}
