//
//  MainCollectionViewCell.swift
//  pruebaRX
//
//  Created by test on 17/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblComments: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    
    var item: NSDictionary!{
        didSet{
            guard let conversation = item else {
                return
            }
            
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData:NSData = NSData(contentsOf: URL(string: conversation["link"] as! String)!)!
                let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
              
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    self.imgCell.image = image
                    let text = conversation["description"] ?? ""
                    self.lblComments?.text = " \(text)"
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


