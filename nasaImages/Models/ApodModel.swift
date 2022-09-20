//
//  ApodModel.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-14.
//

import Foundation
import UIKit

// APOD DATA
struct ApodModelElement: Decodable {
    var copyright, date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?
}

typealias ApodModel = [ApodModelElement]
