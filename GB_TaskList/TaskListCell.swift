//
//  TaskLIstCell.swift
//  GB_TaskList
//
//  Created by Vitaliy Talalay on 30.12.2021.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(labelText: String) {
        self.taskLabel.text = labelText
        taskLabel.textColor = .systemBlue
    }
}
