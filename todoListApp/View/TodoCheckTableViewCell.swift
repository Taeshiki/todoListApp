//
//  TodoCheckTableViewCell.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/31.
//

import UIKit

class TodoCheckTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    var task: Task?
    
    @IBAction func switchChanged(_ sender: Any) {
        guard let task else { return }
        
        if taskSwitch.isOn {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            TaskList.completeTask(task: task, isCompleted: true)
        }
        else {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            TaskList.completeTask(task: task, isCompleted: false)
        }
    }
    
    func setTask (_ _task: Task) {
        task = _task
        guard let task else { return }
        if task.isCompleted {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
        }
        else {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
        }
        taskSwitch.isOn = task.isCompleted
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

extension String{
    func strikeThrough() -> NSAttributedString {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
            return attributeString
        }
}
