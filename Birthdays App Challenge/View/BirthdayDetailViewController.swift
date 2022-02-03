//
//  BirthdayDetailViewController.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation
import UIKit

class BirthdayDetailViewController: UIViewController {

    // MARK: IBOutlets

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!

    // MARK: Properties

    var initials: String?
    var name: String?
    var dateOfBirth: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setTexts()
    }

    override func viewWillLayoutSubviews() {
        circleView.layer.cornerRadius = circleView.bounds.height / 2
        self.view.layoutIfNeeded()
    }

    func setTexts() {
        initialsLabel.text = initials
        nameLabel.text = name
        dobLabel.text = dateOfBirth
    }


    @IBAction func goBackButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
