//
//  ViewControllerRGB.swift
//  PUM_lab
//
//  Created by Student on 18/11/2020.
//  Copyright © 2020 PS. All rights reserved.
//

import UIKit

class ViewControllerRGB: UIViewController {

    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    @IBAction func RedSlider(_ sender: UISlider) {
        redColor = CGFloat(sender.value)
    }
    
    
    @IBAction func GreenSlider(_ sender: UISlider) {
        greenColor = CGFloat(sender.value)
    }
    
    
    @IBAction func BlueSlider(_ sender: UISlider) {
        blueColor = CGFloat(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rSlider.value = Float(redColor)
        gSlider.value = Float(greenColor)
        bSlider.value = Float(blueColor)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
