//
//  Constants.swift
//  pruebaRX
//
//  Created by test on 18/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation
struct Constants {
    struct url {
        static let BaseApi: String = "https://api.imgur.com"
    }
    
    var responseMessages = [200: "OK",
                            403: "Access forbidden",
                            404: "File not found",
                            500: "Internal server error"]
    
    
    
    
}
