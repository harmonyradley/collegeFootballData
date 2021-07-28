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

        for player in collegePlayer.definitions {
            playerNameLabel.text = player.properties.name
        }

        for position in collegePlayer.definitions {
            playerPostionLabel.text = position.properties.position
        }

        for team in collegePlayer.definitions {
            playerTeamLabel.text = team.properties.team
        }
    }
}
