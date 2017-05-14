//
//  ViewController.swift
//  tipCalculator
//
//  Created by Paul-Aurian POINOT on 14/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var PourcentagePourboire: Int?
    
    @IBOutlet weak var montantFactureTextField: UITextField!
    
    @IBOutlet weak var PourboireSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var pourboireLabel: UILabel!
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PourboireSegmentedControl.addTarget(self, action: #selector(ViewController.calculerPourcentage), for: UIControlEvents.valueChanged)
        
        montantFactureTextField.delegate = self
        montantFactureTextField.becomeFirstResponder()
    }
    
    func calculerPourcentage()
    {
        switch PourboireSegmentedControl.selectedSegmentIndex
        {
        case 0:
            print("segment selectionné : \(PourboireSegmentedControl.selectedSegmentIndex)")
            PourcentagePourboire = 15
            break
            
        case 1:
            print("segment selectionné : \(PourboireSegmentedControl.selectedSegmentIndex)")
            PourcentagePourboire = 20
            break
        case 2:
            print("segment selectionné : \(PourboireSegmentedControl.selectedSegmentIndex)")
            PourcentagePourboire = 25
            break
        default:
            print("Pas de sélection")
        }
            calculerPourBoire(pourcent: Float(PourcentagePourboire!))
    }
    
    func calculerPourBoire(pourcent:Float)
    {
        let pourboire = Float(montantFactureTextField.text!)! * pourcent / 100
        let montant = Float(montantFactureTextField.text!)
        let pourboireFormatStr = NSString(format: "%.2f", pourboire)
        let montantTotalFormatStr = NSString(format: "%.2f", pourboire + montant!)
        
        pourboireLabel.text = "€ \(pourboireFormatStr)"
        montantTotalLabel.text = "€ \(montantTotalFormatStr )"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        montantFactureTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

