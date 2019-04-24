import UIKit

class EggView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clearColor()
    }

    override func drawRect(rect: CGRect) {
        //Egg Drawing
        //// Oval 1 Drawing
        let oval1Path = UIBezierPath()
      oval1Path.move(to: CGPoint(301.5, 366.35))
      oval1Path.addCurve(to: CGPoint(161.67, 536.5), controlPoint1: CGPoint(301.59, 460.27), controlPoint2: CGPoint(238.99, 536.45))
      oval1Path.addCurve(to: CGPoint(21.5, 366.54), controlPoint1: CGPoint(84.35, 536.55), controlPoint2: CGPoint(21.59, 460.46))
      oval1Path.addCurve(to: CGPoint(161.5, 161.5), controlPoint1: CGPoint(21.41, 272.62), controlPoint2: CGPoint(84.18, 161.55))
      oval1Path.addCurve(to: CGPoint(301.5, 366.35), controlPoint1: CGPoint(238.82, 161.45), controlPoint2: CGPoint(301.41, 272.43))
      oval1Path.close()
      UIColor.black.setStroke()
      oval1Path.lineWidth = 1
      oval1Path.stroke()
    
      // fill the path
      UIColor.redColor().set()
      path.fill()
    
        //Pentagon Drawing
        //let size = self.bounds.size
        //let h = size.height * 0.85      // adjust the multiplier to taste

        //// calculate the 5 points of the pentagon
        //let p1 = self.bounds.origin
        //let p2 = CGPoint(x:p1.x + size.width, y:p1.y)
        //let p3 = CGPoint(x:p2.x, y:p2.y + h)
        //let p4 = CGPoint(x:size.width/2, y:size.height)
        //let p5 = CGPoint(x:p1.x, y:h)

        //// create the path
        //let path = UIBezierPath()
        //path.moveToPoint(p1)
        //path.addLineToPoint(p2)
        //path.addLineToPoint(p3)
        //path.addLineToPoint(p4)
        //path.addLineToPoint(p5)
        //path.closePath()

        // fill the path
        UIColor.redColor().set()
        path.fill()
    }
}
