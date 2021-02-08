//
//  Protocols.swift
//  VIPERMovies
//
//  Created by Cüneyd Gültekin Kaya on 30.01.2021.
//

import Foundation
import UIKit

protocol ViewToPresenter: class {
    var view: PresenterToView? {get set}
    var interactor: PresenterToInteractor? {get set}
    var router: PresenterToRouter? {get set}
    
    func updateView()
    func getMoviesCount() -> Int?
    func getMovies(index: Int) -> MovieModel?
}

protocol InteractorToPresenter: class {
    func moviesFetched()
    func moviesFetchedFailed()
}

protocol PresenterToView: class {
    func showMovies()
    func showError()
}

protocol PresenterToInteractor: class {
    var presenter: InteractorToPresenter? {get set}
    var news: [MovieModel]? {get}
}

protocol PresenterToRouter: class {
    static func createModule() -> UIViewController
}
