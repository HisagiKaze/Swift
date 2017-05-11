//
//  ViewController.swift
//  Minuteur
//
//  Created by Paul-Aurian POINOT on 11/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var compteur:Timer?
    var i:Int = 0
    var lecteur:AVAudioPlayer = AVAudioPlayer()

    @IBOutlet weak var compteurLabel: UILabel!
    
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        compteur?.invalidate()
        i = 0
        compteurLabel.text = "00:00"
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
        let fichierSon = Bundle.main.path(forResource: "bip", ofType: "mp3")
    }
    
    func incrementerCompteur() {
    
        i += 1
        compteurLabel.text = "\(i)"
        var timeStr:String?
        
        let minutes = i / 60 % 60
        let secondes = i % 60
        
        timeStr = String(format: "%02i:%02i", minutes, secondes)
        compteurLabel.text = timeStr
    }


}

