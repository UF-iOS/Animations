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

    @IBOutlet weak var appleImageView: UIImageView!
    @IBOutlet weak var ufiosImageView: UIImageView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var appleImageHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var appleImageVerticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ufiosVerticalConstraint: NSLayoutConstraint!
    
    let animationView = LOTAnimationView(name: "appleDevicesLottie")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
     
        appleImageView.image = appleImageView.image?.withRenderingMode(.alwaysTemplate)
        appleImageView.tintColor = .white
        
        ufiosImageView.alpha = 0
        labelTop.alpha = 0
        labelBottom.alpha = 0
        continueButton.alpha = 0
        animationView.alpha = 0
        
        UIView.animate(withDuration: 2.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.view.backgroundColor = .white
            self.appleImageView.tintColor = .black
        }, completion: { (done) -> () in
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseOut], animations: {
                self.appleImageVerticalConstraint.constant = -90
                self.ufiosImageView.alpha = 1
                self.ufiosVerticalConstraint.constant = 50
                self.view.layoutIfNeeded()
            }, completion: { (done) -> () in
                UIView.animate(withDuration: 1, delay: 1.0, options: [.curveEaseOut], animations: {
                    self.appleImageView.alpha = 0
                    self.ufiosImageView.alpha = 0
                }, completion: { (done) -> () in
                    self.animationViewSetup()
                    UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
                        self.labelTop.alpha = 1
                        self.animationView.alpha = 1
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
        })
     
    }
    
    func animationViewSetup() {
        self.view.addSubview(self.animationView)
        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        
        self.animationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.animationView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        self.animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.animationView.heightAnchor.constraint(equalTo: self.animationView.widthAnchor).isActive = true
        
        self.animationView.autoReverseAnimation = true
        
        self.animationView.loopAnimation = true
        
        self.animationView.play()
    }

}

