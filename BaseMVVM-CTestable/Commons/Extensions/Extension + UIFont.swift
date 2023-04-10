//
//  Extension + UIFont.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 10/04/23.
//

import UIKit

extension UIFont {
    static func roboto(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontDefault: UIFont = .systemFont(ofSize: size, weight: weight)
        switch weight {
        case .regular:
            return UIFont(name: "Roboto-Regular", size: size) ?? fontDefault
        case .medium:
            return UIFont(name: "Roboto-Medium", size: size) ?? fontDefault
        case .bold:
            return UIFont(name: "Roboto-Bold", size: size) ?? fontDefault
        default:
            return fontDefault
        }
    }
}
