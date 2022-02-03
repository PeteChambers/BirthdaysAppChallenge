//
//  WebService.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation
import Alamofire

class WebService {

    private let defaultQueue = DispatchQueue.global(qos: .userInitiated)

    private func callURL<T:Decodable>(url: URL, method: HTTPMethod, encoding: ParameterEncoding, completion: @escaping (Result<T,Error>) -> Void) {


        AF.request(url, method: method, encoding: encoding)
            .responseData(queue: defaultQueue) { response in

                guard response.error == nil else {
                    debugPrint("ERROR calling \(url.absoluteString), Error: \(String(describing: response.error))")
                    completion(.failure(response.error!))
                    return
                }

                guard let responseData = response.data else {
                    debugPrint("ERROR calling \(url.absoluteString), No Data Found")
                    completion(.failure(response.error!))
                    return
                }

                do{
                    let decoder = JSONDecoder()
                    let item = try decoder.decode(T.self, from: responseData )
                    debugPrint("SUCCESS calling \(url.absoluteString)")
                    completion(.success(item))
                    return
                } catch {
                    debugPrint("Could not decode data into \(T.self) \(url.absoluteString) \(error)")
                    completion(.failure(error))
                }
        }
    }

    // MARK: Fetch Birthdays

    func fetchBirthdays(completion: @escaping ((Result<Birthdays,Error>) -> Void)) {

        guard let url = URL.fetchBirthdays() else { return }
        callURL(url: url, method: .get, encoding: JSONEncoding.default, completion: completion)
    }

}
