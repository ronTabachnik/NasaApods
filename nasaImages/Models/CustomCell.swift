//
//  CustomCell.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-14.
//
import UIKit
import Foundation

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var apodView: UIView!
    @IBOutlet weak var apodDateView: UILabel!
    @IBOutlet weak var apodTitleView: UILabel!
    @IBOutlet weak var apodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
