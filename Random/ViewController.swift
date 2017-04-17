//
//  ViewController.swift
//  Random
//
//  Created by Nicolas BOSTE on 4/17/17.
//  Copyright © 2017 Nicolas BOSTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var minValLabel: UILabel!
    @IBOutlet weak var maxValLabel: UILabel!
    @IBOutlet weak var minVal: UITextField!
    @IBOutlet weak var maxVal: UITextField!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var drawsVal: UITextField!
    @IBOutlet weak var drawsSlider: UISlider!
    @IBOutlet weak var minSliderLabel: UILabel!
    @IBOutlet weak var maxSliderLabel: UILabel!
    @IBOutlet weak var gobutton: UIButton!

    
    @IBAction func minValEdit(_ sender: UITextField) {
        updateDisplay()
    }
    
    @IBAction func maxValEdit(_ sender: UITextField) {
        updateDisplay()
    }
    
    @IBAction func drawsValChanged(_ sender: UITextField) {
        if let val :Int = Int(drawsVal.text!){
            drawsSlider.value = Float(val)
        }
    }
    
    @IBAction func sliderValChanged(_ sender: UISlider) {
        drawsVal.text =  "\(Int(drawsSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        TitleLabel.text = "Random numbers \n GENERATOR"
        
        minValLabel.text = "Min"
        minVal.text = "1"
        
        maxValLabel.text = "Max"
        maxVal.text = "100"
        
        drawsLabel.text = "Draws"
        minSliderLabel.text = "1"
        maxSliderLabel.text = ""
        drawsSlider.minimumValue = 1
        
        TitleLabel.center.x = self.view.center.x
        
        gobutton.center.x = self.view.center.x
        
        drawsVal.center.x = self.view.center.x
        drawsLabel.center.x = self.view.center.x / 3
        drawsLabel.center.y = drawsVal.center.y
        drawsSlider.center.x = self.view.center.x
        minSliderLabel.center.x = self.view.center.x
        maxSliderLabel.center.x = self.view.center.x
        
        minValLabel.center.x = self.view.center.x / 2
        minVal.center.x = self.view.center.x / 2
        
        maxValLabel.center.x = self.view.center.x / 2 + self.view.center.x
        maxVal.center.x = self.view.center.x / 2 + self.view.center.x
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateDisplay()    {
        if let min :Int = Int(minVal.text!), let max :Int = Int(maxVal.text!) {
            maxSliderLabel.text = "\(max - min + 1)"
            drawsSlider.maximumValue = Float(max - min + 1)
            drawsSlider.minimumValue = 1
            drawsSlider.value = 1
            drawsVal.text = "1"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DrawController {
            dest.min = Int(minVal.text!)
            dest.max = Int(maxVal.text!)
            dest.draws = Int(drawsVal.text!)
        }
    }
}

