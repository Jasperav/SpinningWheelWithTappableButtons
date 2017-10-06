//
//  SpinWheelWedgeLabel.swift
//  SpinWheelPractice
//
//  Created by Josh Henry on 5/18/17.
//  Copyright © 2017 Big Smash Software. All rights reserved.
//

import UIKit

class SpinWheelWedgeButton: TornadoButton {
    public func configureWedgeButton(index: UInt, width: CGFloat, position: CGPoint, radiansPerWedge: Radians) {
        self.frame = CGRect(x: 0, y: 0, width: width, height: 30)
        self.layer.anchorPoint = CGPoint(x: 2, y: 0.5)
        self.layer.position = position
        self.transform = CGAffineTransform(rotationAngle: radiansPerWedge * CGFloat(index) + CGFloat.pi + (radiansPerWedge / 2))
        self.backgroundColor = .green
        self.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
    }
    @IBAction func pressed(_ sender: TornadoButton){
        print("If you see this you won!")
    }
}

open class SpinWheelWedgeLabel: UILabel {
    
    private func setDefaultValues() {
        self.textColor = UIColor.white
        self.shadowColor = UIColor.black
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .center
    }
    
    public func configureWedgeLabel(index: UInt, width: CGFloat, position: CGPoint, radiansPerWedge: Radians) {
        self.frame = CGRect(x: 0, y: 0, width: width, height: 30)
        self.layer.anchorPoint = CGPoint(x: 1.1, y: 0.5)
        self.layer.position = position
        self.transform = CGAffineTransform(rotationAngle: radiansPerWedge * CGFloat(index) + CGFloat.pi + (radiansPerWedge / 2))
    
        setDefaultValues()
    }
    

    
}
