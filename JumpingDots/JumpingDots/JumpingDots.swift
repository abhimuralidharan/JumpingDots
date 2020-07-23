//
//  JumpingDots.swift
//  JumpingDots
//
//  Created by KM, Abhilash a on 23/07/20.
//  Copyright © 2020 abhilash. All rights reserved.
//


import Foundation
import UIKit


private class DotView: UIView
{
    var fillColor: UIColor = UIColor.black
    var diameter: CGFloat = CGFloat(1)

    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        self.fillColor.setFill()
        context?.addEllipse(in: (CGRect(x:0,y:  0,width:  diameter, height: diameter)))
        context?.fillPath()
        context?.strokePath()
    }
}


class DotsView: UIView
{
    var dotColors: [UIColor] = [.red, .red, .red]
    {
        didSet
        {
            buildView()
        }
    }


    var animationOffsetY: CGFloat
    {
        return frame.height/4
    }


    override init(frame: CGRect)
    {
        super.init(frame: frame)
        buildView()
    }


    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        buildView()
    }


    private func buildView()
    {
        self.layer.cornerRadius = 8

        for subview in self.subviews
        {
            subview.removeFromSuperview()
        }

        let numberDots = CGFloat(3)
        let dotDiameter = self.bounds.size.height/3
        let offsetX: CGFloat = dotDiameter
        let availableWidth = (self.bounds.size.width - offsetX*2)
        let centerToCenterX = (availableWidth - dotDiameter)/(numberDots-1)
        var frame = CGRect(x: offsetX, y: self.bounds.size.height/2 - dotDiameter/2, width: dotDiameter, height: dotDiameter)

        for _ in 0...Int(numberDots-1)
        {
            let dot = DotView(frame: frame)
            dot.diameter = frame.size.width

            dot.backgroundColor = UIColor.clear

            self.addSubview(dot)
            frame.origin.x = dot.frame.maxX + (centerToCenterX - dotDiameter)
        }
    }


    func startAnimating()
    {
        guard let subViews = self.subviews as? [DotView] else { return }
        var i:Int = 0
        for dot in subViews
        {
            dot.center = CGPoint(x: dot.center.x , y: bounds.height/2 + self.animationOffsetY)

            let delay = 0.1*Double(i)
            UIView.animate(withDuration:Double(0.5), delay:delay, options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.curveEaseOut.rawValue | UIView.AnimationOptions.repeat.rawValue | UIView.AnimationOptions.autoreverse.rawValue) , animations: { () -> Void in
                dot.center = CGPoint(x: dot.center.x , y: self.bounds.height/2 - self.animationOffsetY)
            }, completion: nil)

            i += 1
        }
    }


    func stopAnimating()
    {
        for dot in self.subviews as! [DotView]
        {
            dot.center.y = center.y
            dot.layer.removeAllAnimations()
        }
    }
}
