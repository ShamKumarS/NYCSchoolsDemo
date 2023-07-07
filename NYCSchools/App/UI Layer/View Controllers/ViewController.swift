//
//  ViewController.swift
//  NYCSchools
//
//  Created by Rolan on 8/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let schoolsViewModel: SchoolsViewModel = SchoolsViewModel()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
