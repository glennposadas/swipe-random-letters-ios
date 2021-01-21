//
//  HomeSettingsViewController.swift
//  SwipeLetters
//
//  Created by Glenn Posadas on 1/20/21.
//

import GoogleMobileAds
import UIKit

class HomeSettingsViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var button_Start: UIButton!
    @IBOutlet weak var view_AdContainer: UIView!
    @IBOutlet weak var button_RandomizeLetters: UIButton!
    
    private var bannerView: GADBannerView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRandomizeButton()
        animateStartButton()
        setupBannerAd()
    }
    
    private func setupRandomizeButton() {
        let useRandomizeLetters = AppDefaults.getObjectWithKey(.useRandomizeLetters, type: Bool.self)
        let name = useRandomizeLetters == true ? "ic_checkbox_on" : "ic_checkbox_off"
        let image = UIImage(named: name)
        button_RandomizeLetters.setImage(image, for: .normal)
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
    
    private func setupBannerAd() {
        view_AdContainer.backgroundColor = .clear
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        bannerView.adUnitID = PubKeys.Admob.homeBannerAd
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view_AdContainer.addSubview(self.bannerView)
        bannerView.bottomAnchor.constraint(equalTo: self.view_AdContainer.bottomAnchor).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: self.view_AdContainer.centerXAnchor).isActive = true
    }
    
    @IBAction func randomizeLettersToggled(_ sender: Any) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        let useRandomizeLetters = AppDefaults.getObjectWithKey(.useRandomizeLetters, type: Bool.self) ?? false
        AppDefaults.store(!useRandomizeLetters, key: .useRandomizeLetters)
        setupRandomizeButton()
        
    }
}
