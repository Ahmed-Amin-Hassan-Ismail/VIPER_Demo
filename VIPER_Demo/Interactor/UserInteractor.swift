//
//  UserInteractor.swift
//  VIPER_Demo
//
//  Created by Ahmed Amin on 22/08/2022.
//

import Foundation

/*
 Interactor :-
 - Object
 - It contains Protocol
 - Take reference to Presenter
 */

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set}
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(.failed))
                return
            }
            
            do {
                let usersResponse = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(usersResponse))
                
            } catch {
                print("Error Location", error.localizedDescription)
                self?.presenter?.interactorDidFetchUsers(with: .failure(.failed))
            }

            
        }
        
        task.resume()
                
    }
}
