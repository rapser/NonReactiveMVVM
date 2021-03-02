//
//  ErrorType+Extensions.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import Foundation

protocol LocalizedError {
    var localizedDescription: String { get }
}
//extension Error: LocalizedError { }

//extension ErrorType {
//    func displayString() -> String {
//        if let error = self as? LocalizedError {
//            return error.localizedDescription
//        } else if let error = self as? CustomStringConvertible {
//            return error.description
//        }
//
//        /*
//         one of the two cases above will always be satisfied... this is just here to apease the compiler :(
//         a side effect of Apple making NSError conform to ErrorType - without a protocol such as LocalizedError
//         we are unable to make the compiler tell them apart (hence why the 'as' cast below just works)
//         */
//        return (self as NSError).description
//    }
//}
