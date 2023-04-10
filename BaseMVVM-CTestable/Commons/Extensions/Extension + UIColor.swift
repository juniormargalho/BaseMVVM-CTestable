//
//  Extension + UIColor.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 03/04/23.
//

import UIKit

enum ColorBase {
    case baseBlack
    case baseError
    case baseGray300
    case baseGray600
    case baseGray800
    case basePrimary
    case baseSecondary
    case baseSuccess
    case baseTertiary
    case baseWhite
}

extension UIColor {
    static func baseColor(_ color: ColorBase) -> UIColor {
        let colorDefault: UIColor = .clear
        switch color {
        case .baseBlack:
            return UIColor(named: "baseBlack") ?? colorDefault
        case .baseError:
            return UIColor(named: "baseError") ?? colorDefault
        case .baseGray300:
            return UIColor(named: "baseGray300") ?? colorDefault
        case .baseGray600:
            return UIColor(named: "baseGray600") ?? colorDefault
        case .baseGray800:
            return UIColor(named: "baseGray800") ?? colorDefault
        case .basePrimary:
            return UIColor(named: "basePrimary") ?? colorDefault
        case .baseSecondary:
            return UIColor(named: "baseSecondary") ?? colorDefault
        case .baseSuccess:
            return UIColor(named: "baseSuccess") ?? colorDefault
        case .baseTertiary:
            return UIColor(named: "baseTertiary") ?? colorDefault
        case .baseWhite:
            return UIColor(named: "baseWhite") ?? colorDefault
        }
    }
}
