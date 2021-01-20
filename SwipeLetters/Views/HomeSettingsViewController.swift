//
//  HomeSettingsViewController.swift
//  SwipeLetters
//
//  Created by Glenn Posadas on 1/20/21.
//

import UIKit

class HomeSettingsViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var button_Start: UIButton!
    @IBOutlet weak var view_AdContainer: UIView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateStartButton()
    }
    
    private func animateStartButton() {
        button_Start.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        
        UIView.animate(
            withDuration: 10.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 5.0,
            options: .allowUserInteraction,
            animations: {
                self.button_Start.transform = CGAffineTransform.identity
            }) { (complete) in
            if complete {
                self.animateStartButton()
            }
        }
    }
}
