//
//  ViewController.swift
//  Minuteur
//
//  Created by Paul-Aurian POINOT on 11/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var compteur:Timer?
    var i:Int?

    @IBOutlet weak var compteurLabel: UILabel!
    
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        compteur?.invalidate()
        i = 0
        compteurLabel.text = "0"
    }
    
    @IBAction func pauseAction(_ sender: UIBarButtonItem) {
        compteur?.invalidate()
    }
    
    @IBAction func startTimerAction(_ sender: UIBarButtonItem) {
        compteur = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
            #selector(ViewController.incrementerCompteur), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compteur = Timer()
        i = 0
    }
    
    func incrementerCompteur() {
    
        i! += 1
        compteurLabel.text = "\(i!)"
    }


}

