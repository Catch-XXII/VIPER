//
//  Presenter.swift
//  VIPERMovies
//
//  Created by Cüneyd Gültekin Kaya on 30.01.2021.
//

import Foundation

class MoviePresenter: ViewToPresenter {
    weak var view: PresenterToView?
    
    var interactor: PresenterToInteractor?
    
    var router: PresenterToRouter?
    
    func updateView() {
        //
    }
    
    func getMoviesCount() -> Int? {
        <#code#>
    }
    
    func getMovies(index: Int) -> MovieModel? {
        <#code#>
    }
    
    
}


extension MoviePresenter: InteractorToPresenter {
    func moviesFetched() {
        <#code#>
    }
    
    func moviesFetchedFailed() {
        <#code#>
    }
    
    
}
