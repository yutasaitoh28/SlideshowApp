//
//  SubViewController.swift
//  SlideshowApp
//
//  Created by Yuta Saitoh Jr. on 2021/01/23.
//  Copyright © 2021 yuta.saitoh. All rights reserved.
//

import Foundation
import UIKit
 
class SubViewController: UIViewController{
 
    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImg
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    @IBAction func toPrevious(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
