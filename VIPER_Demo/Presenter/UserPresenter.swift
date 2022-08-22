//
//  UserPresenter.swift
//  VIPER_Demo
//
//  Created by Ahmed Amin on 22/08/2022.
//

import Foundation

/*
 Presenter :-
 - Object
 - It contains Protocol
 - Take reference to Interacor, Router, View
 */


protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result <[User], FetchError>)
    
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    
    func interactorDidFetchUsers(with result: Result<[User], FetchError>) {
        
        switch result {
            
        case .success(let uesrs):
            self.view?.update(with: uesrs)
            
        case .failure(_):
            self.view?.update(with: "Somthing went wrong")
        }
    }
    
    
    
    
}
