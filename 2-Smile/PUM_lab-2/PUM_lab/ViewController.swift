//
//  ViewController.swift
//
//  Created by Lab PUM on 30.09.2018.
//  Copyright © 2018 MM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, myDelegateProtocol {
    

    
    func myDelegateFunction(point: CGFloat) {
        face.smileCurve = point
        face.setNeedsDisplay()
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func exit(_ segue:UIStoryboardSegue){
        let source = segue.source as! ViewControllerRGB
        face.red = source.redColor
        face.green = source.greenColor
        face.blue = source.blueColor
        face.setNeedsDisplay()
        
    }
    
    @IBOutlet weak var face: FaceView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "idSmile"{
            let destination = segue.destination as! ViewControllerSmile
            destination.delegate = self
            destination.SmileValue = face.smileCurve
           
        }
        else if segue.identifier == "idRGB" {
            let destination = segue.destination as! ViewControllerRGB
            destination.redColor = face.red
            destination.greenColor = face.green
            destination.blueColor = face.blue
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        face.setNeedsDisplay()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

