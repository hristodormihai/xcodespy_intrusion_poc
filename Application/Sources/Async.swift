//
//  Async.swift
//  Test
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import Foundation

func mySampleAysncMethod(delay: Int = 1,
                         response: String,
                         completion: @escaping ((String) -> Void)) {

    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(delay)) {
        completion(response)
    }
}
