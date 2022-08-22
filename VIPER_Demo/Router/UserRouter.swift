//
//  UserRouter.swift
//  VIPER_Demo
//
//  Created by Ahmed Amin on 22/08/2022.
//

import Foundation
import UIKit

/*
 Router :-
 - Object
 - It contains Protocol
 - Entry Point
 - refrerence to View
 */


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entity: EntryPoint? { get set }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    
    var entity: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign to View, Interactor, Presenter
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        router.entity = view as? EntryPoint
        
        return router
    }
}
