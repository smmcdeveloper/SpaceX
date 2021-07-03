//
//  LaunchesViewController.swift
//  Launches
//
//  Created by SMMC on 24/06/2021.
//

import UIKit

class LaunchesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var launchesViewModel = LaunchViewModel()
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        launchesViewModel.fetchLaunches{ [weak self] launches in
            DispatchQueue.main.async {
                self?.addActivityIndicator ()
                self?.updateUI()
            }
        }
    }
    
    private func  addActivityIndicator () {
        self.tableView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        let screenSize = UIScreen.main.bounds
        self.activityIndicatorView.frame = CGRect(x: screenSize.width / 2, y: screenSize.height / 2, width: 5, height: 5)
    }
    
    private  func updateUI() {
        tableView.reloadData()
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
}

extension LaunchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchesViewModel.launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "launch", for: indexPath) as? LaunchesTableViewCell else { fatalError() }
        
        let cellData = launchesViewModel.launches[indexPath.row]
        
        cell.configureCell(launchImage: cellData.links?.patch?.small ?? "",
                           launchNameLabel: cellData.name ?? "",
                           launchDate: cellData.launchDateformatted,
                           isMissionSucess: cellData.success ?? false)
        
        return cell
    }
}
