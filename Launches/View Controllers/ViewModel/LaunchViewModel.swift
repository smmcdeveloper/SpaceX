//
//  LaunchesViewModel.swift
//  Launches
//
//  Created by SMMC on 24/06/2021.
//

import Foundation

class LaunchViewModel {
    // MARK: - Initialization
    init(model: [LaunchModel]? = nil) {
        if let inputModel = model {
            launches = inputModel
        }
    }
    var launches = [LaunchModel]()
}

extension LaunchViewModel {
    func fetchLaunches(completion: @escaping (Result<[LaunchModel], Error>) -> Void) {
       
        HTTPManager.shared.get(urlString: baseUrl + breachesExtensionURL, completionBlock: { [weak self] result in
            guard let self = self else {return}
           
            switch result {
            case .failure(let error):
                print ("failure", error)
            case .success(let dta) :
                let decoder = JSONDecoder()
                do
                {
                    self.launches = try decoder.decode([LaunchModel].self, from: dta)
                    completion(.success(try decoder.decode([LaunchModel].self, from: dta)))
                } catch {
                    // deal with error from JSON decoding
                }
            }
        })
    }
}

