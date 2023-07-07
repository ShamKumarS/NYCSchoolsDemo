//
//  File.swift
//  NYCSchools
//
//  Created by Rolan on 8/9/22.
//

import Foundation

class SchoolsViewModel {
    private(set) var schools: [School] = []
    private(set) var error: DataError? = nil
    
    private let apiService: SchoolAPILogic
    
    init(apiService: SchoolAPILogic = SchoolAPI()) {
        self.apiService = apiService
    } 
    
    func getSchools(completion: @escaping( ([School]?, DataError?) -> () ) ) {
        apiService.getSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                completion(schools, nil)
            case .failure(let error):
                self?.error = error
                completion(nil, error)
            }
        }
    }
}
