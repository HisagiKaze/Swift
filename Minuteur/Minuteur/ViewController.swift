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
        lecteur.stop()
        compteurLabel.textColor = UIColor.black
        jouerSon(son: "bip")
    }
    
    @IBAction func pauseAction(_ sender: UIBarButtonItem) {
        compteur?.invalidate()
        lecteur.pause()
    }
    
    @IBAction func startTimerAction(_ sender: UIBarButtonItem) {
        compteur = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
            #selector(ViewController.incrementerCompteur), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compteur = Timer()
        
        jouerSon(son: "bip")
    }
    
    func jouerSon(son:String) {
        let fichierSon = Bundle.main.path(forResource: son, ofType: "mp3")
        
        do {
            try lecteur = AVAudioPlayer(contentsOf: URL(string:fichierSon!)!)
        }
        catch {
            print("erreur lecture son")
        }
    }
    
    func incrementerCompteur() {
    
        let limite = 12
        
        if (i == limite) {
            jouerSon(son : "alarm")
            lecteur.play()
            compteurLabel.textColor = UIColor.red
        }
        else if (limite - i < 3) {
            compteurLabel.textColor = UIColor.orange
            i += 1
            lecteur.play()
        }
        else {
            i += 1
            lecteur.play()
        }
        
        compteurLabel.text = "\(i)"
        var timeStr:String?
        
        //Formater minutes-Secondes
        let minutes = i / 60 % 60
        let secondes = i % 60
        
        timeStr = String(format: "%02i:%02i", minutes, secondes)
        compteurLabel.text = timeStr
    }


}

