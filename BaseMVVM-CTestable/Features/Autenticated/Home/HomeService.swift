//
//  HomeService.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 22/03/23.
//

import Foundation

public protocol HomeServiceProtocol {
    func fetchUser(completion: @escaping (Result<UserModel, Error>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    func fetchUser(completion: @escaping (Result<UserModel, Error>) -> Void) {
        let url = URL(string: "https://reqres.in/api/users/3")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode(UserResponseModel.self, from: data).data {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
}
