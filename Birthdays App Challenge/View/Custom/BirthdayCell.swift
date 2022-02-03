//
//  BirthdayCell.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import UIKit

class BirthdayCell: UITableViewCell {

    // MARK: IBOutlets

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        circleView.layer.cornerRadius = circleView.layer.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Cell configure method

    func configureCell(for person: BirthdayViewModel) {

        self.accessoryType = .disclosureIndicator

        initialsLabel.text = person.initials
        nameLabel.text = person.fullName
        dobLabel.text = person.dateOfBirth

    }

}
