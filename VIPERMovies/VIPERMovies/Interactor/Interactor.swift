//
//  Interactor.swift
//  VIPERMovies
//
//  Created by Cüneyd Gültekin Kaya on 30.01.2021.
//

import Foundation

class MovieInteractor: PresenterToInteractor {
    weak var presenter: InteractorToPresenter?
    
    var news: [MovieModel]?
    
    func fetchMovies() {
        
    }
}
