//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 3.08.2023.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var missionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
