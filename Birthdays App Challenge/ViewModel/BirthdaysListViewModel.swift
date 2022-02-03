//
//  BirthdaysListViewModel.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation

protocol BirthdaysListViewDelegate {
    func reloadBirthdays()
    func failure(message: String)
}

class BirthdaysListViewModel {
    var birthdayResult: [BirthdayResult]
    let webService: WebService
    var delegate: BirthdaysListViewDelegate?

    init() {
        birthdayResult = []
        webService = WebService()
    }

}

extension BirthdaysListViewModel {

    func fetchBirthdays() {
        webService.fetchBirthdays { result in
            switch result {
            case.success(let birthdays):
                self.birthdayResult = birthdays.results
                self.delegate?.reloadBirthdays()
            case .failure(let error):
                self.delegate?.failure(message: error.localizedDescription)
            }
        }
    }
}


extension BirthdaysListViewModel {

    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.birthdayResult.count
    }

    func birthdayAtIndex(_ index: Int) -> BirthdayViewModel {
        let birthday = self.birthdayResult[index]
        return BirthdayViewModel(birthday)
    }

}
