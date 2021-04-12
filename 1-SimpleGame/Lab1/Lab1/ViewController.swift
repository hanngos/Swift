//
//  ViewController.swift
//  Lab1
//
//  Created by Student on 22.10.2020.
//  Copyright © 2020 TM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var LabelWylosowanaLiczba: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label100: UILabel!
    @IBOutlet weak var LabelPunkty: UILabel!
    @IBOutlet weak var LabelNapisPunkty: UILabel!
    @IBOutlet weak var LabelNapisRunda: UILabel!
    @IBOutlet weak var LabelRunda: UILabel!
        @IBOutlet weak var Slider: UISlider!

    var WylosowanaLiczba=0
    var Runda = 1
    var Punkty = 0
    var WybranaLiczba = 50

    func nowaGra(){
        Punkty = 0
        Runda = 1
    }
    
    func update(){
        LabelPunkty.text=String(Punkty)
        LabelRunda.text=String(Runda)
        WylosowanaLiczba=Int.random(in: 1...100)
        LabelWylosowanaLiczba.text=String(WylosowanaLiczba)
    }
    
    @IBAction func akcjaSlidera(_ sender: UISlider) {
        WybranaLiczba = Int(sender.value)
    }
    
     @IBAction func obslugaSprawdz(_ sender: UIButton) {
        
        let pkty = 100 - abs(WylosowanaLiczba-WybranaLiczba)
        Punkty += pkty
        
        let alert = UIAlertController(title: "+" + String(pkty), message: "Twoje punkty: " + String(Punkty), preferredStyle: .alert)
       
        let action = UIAlertAction(title: "Graj", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated:true, completion:nil)
        
        Runda += 1
        if (Runda == 11) {nowaGra()}
        
        update()
    }
    
    @IBAction func obslugaReset(_ sender: UIButton) {
        nowaGra()
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }

}

