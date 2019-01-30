//
//  ViewController.swift
//  ufios-spring2019-1-animations-dev
//
//  Created by Siddha Tiwari on 1/29/19.
//  Copyright © 2019 Siddha Tiwari. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var ufiosImageView: UIImageView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var ufiosCenterY: NSLayoutConstraint!
    
    
    var animationView: LOTAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTop.alpha = 0
        labelBottom.alpha = 0
        continueButton.alpha = 0
        
        // For some reason, need to include this to prevent a weird transition from the launch screen to this screen.
        self.view.layoutSubviews()
        
        UIView.animate(withDuration: 2, delay: 1.0, options: [.curveEaseOut], animations: {
            self.ufiosCenterY.constant = -200
            self.view.layoutIfNeeded()
        }, completion: { (done) -> () in
            UIView.animate(withDuration: 1, delay: 1.0, options: [.curveEaseOut], animations: {
                self.ufiosImageView.alpha = 0
            }, completion: { (done) -> () in
                self.animationViewSetup()
                UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
                    self.labelTop.alpha = 1
                    self.animationView!.alpha = 1
                }, completion: { (done) -> () in
                    UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
                        self.labelBottom.alpha = 1
                    }, completion: { (done) -> () in
                        UIView.animate(withDuration: 1, delay: 1.0, options: [.curveEaseOut], animations: {
                            self.continueButton.alpha = 1
                        })
                    })
                })
            })
        })
     
    }
    
    func animationViewSetup() {
        self.animationView = LOTAnimationView(name: "appleDevicesLottie")
        
        self.animationView!.alpha = 0
        
        self.view.addSubview(self.animationView!)
        self.animationView!.translatesAutoresizingMaskIntoConstraints = false
        
        self.animationView!.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.animationView!.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        self.animationView!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.animationView!.heightAnchor.constraint(equalTo: self.animationView!.widthAnchor).isActive = true
        
        self.animationView!.autoReverseAnimation = true
        
        self.animationView!.loopAnimation = true
        
        self.animationView!.play()
    }

}

