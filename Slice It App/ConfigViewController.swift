//
//  CamViewController.swift
//  Slice It App
//
//  Created by jngrt on 26/04/15.
//  Copyright (c) 2015 jngrt. All rights reserved.
//

import Foundation
import UIKit

class ConfigViewController : UIViewController {

    @IBOutlet weak var minusButton: PushButtonView!
    @IBOutlet weak var plusButton: PushButtonView!
    
    @IBOutlet weak var sliceButton: UIButton!
    
    /*@IBAction func stepperValueChanged(sender: UIStepper) {
        valueLabel.text = Int(sender.value).description
        Settings.sliceCount = Int(sender.value)
        wiredPieView.sliceCount = Int(sender.value)
    }*/
    @IBOutlet weak var wiredPieView: WiredPieView!
    //@IBOutlet weak var valueStepper: UIStepper!

    @IBOutlet weak var valueLabel: UILabel!
    

    override func viewDidLoad() {
        setSliceCount( 7 )
        
        sliceButton.layer.cornerRadius = 15
        sliceButton.layer.borderColor = UIColor.whiteColor().CGColor
        sliceButton.layer.borderWidth = 1.0
        //sliceButton.layoutMargins = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        sliceButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    }
    
    func setSliceCount( count : Int ) {
        Settings.sliceCount = count
        if ( wiredPieView != nil ) {
            wiredPieView.sliceCount = count
        }
        valueLabel.text = count.description
    }
    
    @IBAction func btnPushButton( button:PushButtonView ){
        if button.isAddButton {
            setSliceCount( ++Settings.sliceCount )
        } else {
            setSliceCount( max( 2, --Settings.sliceCount) )
        }
    }

}