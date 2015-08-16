//
//  IntroViewController.swift
//  Slice It App
//
//  Created by jngrt on 14/08/15.
//  Copyright (c) 2015 jngrt. All rights reserved.
//

import Foundation
import UIKit

class IntroViewController : UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!

   
    
    var labelAnims = [LabelAnim]()
    var animConfigs = [
        AnimConfig( delay: 0.1, duration: 0.4),
        AnimConfig( delay: 0.3, duration: 0.4),
        AnimConfig( delay: 1.3, duration: 0.35),
        AnimConfig( delay: 1.5, duration: 0.3),
        AnimConfig( delay: 2.0, duration: 0.2)

    ]
    
    override func viewDidLoad() {
        
        //
        // Gradient background
        //
        let colors = Colors()
        view.backgroundColor = UIColor.clearColor()
        var backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        
        //
        // Init labels
        //
        var labels = [label1, label2, label3, label4, label5]
        for i in 0..<labels.count {
            labelAnims.append( LabelAnim( label: labels[i], parent: view, config: animConfigs[i] ))
        }
    }
}

struct AnimConfig {
    var delay : Double
    var duration : Double
}

struct LabelAnim {
    var label : UILabel
    var start : CGRect
    var end : CGRect
    var delay : Double
    var duration : Double
    
    init (  label: UILabel, parent : UIView, config: AnimConfig ) {
        //
        // Set properties
        //
        self.label = label
        var size = CGSize( width: parent.frame.width, height: 50.0 )
        var origin = CGPoint( x: 0, y: parent.frame.height )
        var target = CGPoint( x: 0, y: label.frame.origin.y )//config.y )
        start = CGRect ( origin: origin, size: size )
        end = CGRect ( origin: target, size: size )
        delay = config.delay
        duration = config.duration
        
        //
        // Init label
        //
        label.setTranslatesAutoresizingMaskIntoConstraints(true)
        label.frame = start
        
        //
        // Start anim
        //
        animate()
    }
    
    func animate () {
        let options = UIViewAnimationOptions.CurveEaseOut
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            //
            // Animate to this value
            //
            self.label.frame = self.end
        }, completion: { finished in
                    
        })
    }
}

//
// Background gradient helper
//
class Colors {
    //F4EAD5
    let colorTop = UIColor(red: 0xF4/255.0, green: 0xEA/255.0, blue: 0xD5/255.0, alpha: 1.0).CGColor
    //C6E5D9
    let colorBottom = UIColor(red: 0xC6/255.0, green: 0xE5/255.0, blue: 0xD9/255.0, alpha: 1.0).CGColor
    
    let gl: CAGradientLayer
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}