//
//  ViewController.swift
//  FirstApp
//
//  Created by Nicholas Outram on 22/12/2014.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    let messageArray : [String] = ["May the force be with you", "Live long and prosper", "To infinity and beyond", "Space is big. You just won't believe how vastly, hugely, mind- bogglingly big it is"]
    
    var index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doButtonTap(sender: AnyObject) {
        println("Button touched!")
        
        let nextString = self.messageArray[index]
        self.messageLabel.text = nextString
        index++
        index %= self.messageArray.count
    }

    @IBAction func doAnimate(sender: AnyObject) {
        
        let rotateRight = { self.messageLabel.transform = CGAffineTransformMakeRotation( 0.2) }
        let rotateLeft  = { self.messageLabel.transform = CGAffineTransformMakeRotation(-0.2) }
        let restore     = { self.messageLabel.transform = CGAffineTransformMakeRotation( 0.0) }
        let dt = 2.0/9.0
        
        UIView.animateKeyframesWithDuration(1.0, delay: 0.0, options:UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: dt, animations:rotateRight)
                UIView.addKeyframeWithRelativeStartTime(dt, relativeDuration: dt, animations:rotateLeft)

                UIView.addKeyframeWithRelativeStartTime(2.0*dt, relativeDuration: dt, animations:rotateRight)
                UIView.addKeyframeWithRelativeStartTime(3.0*dt, relativeDuration: dt, animations:rotateLeft)
                
                UIView.addKeyframeWithRelativeStartTime(4.0*dt, relativeDuration: dt/2.0, animations:restore)
            },
            completion: {
                (complete : Bool) in
                self.messageLabel.transform = CGAffineTransformIdentity }
        )
    
    }
}

