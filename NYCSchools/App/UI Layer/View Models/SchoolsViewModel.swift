import Foundation

class SchoolsViewModel {
    
    // MARK: - Private Properties
    
    private(set) var schools: [School] = []
    private(set) var error: DataError? = nil
    private let apiService: SchoolAPILogic = SchoolAPI()
    
    // MARK: - Private Methods
    
    func getSchools(completion: @escaping( ([School]?, DataError?) -> () ) ) {
        apiService.getSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                completion(schools, nil)
            case .failure(let error):
                self?.error = error
                completion([], error)
            }
        }
    }
}
