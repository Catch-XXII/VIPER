//
//  MovieResponse.swift
//  VIPERMovies
//
//  Created by Cüneyd Gültekin Kaya on 30.01.2021.
//

import Foundation

struct MovieResponse<T: Codable>: Codable {
    var isSuccess: Bool
    var message: String
    var error: ErrorModel {
        return ErrorModel(message)
    }
    var rawData: Data?
    var data: T?
    var json: String? {
        guard let rawData = rawData else {return nil}
        return String(data: rawData, encoding: .utf8)
    }
    var request: MovieModel?
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        isSuccess = (try? keyedContainer.decodeIfPresent(Bool.self, forKey: .isSuccess)) ?? false
        message = (try? keyedContainer.decodeIfPresent(String.self, forKey: .message)) ?? ""
        data = try? keyedContainer.decode(T.self, forKey: .data)
    }
    
}

extension MovieResponse {

    private enum CodingKeys: String, CodingKey {
        case isSuccess
        case message
        case data
    }
}

class ErrorModel: Error {
    
    // MARK: - Properties
    var messageKey: String
    var message: String {
        return messageKey.localized()
    }
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

// MARK: - Public Functions
extension ErrorModel {
    
    class func generalError() -> ErrorModel {
        return ErrorModel(ErrorKey.general.rawValue)
    }
}


enum ErrorKey: String {
    case general = "Error_general"
    case parsing = "Error_parsing"
}

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
