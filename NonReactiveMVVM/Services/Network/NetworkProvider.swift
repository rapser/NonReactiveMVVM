//
//  NetworkProvider.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import Foundation

class NetworkProvider: Network {
    
    //MARK: - Private
    let session: URLSession
    
    //MARK: - Lifecycle
    init(session: URLSession = URLSession.shared) {
        self.session = session
        
    }
    
    //MARK: - Public
    func makeRequest(request: NetworkRequest, success: @escaping ([String : Any]) -> Void, failure: @escaping (Error) -> Void) -> NetworkCancelable? {
        do {
            let request = try request.buildURLRequest()
            let task = self.session.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    
                    DispatchQueue.global(qos: .userInitiated).async {
                        failure(error ?? NetworkError.Unknown)
                    }
                    return
                }
                
                guard
                    let jsonOptional = try? JSONSerialization.jsonObject(with: data, options: []),
                    let json = jsonOptional as? [String: Any]
                    else {
                    
                        DispatchQueue.global(qos: .userInitiated).async {
                            failure(NetworkError.InvalidResponse)
                        }
                        return
                    }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    success(json)
                }
            }
            task.resume()
            return task
            
        } catch let error {
            failure(error)
            return nil
        }
    }
    
    func makeRequest(request: NetworkRequest, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) -> NetworkCancelable? {
        do {
            let request = try request.buildURLRequest()
            let task = self.session.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    DispatchQueue.global(qos: .userInitiated).async {
                        failure(error ?? NetworkError.Unknown)
                    }
                    return
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    success(data)
                }
            }
            task.resume()
            return task
            
        } catch let error {
            failure(error)
            return nil
        }
    }
}
