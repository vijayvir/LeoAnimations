import UIKit
@IBDesignable
class IMYourDocLogo: UIView
{
    
    @IBInspectable var bkSuperColorT: UIColor = UIColor.orange
    
    @IBInspectable var bkColorT: UIColor = UIColor.gray
    
    @IBInspectable var bGSenderolorT: UIColor = UIColor.green
    
    @IBInspectable var bGpersonColorT: UIColor = UIColor.green
    
    @IBInspectable var personColorT: UIColor = UIColor.green
    
    @IBInspectable var personPatternSize: CGFloat = 40
    
    override func draw(_: CGRect)
    {
        
        // Set backGround Color
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(bkSuperColorT.cgColor)
        context!.fill(bounds)
        
        let unitDrawSize = CGSize(width: personPatternSize, height: personPatternSize)
        
        drawSenderAndReciver(context: context!, unitDrawSize: unitDrawSize)
        
    }
    
    func drawSenderAndReciver(context: CGContext, unitDrawSize: CGSize)
    {
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        context.saveGState()
        
        drawSender(context: context, unitDrawSize: CGSize(width: unitDrawSize.width * 0.65, height: unitDrawSize.height * 0.65))
        
        context.setBlendMode(CGBlendMode.color)
        
        drawSenderPAttern(context: context, unitDrawSize: CGSize(width: unitDrawSize.width * 0.60, height: unitDrawSize.height * 0.60))
        
        context.restoreGState()
        
        context.endTransparencyLayer()
        
    }
    
    func drawSender(context: CGContext, unitDrawSize: CGSize)
    {
        context.saveGState()
        context.setBlendMode(CGBlendMode.overlay)
        
        var path = UIBezierPath(roundedRect:
            CGRect(x: unitDrawSize.width * 0.0, y: unitDrawSize.height * 0.20, width: unitDrawSize.width * 0.80, height: unitDrawSize.height * 0.80)
            ,
            byRoundingCorners: [UIRectCorner.bottomRight, UIRectCorner.topRight, UIRectCorner.bottomLeft], cornerRadii: CGSize(width: unitDrawSize.width * 0.25, height: unitDrawSize.width * 0.25))
        
        let x1y1 = CGPoint(x: 0, y: 0)
        
        let x1y2 = CGPoint(x: 0, y: unitDrawSize.height * 0.01 + unitDrawSize.height * 0.20)
        
        let x2y1 = CGPoint(x: unitDrawSize.width * 0.25, y: 0)
        
        let x2y2 = CGPoint(x: unitDrawSize.width * 0.25, y: unitDrawSize.height * 0.01 + unitDrawSize.height * 0.20
        )
        
        path.move(to: x2y1)
        
        path.addLine(to: x2y2)
        
        path.addLine(to: x1y2)
        
        path.addCurve(to: x2y1, controlPoint1: x1y2, controlPoint2: x1y1)
        
        // path.addLineToPoint(x1y2)
        
        path.close()
        
        bGSenderolorT.setFill()
        
        path.fill()
        
        context.setBlendMode(CGBlendMode.overlay)
        
        context.restoreGState()
        
        context.saveGState()
        
        path = UIBezierPath(rect: CGRect(x: unitDrawSize.height * 0.1, y: unitDrawSize.height * 0.35, width: unitDrawSize.height * 0.50, height: unitDrawSize.height * 0.02))
        personColorT.setFill()
        path.fill()
        context.restoreGState()
        
        context.saveGState()
        
        path = UIBezierPath(rect: CGRect(x: unitDrawSize.height * 0.1, y: unitDrawSize.height * 0.45, width: unitDrawSize.height * 0.40, height: unitDrawSize.height * 0.02))
        personColorT.setFill()
        path.fill()
        context.restoreGState()
        
        context.saveGState()
        
        path = UIBezierPath(rect: CGRect(x: unitDrawSize.height * 0.1, y: unitDrawSize.height * 0.55, width: unitDrawSize.height * 0.50, height: unitDrawSize.height * 0.02))
        personColorT.setFill()
        path.fill()
        context.restoreGState()
        
        context.saveGState()
        path = UIBezierPath(rect: CGRect(x: unitDrawSize.height * 0.1, y: unitDrawSize.height * 0.65, width: unitDrawSize.height * 0.40, height: unitDrawSize.height * 0.02))
        personColorT.setFill()
        path.fill()
        context.restoreGState()
        
    }
    // DrawSender
    func drawSenderPAttern(context: CGContext, unitDrawSize: CGSize)
    {
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        context.saveGState()
        context.translateBy(x: unitDrawSize.width * 0.60, y: unitDrawSize.height * 0.60)
        
        createPerson(context: context, unitDrawSize: unitDrawSize)
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.fillPath()
        context.restoreGState()
        context.endTransparencyLayer()
    }
    func createPerson(context: CGContext, unitDrawSize: CGSize)
    {
        
        context.saveGState()
        let path = UIBezierPath(roundedRect: CGRect(x: unitDrawSize.width * 0.10, y: unitDrawSize.height * 0.10, width: unitDrawSize.width * 0.80, height: unitDrawSize.height * 0.80), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft], cornerRadii: CGSize(width: unitDrawSize.width * 0.25, height: unitDrawSize.width * 0.25))
        
