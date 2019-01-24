//
//  PopularMovieCell.swift
//  TreehousePopularMovies
//
//  Created by Michael Brown on 1/24/19.
//  Copyright © 2019 Michael Brown. All rights reserved.
//

import UIKit

class PopularMovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
