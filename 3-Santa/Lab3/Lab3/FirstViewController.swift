//
//  FirstViewController.swift
//  Lab3
//
//  Created by Student on 26/11/2020.
//  Copyright © 2020 pl.polsl.tm. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func PanGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        if let view = sender.view{
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    @IBAction func PinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        sender.scale = 1
    }
    
    
    @IBAction func RotationGesture(_ sender: UIRotationGestureRecognizer) {
        
        sender.view!.transform = sender.view!.transform.rotated(by: sender.rotation)
        
        sender.rotation = 0}
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {return true}
    
}

