//
//  BaseTextFieldView.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 02/04/23.
//

import UIKit

class BaseTextFieldView: UIView {
    // MARK: Properties
    private let openEye = UIImage(named: "ic_open_eye")
    private let closedEye = UIImage(named: "ic_closed_eye")
    private var isTogleEye = true
    
    enum TextFieldType {
        case defaultType
        case securityType
    }
    
    enum TextFieldState {
        case defaultState
        case errorState
    }
    
    // MARK: Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewTextField: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var viewRightButton: UIView!
    
    // MARK: Actions
    @IBAction func handleButtonRightImageAction(_ sender: Any) {
        imageRight.image = isTogleEye ? openEye : closedEye
        textField.isSecureTextEntry = !isTogleEye
        isTogleEye.toggle()
    }
    
    // MARK: Methods
    func setup(type: TextFieldType, title: String) {
        switch type {
        case .defaultType:
            setupDefaultType()
        case .securityType:
            setupSecurityType()
        }
        labelTitle.text = title
        labelError.textColor = .red
        labelError.font = UIFont.systemFont(ofSize: 12)
        setupViewTextField(state: .defaultState)
        update(state: .defaultState)
    }
    
    func update(state: TextFieldState, errorMessage: String = " ") {
        switch state {
        case .defaultState:
            labelError.text = " "
            viewTextField.layer.borderColor = UIColor.gray.cgColor
        case .errorState:
            labelError.text = errorMessage
            viewTextField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    private func setupDefaultType() {
        viewRightButton.isHidden = true
        textField.isSecureTextEntry = false
    }
    
    private func setupSecurityType() {
        imageRight.image = closedEye
        viewRightButton.isHidden = false
        textField.isSecureTextEntry = true
    }
    
    private func setupViewTextField(state: TextFieldState) {
        viewTextField.layer.borderWidth = 1
        viewTextField.layer.cornerRadius = 4
    }
}
