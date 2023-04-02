//
//  BaseButtonView.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 28/03/23.
//

import UIKit

public final class BaseButtonView: UIView {
    // MARK: Properties
    var didHandleButton: (() -> Void)?
    
    // MARK: Outlets
    @IBOutlet private weak var viewContent: UIView!
    @IBOutlet private weak var labelTitle: UILabel!
    
    // MARK: Actions
    @IBAction func handleButtonAction(_ sender: Any) {
        didHandleButton?()
    }
    
    // MARK: Methods
    func setup(title: String,
               titleColor: UIColor = .black,
               backgroundColor: UIColor = .white) {
        labelTitle.text = title
        labelTitle.textColor = titleColor
        viewContent.backgroundColor = backgroundColor
        setupUI()
    }
    
    private func setupUI() {
        viewContent.layer.cornerRadius = 24
    }
}
