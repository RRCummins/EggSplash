//
//  ViewController.swift
//  EggSplash
//
//  Created by Ryan Cummins on 4/20/19.
//  Copyright © 2019 Them Rhinos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var maskingView: CanvasView!
  @IBOutlet weak var eggCanvasView: CanvasView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    super.viewDidLayoutSubviews()
    maskLayerWith(inputView: eggCanvasView, shape: .Egg)
    
    // Do any additional setup after loading the view.
  }
  
  enum ShapeType {
    case Rectangle
    case Circle
    case Triangle
    case Pentagon
    case Egg
    case All
  }
  
  // A function which will pick a mask to apply based on the enum thus passed. Remember that All will imply to apply all masks
  func maskLayerWith(inputView:CanvasView, shape: ShapeType) {
    let finalPath = UIBezierPath(rect: inputView.bounds)
    let maskLayer = CAShapeLayer()
    maskLayer.frame = inputView.bounds
    
    if (shape == .Rectangle) {
      finalPath.append(self.rectanglePath())
    } else if (shape == .Circle) {
      finalPath.append(self.circlePath())
    } else if (shape == .Triangle) {
      finalPath.append(self.trianglePath())
    } else if (shape == .Pentagon) {
      finalPath.append(self.pentagonPath())
    } else if (shape == .Egg) {
      finalPath.append(self.eggPath())
    } else if (shape == .All) {
      finalPath.append(self.rectanglePath())
      finalPath.append(self.circlePath())
      finalPath.append(self.trianglePath())
      finalPath.append(self.pentagonPath())
      finalPath.append(self.eggPath())
    }
    maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
    maskLayer.path = finalPath.cgPath
    inputView.layer.mask = maskLayer
  }
  
  func rectanglePath() -> UIBezierPath {
    let rect = CGRect(x: 250, y: 50, width: 100, height: 100)
    return UIBezierPath(rect: rect)
  }
  
  func circlePath() -> UIBezierPath {
    let radius: CGFloat = 50.0
    let rect = CGRect(x:100, y: 300, width: 2 * radius, height: 2 * radius)
    return UIBezierPath(ovalIn: rect)
  }
  
  func trianglePath() -> UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.move(to: CGPoint(x: view.frame.size.width/2, y: 400))
    trianglePath.addLine(to: CGPoint(x:100, y: 500))
    trianglePath.addLine(to: CGPoint(x: view.frame.size.width - 100, y: 500))
    trianglePath.close()
    return trianglePath
  }
  
  func pentagonPath() -> UIBezierPath {
    // Ref: https://developer.apple.com/library/content/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/BezierPaths/BezierPaths.html
    let pentagonPath = UIBezierPath()
    // Set the starting point of the shape.
    pentagonPath.move(to: CGPoint(x: 100, y: 70))
    pentagonPath.addLine(to: CGPoint(x: 200, y: 110))
    pentagonPath.addLine(to: CGPoint(x: 160, y: 210))
    pentagonPath.addLine(to: CGPoint(x: 40, y: 210))
    pentagonPath.addLine(to: CGPoint(x: 0, y: 110))
    pentagonPath.close()
    return pentagonPath
  }
  
  func eggPath() -> UIBezierPath {
    // Ref: https://developer.apple.com/library/content/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/BezierPaths/BezierPaths.html
    let eggPath = UIBezierPath()
    // Set the starting point of the shape.
    eggPath.move(to: CGPoint(301.5, 368.35))
    eggPath.addCurve(to: CGPoint(161.67, 538.5), controlPoint1: CGPoint(301.59, 462.27), controlPoint2: CGPoint(238.99, 538.45))
    eggPath.addCurve(to: CGPoint(21.5, 368.54), controlPoint1: CGPoint(84.35, 538.55), controlPoint2: CGPoint(21.59, 462.46))
    eggPath.addCurve(to: CGPoint(161.5, 163.5), controlPoint1: CGPoint(21.41, 274.62), controlPoint2: CGPoint(84.18, 163.55))
    eggPath.addCurve(to: CGPoint(301.5, 368.35), controlPoint1: CGPoint(238.82, 163.45), controlPoint2: CGPoint(301.41, 274.43))
    eggPath.close()
    UIColor.lightGray.setFill()
    eggPath.fill()
    UIColor.black.setStroke()
    eggPath.lineWidth = 1
    eggPath.stroke()
    return eggPath
  }


}

