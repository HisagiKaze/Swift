//
//  ViewController.swift
//  eggTimer
//
//  Created by Paul-Aurian POINOT on 12/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    
    @IBOutlet weak var pickerViewCuisson: UIPickerView!
    
    //Buttons
    @IBAction func activerMinuteurAction(_ sender: UIButton) {
    }
    
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
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

