//
//  TodoCompleteTableViewCell.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/31.
//

import Foundation
import UIKit

class TodoCompleteTableViewCell: UITableViewCell {

    var task: Task?
    
    func setTask(_ _task: Task) {
        task = _task
        guard let task else { return }
        textLabel?.text = task.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

