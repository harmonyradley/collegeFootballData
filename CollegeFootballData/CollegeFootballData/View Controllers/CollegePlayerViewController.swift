//
//  ViewController.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import UIKit

class CollegePlayerViewController: UIViewController {

    // MARK: - Properties
    let collegeSearchResultController = SearchResultController()

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    // MARK: - View Lifecycle

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollegePlayerTableViewCell.reuseIdentifier, for: indexPath) as? CollegePlayerTableViewCell else {
            fatalError("Can't dequeue cell of type \(CollegePlayerTableViewCell.reuseIdentifier)")
        }
        return cell
    }
}

extension CollegePlayerViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }

        collegeSearchResultController.performSearch(with: searchTerm) { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
