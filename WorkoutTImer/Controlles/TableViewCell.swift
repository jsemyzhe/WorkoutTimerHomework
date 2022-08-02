//
//  TableViewCell.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var setName: UILabel!
    @IBOutlet weak var restTime: UILabel!
    @IBOutlet weak var exerciseTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
