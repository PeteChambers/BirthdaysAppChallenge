//
//  BirthdaysListViewController.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation
import UIKit

class BirthdayListViewController: UITableViewController {


    // MARK: Properties

    private var viewModel = BirthdaysListViewModel()

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "BirthdayCell", bundle: nil), forCellReuseIdentifier: "BirthdayCell")
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self

        fetchBirthdays()
    }

    // Fetch Birthdays

    func fetchBirthdays() {
        viewModel.fetchBirthdays()
    }

    // MARK: TableView Method

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BirthdayCell", for: indexPath) as! BirthdayCell
        let birthdayViewModel = viewModel.birthdayAtIndex(indexPath.row)
        cell.configureCell(for: birthdayViewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard!.instantiateViewController(withIdentifier: "BirthdayDetailViewController") as! BirthdayDetailViewController
        let birthdayViewModel = viewModel.birthdayAtIndex(indexPath.row)
        detailsViewController.initials = birthdayViewModel.initials
        detailsViewController.name = birthdayViewModel.fullName
        detailsViewController.dateOfBirth = "\(birthdayViewModel.age) YEARS OLD"

        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
        }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension BirthdayListViewController: BirthdaysListViewDelegate {
    func reloadBirthdays() {
        reloadTableView()
    }

    func failure(message: String) {
        
    }



}
