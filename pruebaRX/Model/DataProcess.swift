//
//  DataProcess.swift
//  pruebaRX
//
//  Created by test on 17/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

// "client_id = 054ce59d3a17913
//  &client_secret = 890a02bd706bf72ad0b2010cb03e5b93542eb1a0"

import Foundation
struct DataProcess {
    
    static func processing(type: String, completionHandler: @escaping (_ tran: Data?)  -> Void) {
        
        let urlString =  type
        print(urlString)
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error)  in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler(nil)
            }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                completionHandler(data)
            }
        }).resume()
    }
}
