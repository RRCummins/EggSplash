//
//  Canvas.swift
//  EggSplash
//
//  Created by Ryan Cummins on 4/20/19.
//  Copyright © 2019 Them Rhinos. All rights reserved.
//

import UIKit

@IBDesignable
class CanvasView: UIView {
  
  var lineColor: UIColor!
  var lineWidth: CGFloat!
  var path: UIBezierPath!
  var touchPoint: CGPoint!
  var startingPoint:CGPoint!
  
  let oval1Path = UIBezierPath()
  
  override func layoutSubviews() {
    
    self.clipsToBounds = true
    self.isMultipleTouchEnabled = false
    
    lineColor = UIColor.gray
    lineWidth = 10
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    startingPoint = touch?.location(in: self)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    touchPoint = touch?.location(in: self) ?? startingPoint
    
    path = UIBezierPath()
    path.move(to: startingPoint)
    path.addLine(to: touchPoint)
    startingPoint = touchPoint
    
    drawShapeLayer()
    
  }
  
  func drawShapeLayer() {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.lineCap = CAShapeLayerLineCap.round
    self.layer.addSublayer(shapeLayer)
    self.setNeedsDisplay()
  }
  
  func clearCanvas() {
    path.removeAllPoints()
    self.layer.sublayers = nil
    self.setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    //// Oval 1 Drawing
    
    oval1Path.move(to: CGPoint(301.5, 366.35))
    oval1Path.addCurve(to: CGPoint(161.67, 536.5), controlPoint1: CGPoint(301.59, 460.27), controlPoint2: CGPoint(238.99, 536.45))
    oval1Path.addCurve(to: CGPoint(21.5, 366.54), controlPoint1: CGPoint(84.35, 536.55), controlPoint2: CGPoint(21.59, 460.46))
    oval1Path.addCurve(to: CGPoint(161.5, 161.5), controlPoint1: CGPoint(21.41, 272.62), controlPoint2: CGPoint(84.18, 161.55))
    oval1Path.addCurve(to: CGPoint(301.5, 366.35), controlPoint1: CGPoint(238.82, 161.45), controlPoint2: CGPoint(301.41, 272.43))
    oval1Path.close()
    UIColor.black.setStroke()
    oval1Path.lineWidth = 1
    oval1Path.stroke()
    

  }

  
  

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  
  
}

// These replace CGPoint
extension CGRect{
  init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
    self.init(x:x,y:y,width:width,height:height)
  }
  
}
extension CGSize{
  init(_ width:CGFloat,_ height:CGFloat) {
    self.init(width:width,height:height)
  }
}
extension CGPoint{
  init(_ x:CGFloat,_ y:CGFloat) {
    self.init(x:x,y:y)
  }
}
