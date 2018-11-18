//
//  ViewController.swift
//  pruebaRX
//
//  Created by test on 17/11/18.
//  Copyright © 2018 jsfenix. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewMain: UICollectionView!
    var list = NSDictionary()
    let disposeBag = DisposeBag()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.collectionViewMain.register(UINib(nibName: "MainCollectionViewCell", bundle: nil),                                     forCellWithReuseIdentifier: "Cell")
        
  
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                MainService.init().hardProcessingMain(completion: {[weak self] (transaction ) in
                    if let result = transaction{
                        print("Results \(result)")
                        self!.list = result
                        
                        self?.collectionViewMain.reloadData()
                    }
                })
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCollectionViewCell
        
       let data = self.list["data"]
        
        cell.item = ((data as! NSArray?)?[indexPath.row] as! NSDictionary?)
        return cell
    }
}
