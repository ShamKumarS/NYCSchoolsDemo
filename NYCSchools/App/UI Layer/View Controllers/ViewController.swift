import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties
    
    private let schoolsViewModel: SchoolsViewModel = SchoolsViewModel()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolsViewModel.getSchools { [weak self] (schools, error) in
            if let error = error {
                let alert = UIAlertController(title: "Error",
                                              message: "Could not retrieve schools: \(error.localizedDescription)",
                                              preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK",
                                           style: .default)
                alert.addAction(action)
                self?.present(alert,
                              animated: true)
            }
            
            if let schools = schools {
                print("retrieved \(schools.count) schools")
            }
        }
    }
}

