//
//  ViewController.swift
//  gallerieImage
//
//  Created by Paul-Aurian POINOT on 11/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images:[String] = ["lion.png", "canyon.png", "concert.png", "esb.png", "sommet.png", "voiture.png"]
    var index = 1
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func changerImageAction(_ sender: UIButton) {
        
        
        if(index == images.count - 1) {
            index = 0
        }
        else {
            index = index + 1
        }
        let imageStr:String = images[index]
        
        image.image = UIImage(named: imageStr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

