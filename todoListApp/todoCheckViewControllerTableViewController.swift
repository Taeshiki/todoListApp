//
//  todoCheckViewControllerTableViewController.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/02.
//

import UIKit

class todoCheckViewControllerTableViewController: UITableViewController {
    @IBAction func toEditButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func toAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "추가", style: .default, handler: { _ in alert.textFields?[0].text
            })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "할 일을 입력하세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
}
