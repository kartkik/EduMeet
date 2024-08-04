//
//  ViewController.swift
//  Project
//
//  Created by MacOS on 09/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the frame of the redView to cover the bottom half of the screen
//        let screenHeight = view.frame.height
//        let screenWidth = view.frame.width
//        redView.frame = CGRect(x: 0, y: screenHeight / 2, width: screenWidth, height: screenHeight / 2)
//
//        addBottomRoundedEdge(to: redView, desiredCurve: 1.5)
//        roundCorners(to: redView, corners : [.bottomLeft, .bottomRight], radius : 200 )
    }
    
    
    
    
        func roundCorners(to view: UIView,corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            view.layer.mask = mask
        }
    

    func addBottomRoundedEdge(to view: UIView, desiredCurve: CGFloat) {
        let offset: CGFloat = view.frame.width / desiredCurve
        let bounds: CGRect = view.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        view.layer.mask = maskLayer
    }
}
