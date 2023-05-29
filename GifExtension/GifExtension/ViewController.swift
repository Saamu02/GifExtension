//
//  ViewController.swift
//  GifExtension
//
//  Created by Ussama Irfan on 29/05/2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let gifUrl = Bundle.main.url(forResource: "Image", withExtension: "gif") else { return }
            
        imageView.gifImage(gifURL: gifUrl, withAnimationDuration: 3.0)
    }
}

