//
//  SessionManager.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 10/04/23.
//

import Foundation

final class SessionManager {
    // MARK: Properties
    static let shared = SessionManager()
    private(set) var hasSession: Bool = false
    
    enum KeysGeneral: String {
        case token = "keyGeneralToken"
    }
    
    enum KeysUser: String {
        case id = "keyUserId"
        case avatar = "keyUserAvatar"
        case email = "keyUserEmail"
    }

    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysGeneral.token.rawValue)
        }
        get {
            UserDefaults.standard.string(forKey: KeysGeneral.token.rawValue)
        }
    }
    
    var userId: Int? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysUser.id.rawValue)
        }
        get {
            UserDefaults.standard.integer(forKey: KeysUser.id.rawValue)
        }
    }
    
    var userAvatar: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysUser.avatar.rawValue)
        }
        get {
            UserDefaults.standard.string(forKey: KeysUser.avatar.rawValue)
        }
    }
    
    var userEmail: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysUser.email.rawValue)
        }
        get {
            UserDefaults.standard.string(forKey: KeysUser.email.rawValue)
        }
    }

    // MARK: Methods
    func startSession(with session: SessionModel) {
        if let user: UserModel = session.user {
            userId = user.id
            userAvatar = user.avatar
            userEmail = user.email
        }
        token = session.token
        hasSession = true
    }
    
    func endSession() {
        token = nil
        userId = nil
        userAvatar = nil
        hasSession = false
    }
}
