//
//  LaunchesTableViewCell.swift
//  Launches
//
//  Created by SMMC on 24/06/2021.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {

    @IBOutlet weak var launchMissionImage: UIImageView!
    @IBOutlet weak var launchNameLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var launchMissionSucessImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configureCell(launchImage imageUrl: String, launchNameLabel launchName: String, launchDate: String, isMissionSucess: Bool) {
        
        self.launchMissionImage.loadImageUsingCache(with: imageUrl)
        self.launchNameLabel.text = launchName
        self.launchDateLabel.text = launchDate
        setOn(isMissionSucess)
   }
    
    func setOn(_ isOn: Bool) {
        
        let checkedImage =  UIImage(systemName: "checkmark.circle.fill")
        let uncheckedImage =  UIImage(systemName: "xmark.circle")
        if isOn {
            launchMissionSucessImage.image = checkedImage
            launchMissionSucessImage.tintColor = .systemGreen
        } else {
            launchMissionSucessImage.image = uncheckedImage
            launchMissionSucessImage.tintColor = .systemRed
        }
    }
}
