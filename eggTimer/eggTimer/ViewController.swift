//
//  ViewController.swift
//  eggTimer
//
//  Created by Paul-Aurian POINOT on 12/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    var pickerInfo: [String] = []
    var tempsCuisson: Int = 0
    var timer: Timer = Timer()
    var estActif:Bool = false
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    
    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Buttons
    @IBAction func activerMinuteurAction(_ sender: UIButton)
    {
        compteur()
    }
    
    @IBAction func resetMinuteurAction(_ sender: UIButton)
    {
        resetCompteur()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //dataSource & Delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerInfo = ["Œufs durs", "Œufs à la coque", "Œufs molets", "Œufs cocottes", "Œufs pochés", "Omelette Baveuse"]
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        alarme()
    }
    
    func selectionCuisson(selection: Int)
    {
        switch selection
        {
        case 0:
            tempsCuisson = 600
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 1:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 2:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 3:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 4:
            tempsCuisson = 240
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 5:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        default:
            print("Aucune sélection")
            break
        }
        activerMinuteurBtn.isEnabled = true
        activerMinuteurBtn.alpha = 1
        minuteurLabel.textColor = UIColor.black
    }
    
    func minuteurString(temps : Int) -> String
    {
        let heures = Int(temps) / 3600
        let minutes = Int(temps) / 60 % 60
        let secondes = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heures, minutes, secondes)
    }
    
    func compteur()
    {
        if (!estActif)
        {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decrementer), userInfo: nil, repeats: true)
            timer.fire()
            activerMinuteurBtn.setTitle("STOP", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
            estActif = true
        }
        else
        {
            timer.invalidate()
            activerMinuteurBtn.setTitle("Démarrer", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(self.view.tintColor, for: UIControlState.normal)
            estActif = false
        }
    }
    
    func decrementer()
    {
        if (tempsCuisson == 0)
        {
            timer.invalidate()
            minuteurLabel.text = "00:00:00"
            minuteurLabel.textColor = UIColor.green
            
            activerMinuteurBtn.setTitle("Démarrer", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(self.view.tintColor, for: UIControlState.normal)
            
            activerMinuteurBtn.isEnabled = false
            activerMinuteurBtn.alpha = 0.3
            
            lecteur.play()
        }
        else
        {
        tempsCuisson -= 1
        minuteurLabel.text = minuteurString(temps: tempsCuisson)
        }
    }
    
    func resetCompteur()
    {
        timer.invalidate()
        tempsCuisson = 0
        minuteurLabel.text = "00:00:00"
        activerMinuteurBtn.setTitle("Démarrer:", for: UIControlState.normal)
        activerMinuteurBtn.setTitleColor(self.view.tintColor, for: UIControlState.normal)
        estActif = false
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    //AVAudioPlayer
    func alarme()
    {
        let fichier = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        
        do
        {
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichier!)!)
        }
        catch
        {
            print("Erreur lecture fichier alarm !")
        }
    }
    
    //MARK - PickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerInfo[row]
    }
    
    //MARK - PickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectionCuisson(selection: row)
    }
    
}

