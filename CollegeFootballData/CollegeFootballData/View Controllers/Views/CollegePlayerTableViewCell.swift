//
//  CollegePlayerTableViewCell.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import UIKit

class CollegePlayerTableViewCell: UITableViewCell {

    var collegePlayer: CollegeSearchResult? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Outlets

    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerPostionLabel: UILabel!
    @IBOutlet var playerTeamLabel: UILabel!

    private func updateViews() {
        guard let collegePlayer = collegePlayer else { return }

        playerNameLabel.text = collegePlayer.name
        playerPostionLabel.text = collegePlayer.position
        playerTeamLabel.text = collegePlayer.team

    }
}
