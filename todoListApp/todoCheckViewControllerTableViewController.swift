//
//  todoCheckViewControllerTableViewController.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/02.
//

import UIKit

struct Task {
    var title: String
    var done: Bool
}

class todoCheckViewController: UIViewController {
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "추가", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "할 일을 입력하세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
    }
    
}
