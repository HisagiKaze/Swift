//
//  ViewController.swift
//  eggTimer
//
//  Created by Paul-Aurian POINOT on 12/05/2017.
//  Copyright © 2017 Paul-Aurian POINOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerInfo: [String] = []

    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Buttons
    @IBAction func activerMinuteurAction(_ sender: UIButton) {
    }
    
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataSource & Delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        
        for i in 0...8 {
            let row = "option \(i)"
            pickerInfo.append(row)
        }
    }

    //MARK - PickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerInfo.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerInfo[row]
    }

}

