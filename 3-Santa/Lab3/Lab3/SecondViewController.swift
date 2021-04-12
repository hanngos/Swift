//
//  SecondViewController.swift
//  Lab3
//
//  Created by Student on 26/11/2020.
//  Copyright © 2020 pl.polsl.tm. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var timer: Timer? = nil
    var runCount = 0
    var isPaused = false
    var oneTapRecognizer: UITapGestureRecognizer!
    var twoTapRecognizer: UITapGestureRecognizer!
    var swipeRecognizer: UISwipeGestureRecognizer!

    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swipeRecognizer.direction = .right
        
        swipeRecognizer.numberOfTouchesRequired = 1
        
        view.addGestureRecognizer(swipeRecognizer)
        
        oneTapRecognizer.numberOfTouchesRequired = 1
        
        view.addGestureRecognizer(oneTapRecognizer)
        
        twoTapRecognizer.numberOfTouchesRequired = 2
        
        view.addGestureRecognizer(twoTapRecognizer)
        
        Label.text = "\(runCount)"
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        
        oneTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleOneTaps))
        
        twoTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTwoTaps))
        
    }

    @objc func handleSwipes(sender: UISwipeGestureRecognizer){
        
        if sender.direction == .right {
            timer?.invalidate()
            timer = nil
            runCount = 0
            Label.text = "\(runCount)"
        }
    }
    
    @objc func handleOneTaps(sender: UITapGestureRecognizer) {
        if(timer == nil || isPaused){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            isPaused = false
        }
    }
    
    @objc func handleTwoTaps(sender: UITapGestureRecognizer){
        timer?.invalidate()
        isPaused = true
    }
    
    @objc func fireTimer(){
        runCount += 1
        Label.text = "\(runCount)"
    }

}

