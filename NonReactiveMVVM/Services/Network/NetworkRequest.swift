//
//  NetworkRequest.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import Foundation

enum NetworkRequestError: Error, CustomStringConvertible {
    case InvalidURL(String)
    
    var description: String {
        switch self {
        case .InvalidURL(let url): return "The url '\(url)' was invalid"
        }
    }
}

struct NetworkRequest {
    //MARK: - HTTP Methods
    enum Method: String {
        case GET        = "GET"
        case PUT        = "PUT"
        case PATCH      = "PATCH"
        case POST       = "POST"
        case DELETE     = "DELETE"
    }
    
    //MARK: - Public Properties
    let method: NetworkRequest.Method
    let url: String
    
    //MARK: - Public Functions
    func buildURLRequest() throws -> URLRequest {
        guard let url = URL(string: self.url) else { throw NetworkRequestError.InvalidURL(self.url) }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        
        return request
    }
}
