//
//  ViewControllerSmile.swift
//  PUM_lab
//
//  Created by Student on 18/11/2020.
//  Copyright © 2020 PS. All rights reserved.
//

import UIKit

protocol myDelegateProtocol: class {
    func myDelegateFunction(point: CGFloat)
}

class ViewControllerSmile: UIViewController {
    
    weak var delegate : myDelegateProtocol?
    var SmileValue: CGFloat = 0
    
    @IBOutlet weak var Slider: UISlider!
    
    @IBAction func SmileSlider(_ sender: UISlider) {
        SmileValue = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Slider.value = Float(SmileValue)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func exit(_ sender: Any) {
        
        delegate?.myDelegateFunction(point: SmileValue)
        
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
