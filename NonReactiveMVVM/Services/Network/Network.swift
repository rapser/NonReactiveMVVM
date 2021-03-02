//
//  Network.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case Unknown
    case InvalidResponse
    
    var description: String {
        switch self {
        case .Unknown: return "An unknown error occurred"
        case .InvalidResponse: return "Received an invalid response"
        }
    }
}

protocol NetworkCancelable {
    func cancel()
}
extension URLSessionDataTask: NetworkCancelable { }

protocol Network {
    func makeRequest(request: NetworkRequest, success: @escaping ([String: Any]) -> Void, failure: @escaping (Error) -> Void) -> NetworkCancelable?
    func makeRequest(request: NetworkRequest, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) -> NetworkCancelable?
}
