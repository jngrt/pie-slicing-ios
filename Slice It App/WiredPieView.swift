//
//  WiredPieView.swift
//  Slice It App
//
//  Created by jngrt on 27/04/15.
//  Copyright (c) 2015 jngrt. All rights reserved.
//

import UIKit
import Darwin


@IBDesignable
class WiredPieView: UIView {

    let dashes : Array<CGFloat> = [4.0, 2.0]
   
    var sliceCount: Int = 8 {
        didSet {
            //drawSlices()
            println("slices = \(sliceCount)")
            setNeedsDisplay()
        }
    }
        
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        var path = UIBezierPath(ovalInRect: rect.rectByInsetting(dx: 1.0, dy: 1.0))
        UIColor.whiteColor().setStroke()
       
        //path.setLineDash( dashes, count: 2, phase: 0 )
        path.stroke()

        for i in 0..<sliceCount {
            var degrees = CGFloat(i * (360/sliceCount))
        
            //set up the width and height variables
            //for the horizontal stroke
            let plusHeight: CGFloat = 3.0
            let plusWidth: CGFloat = min(bounds.width - 1, bounds.height - 1)
            
            
            //create the path
            var plusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            ///plusPath.lineWidth = plusHeight
            
            
            let radius = plusWidth / 2
            let radians = degrees * CGFloat(M_PI / 180.0)
            let endX = bounds.width/2 + radius * cos(radians)
            let endY = bounds.height/2 + radius * sin(radians)
            let startX = bounds.width/2 + 2 * cos(radians)
            let startY = bounds.height/2 + 2 * sin(radians)
            
            //move the initial point of the path
            //to the start of the horizontal stroke
            plusPath.moveToPoint(CGPoint( x: startX, y: startY ))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint( x: endX, y: endY))
            
            //set the stroke color
            UIColor.whiteColor().setStroke()
            plusPath.setLineDash( dashes, count: 2, phase: 0 )
            
            //draw the stroke
            plusPath.stroke()
        }
    }

}
