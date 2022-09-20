//
//  Apod.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-15.
//

import Foundation
import UIKit

class Apod{
    var copyright: String
    var date: String
    var explanation: String
    var title: String
    var image: UIImage
    
    init(copyright: String, date: String,explanation: String, title: String, image: UIImage){
        self.copyright = copyright
        self.date = date
        self.explanation = explanation
        self.title = title
        self.image = image
    }
    
}