        let x1y1 = CGPoint(x: unitDrawSize.height - unitDrawSize.height * 0.35, y: unitDrawSize.height - unitDrawSize.height * 0.10)
        let x1y2 = CGPoint(x: unitDrawSize.height - unitDrawSize.height * 0.35, y: unitDrawSize.height + unitDrawSize.height * 0.05)
        let x2y1 = CGPoint(x: unitDrawSize.height - unitDrawSize.height * 0.10, y: unitDrawSize.height - unitDrawSize.height * 0.10)
        let x2y2 = CGPoint(x: unitDrawSize.height - unitDrawSize.height * 0.10, y: unitDrawSize.height + unitDrawSize.height * 0.05)
        
        path.move(to: x1y1)
        path.addLine(to: x1y2)
        
        path.addCurve(to: x2y1, controlPoint1: x1y2, controlPoint2: x2y2)
        path.close()
        
        bGpersonColorT.setFill()
        path.fill()
        context.restoreGState()
        
        context.saveGState()
        
        UIGraphicsGetCurrentContext()
        
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        context.translateBy(x: unitDrawSize.height * 0.09, y: 0)
        
        context.saveGState()
        
        drawPersonPattern(context: context, size: CGSize(width: unitDrawSize.width - unitDrawSize.height * 0.25, height: unitDrawSize.height - unitDrawSize.height * 0.25))
        
        context.endTransparencyLayer()
        context.restoreGState()
        
    }
    
    func drawPersonPattern(context: CGContext, size: CGSize)
    {
        
        let unitDrawSize = size
        // •• Circle
        var path = UIBezierPath(arcCenter: CGPoint(x: unitDrawSize.width / 2, y: unitDrawSize.height * 0.31), radius: unitDrawSize.height * 0.15, startAngle: 0, endAngle: 2 * 3.14, clockwise: true)
        path.move(to:CGPoint(x: unitDrawSize.width * 0.16, y : unitDrawSize.height * 0.54))
        
        personColorT.setFill()
        path.fill()
        
        context.restoreGState()
        
        // •• body
        context.saveGState()
        path = UIBezierPath(roundedRect: CGRect(x: unitDrawSize.width * 0.16,y :  unitDrawSize.height * 0.50, width: unitDrawSize.width * 0.69, height:  unitDrawSize.height * 0.5), byRoundingCorners: [UIRectCorner.topRight, UIRectCorner.topLeft], cornerRadii: CGSize(width: unitDrawSize.width * 0.35, height: unitDrawSize.width * 0.25))
        
        personColorT.setFill()
        path.fill()
        
        context.restoreGState()
        
        // •• neck
        context.saveGState()
        path = UIBezierPath(arcCenter:  CGPoint(x: unitDrawSize.width / 2, y : unitDrawSize.height * 0.50), radius: unitDrawSize.height * 0.12, startAngle: 0, endAngle: -3.14, clockwise: true)
        
        path.lineWidth = unitDrawSize.width * 0.03
        bGpersonColorT.setStroke()
        path.stroke()
        
        context.restoreGState()
        
        // •• StatoScope
        context.saveGState()
        path.move(to:  CGPoint(x: unitDrawSize.width / 2, y: unitDrawSize.height * 0.50 + unitDrawSize.height * 0.12))
        path.addLine(to:  CGPoint(x: unitDrawSize.width / 2, y: unitDrawSize.height * 0.75))
        path.addLine(to: CGPoint(x: unitDrawSize.width * 0.65, y : unitDrawSize.height * 0.75))
        path.addArc(withCenter:  CGPoint(x: path.currentPoint.x + unitDrawSize.width * 0.0, y : path.currentPoint.y), radius: unitDrawSize.width * 0.02, startAngle: 0, endAngle: 2 * 3.14, clockwise: true)
        
        path.lineJoinStyle = .round
        path.miterLimit = unitDrawSize.width * 0.5
        path.lineWidth = unitDrawSize.width * 0.03
        bGpersonColorT.setStroke()
        path.stroke()
        
        context.restoreGState()
        
    }
}
