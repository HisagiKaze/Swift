//
//  ViewController.swift
//  NavToolBar
//
//  Created by Paul-Aurian POINOT on 11/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var compte:Int?
    
    @IBOutlet weak var compteurLabel: UILabel!
    
    @IBAction func incrementer(_ sender: UIBarButtonItem) {
        compte! += 1
        compteurLabel.text = "\(compte!)"
    }
    
    @IBAction func decrementer(_ sender: UIBarButtonItem) {
        compte! -= 1
        compteurLabel.text = "\(compte!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        compte = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

