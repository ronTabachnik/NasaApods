//
//  ApodPage.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-19.
//

import Foundation
import UIKit

class ApodPage: UIViewController, UIScrollViewDelegate {
    let gradient = CAGradientLayer()
    @IBOutlet weak var apodMainView: UIView!
    @IBOutlet weak var apodImage: UIImageView!
    @IBOutlet weak var apodCopyrights: UILabel!
    @IBOutlet weak var apodTitle: UILabel!
    @IBOutlet weak var apodDate: UILabel!
    @IBOutlet weak var apodDescription: UITextView!
    @IBOutlet weak var apodScrollView: UIScrollView!
    var apod: Apod!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apodScrollView.delegate = self
        apodImage.contentMode = .center
        apodImage.contentMode = .scaleToFill
        apodImage.image = apod.image
        apodMainView.bounds.size.height += apodDescription.bounds.size.height + 100
        apodCopyrights.text = "Copyrights: \(apod.copyright)"
        apodTitle.text = apod.title
        apodDate.text = apod.date
        apodDescription.text = apod.explanation
    }
    
    
}
