//
//  ConverterViewController.swift
//  ConverterCalculator
//
//  Created by Clubb, Daniel J. (MU-Student) on 4/12/19.
//  Copyright © 2019 Clubb, Daniel J. (MU-Student). All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController
{
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converters: [Converter] =
    [
            Converter(label: "farenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
            Converter(label: "celcius to farenheit", inputUnit: "°C", outputUnit: "°F"),
            Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
            Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
    ]
    
    func changeConverter(to converter: Converter)
    {
        outputDisplay.text = converter.outputUnit
        inputDisplay.text = converter.inputUnit
    }
    
    @IBAction func converterTap(_ sender: Any)
    {
        let optionsList = UIAlertController(title: nil, message: "Choose Conversion", preferredStyle: .actionSheet)
        
        for converter in converters
        {
            let choice = UIAlertAction(title: converter.label, style: .default) { (UIAlertAction) -> Void in
                self.changeConverter(to: converter)
            }
            optionsList.addAction(choice)
        }
        
        self.present(optionsList, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeConverter(to: converters[0])
    }


}

