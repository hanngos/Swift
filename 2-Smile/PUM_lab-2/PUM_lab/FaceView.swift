//
//  FaceView.swift
//
//  Created by Lab PUM on 30.09.2018.
//  Copyright © 2018 MM. All rights reserved.
//


    
import UIKit

class FaceView: UIView {
    
    var red:CGFloat = 0.12
    var green:CGFloat = 0.64
    var blue:CGFloat = 1
    var smileCurve: CGFloat = 50
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let bounds:CGRect = self.bounds
        
        var midPoint=CGPoint() // center of our bounds in our coordinate system
        midPoint.x = bounds.origin.x + bounds.size.width/2
        midPoint.y = bounds.origin.y + bounds.size.height/2
        
        
        var point=CGPoint()
        point.x = midPoint.x
        point.y = midPoint.y
        
        
        
        let path:UIBezierPath=UIBezierPath()
        path.addArc(withCenter: point, radius: 110, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path.lineWidth=10
        let color = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: alpha)
        color.setFill()
        path.stroke()
        path.fill()
        
        var point1=CGPoint()
        point1.x = midPoint.x - 45
        point1.y = midPoint.y - 35
        
        let path1:UIBezierPath=UIBezierPath()
        path1.addArc(withCenter: point1, radius: 15, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        UIColor.white.setFill()
        path1.lineWidth=10
        path1.stroke()
        path1.fill()
        
        var point2=CGPoint()
        point2.x = midPoint.x + 45
        point2.y = midPoint.y - 35
        
        let path2:UIBezierPath=UIBezierPath()
        path2.addArc(withCenter: point2, radius: 15, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        UIColor.white.setFill()
        path2.lineWidth=10
        path2.stroke()
        path2.fill()
        
        
        var point3=CGPoint()
        point3.x = midPoint.x - 45
        point3.y = midPoint.y + 25
        
        var point4=CGPoint()
        point4.x = midPoint.x + 45
        point4.y = midPoint.y + 25
        
        var point5=CGPoint()
        point5.x = midPoint.x
        point5.y = midPoint.y + 25 + smileCurve
        
        let path3:UIBezierPath=UIBezierPath()
        path3.move(to: point3)
        path3.addQuadCurve(to: point4, controlPoint: point5)
        path3.lineWidth=7
        path3.stroke()
        
    }
    
    
}
