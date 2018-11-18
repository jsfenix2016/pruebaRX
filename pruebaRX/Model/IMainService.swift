//
//  IMainService.swift
//  pruebaRX
//
//  Created by test on 17/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import Foundation
protocol IMainService {
    
    func hardProcessingMain(completion:@escaping (_ tran: NSDictionary?) -> Void)
}
