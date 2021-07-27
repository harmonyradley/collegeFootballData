//
//  ViewController.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import UIKit

class CollegePlayerViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    let collegeSearchResultController = SearchResultController()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }
}

// MARK: - Extensions

extension CollegePlayerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeSearchResultController.collegePlayerSearchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as? CollegePlayerTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}

extension CollegePlayerViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }

        collegeSearchResultController.performSearch(searchTerm: searchTerm) { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
