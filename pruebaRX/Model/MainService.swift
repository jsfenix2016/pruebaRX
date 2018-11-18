//
//  MainService.swift
//  pruebaRX
//
//  Created by test on 17/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation

class MainService: IMainService {
    
    func hardProcessingMain(completion:@escaping (_ tran: NSDictionary?) -> Void){
        
        let getURL = URL(string: Constants.url.BaseApi + "/3/account/me/images")!
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        getRequest.httpMethod = "GET"
        getRequest.setValue("Bearer e492e7d1bd3b9bb0f83cbea993ba9253e1f3980e", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil { print("GET Request: Communication error: \(error!)")
                completion(nil)
            }
            if data != nil {
                do {
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    
                    DispatchQueue.main.async(execute: {
                       
                        completion( resultObject)
                    })
                } catch {
                    DispatchQueue.main.async(execute: {
                        print("Unable to parse JSON response")
                    })
                }
            } else {
                DispatchQueue.main.async(execute: {
                    print("Received empty response.")
                })
            }
        }).resume()
    }
}
