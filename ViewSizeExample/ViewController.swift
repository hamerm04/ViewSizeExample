//
//  ViewController.swift
//  ViewSizeExample
//
//  Created by Michael Hamer on 09/12/2019.
//  Copyright © 2019 Michael Hamer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var deviceTypeLabel: UILabel!
    @IBOutlet weak var sizeTypeLabel: UILabel!
    @IBOutlet weak var screenPercentageLabel: UILabel!
    @IBOutlet weak var pointWidthLabel: UILabel!
    private let screenSize = UIScreen.main.bounds
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSizeType()
        updateDeviceType()
        updateScreenCoveragePercentage(width: view.frame.width)
        updatePointSize(width: view.frame.width)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateSizeType()
    }
    
    private func updateDeviceType() {
        let deviceType: String
        switch (UIDevice.current.userInterfaceIdiom) {
            
        case .phone:
            deviceType = "iPhone"
        case .pad:
            deviceType = "iPad"
        default:
            deviceType = "Unspecified"
        }
        
        deviceTypeLabel.text = "Device type : \(deviceType)"
    }
    
    private func updateSizeType() {
        let traitType: String
        switch (traitCollection.horizontalSizeClass) {
        case .compact:
            traitType = "Compact"
        case .regular:
            traitType = "Regular"
        default:
            traitType = "Unspecified"
        }
        
        sizeTypeLabel.text = "Size type: \(traitType)"
    }
    
    private func updatePointSize(width: CGFloat) {
        pointWidthLabel.text = "Width point size: \(width)"
    }
    
    private func updateScreenCoveragePercentage(width: CGFloat) {
        let screenWidth = UIDevice.current.orientation.isLandscape ? screenSize.height : screenSize.width
        let percentage = (width / screenWidth) * 100
        screenPercentageLabel.text = "Screen cover: \(Int(percentage))%"
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateScreenCoveragePercentage(width: size.width)
        updatePointSize(width: size.width)
    }
}

