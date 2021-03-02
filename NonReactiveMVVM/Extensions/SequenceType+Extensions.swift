//
//  SequenceType+Extensions.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import Foundation

func random(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
}

//extension CollectionType where Self.Index == Int {
//    func randomElement() -> Self.Generator.Element {
//        let index = random(min: 0, max: self.count - 1)
//        return self[index]
//    }
//    subscript(safe safe: Self.Index) -> Generator.Element? {
//        guard self.indices.contains(safe) else { return nil }
//        return self[safe]
//    }
//}
