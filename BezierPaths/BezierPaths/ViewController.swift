//
//  ViewController.swift
//  BezierPaths
//
//  Created by Apple on 16/02/17.
//  Copyright © 2017 vijayvirSingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var viewTemp: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let string = "Medical App"
        
        lblName.text = string
        
        addBezierPath()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBezierPath()
    {
        
        //let pathDemo = CGPath(
        
        let yourPath: UIBezierPath = UIBezierPath()
        
        yourPath.move(to: CGPoint(x: 100.0 , y: 100.0 ))
        
        yourPath.addLine(to: CGPoint(x: 100.0 , y: 500 ))
        
        
        
        
        
        
        
        let junctionPoints = yourPath.cgPath.junctionPoints()
        
        
        
        print("junction points are: \(junctionPoints)")
        
        let yourShapeLayer: CAShapeLayer = CAShapeLayer()
        
        yourShapeLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:  self.view.frame.size.height)
        
        yourShapeLayer.path = yourPath.cgPath
        
        yourShapeLayer.fillColor = UIColor.clear.cgColor
        
        yourShapeLayer.strokeColor = UIColor.red.cgColor
        
        yourShapeLayer.lineWidth = 5.0
        
        self.view.layer.addSublayer(yourShapeLayer)
        
        yourShapeLayer.strokeStart = 0.0 // reset stroke start before animating
        
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        strokeAnimation.duration = 2.0
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.repeatCount = 110
        
        yourShapeLayer.add(strokeAnimation, forKey: "strokeAnimation")
        
    }
    
}
extension CGPath
{
    func junctionPoints() -> [CGPoint]
    {
        var bezierPoints = [CGPoint]()
        
        self.forEach(body: { (element: CGPathElement) in
            
            let numberOfPoints: Int =
                {
                switch element.type {
                case .moveToPoint, .addLineToPoint: // contains 1 point
                    return 1
                case .addQuadCurveToPoint: // contains 2 points
                    return 2
                case .addCurveToPoint: // contains 3 points
                    return 3
                case .closeSubpath:
                    return 0
                }
            }()
            for index in 0..<numberOfPoints
            {
                let point = element.points[index]
                
                bezierPoints.append(point)
            }
        })
        return bezierPoints
    }
    
    func forEach(body: @convention(block) (CGPathElement) -> Void)
    {
        typealias Body = @convention(block) (CGPathElement) -> Void

        
        func callback(info: UnsafeMutableRawPointer?, element: UnsafePointer<CGPathElement>)
        {
            let body = unsafeBitCast(info, to: Body.self)
            
            body(element.pointee)
        }
        let unsafeBody = unsafeBitCast(body, to: UnsafeMutableRawPointer.self)
        
        self.apply(info: unsafeBody, function: callback as CGPathApplierFunction)
    }
}
