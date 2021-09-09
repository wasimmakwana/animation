//
//  ViewController.swift
//  AnimationDemo
//
//  Created by  on 09/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var heightConstFirstView : NSLayoutConstraint!
    @IBOutlet var heightConstSecondView : NSLayoutConstraint!
    @IBOutlet var heightConstThirdView : NSLayoutConstraint!
    
    @IBOutlet weak var firstView : UIView!
    @IBOutlet weak var secondView : UIView!
    @IBOutlet weak var thirdView : UIView!
    
    var currentVc = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadViews()
    }
    
    func reloadViews()
    {
        if currentVc == 0 {
            heightConstFirstView.isActive = false
            heightConstSecondView.isActive = false
            heightConstThirdView.isActive = false
        } else if currentVc == 1 {
            heightConstFirstView.isActive = true
            heightConstSecondView.isActive = false
            heightConstThirdView.isActive = false
        } else if currentVc == 2 {
            heightConstFirstView.isActive = true
            heightConstSecondView.isActive = true
            heightConstThirdView.isActive = false
        }
        secondView.isHidden = currentVc < 1
        thirdView.isHidden = currentVc < 2

        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func btnConvertToEmiTapped(_ sender: UIButton)
    {
        if sender.tag <= currentVc {
            currentVc = sender.tag - 1
        } else {
            currentVc = sender.tag
        }
        self.reloadViews()
    }
}

