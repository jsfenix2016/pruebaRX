//
//  CustomImageView.swift
//  pruebaRX
//
//  Created by test on 18/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
 let image = UIImage()


class CustomImageView: UIImageView {
    
    static let sharedInstance = CustomImageView()
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) -> UIImage  {
        let session = URLSession(configuration: .default)
        
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                         self.image = UIImage(data: imageData)
                        
                        //displaying the image
                        //self.imgCell.image = image
                        
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        return image!
    }
}

