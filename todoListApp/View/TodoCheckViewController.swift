//
//  todoCheckViewControllerTableViewController.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/02.
//

import UIKit

class TodoCheckViewController: UIViewController {
    
    var task: Task?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? TodoCheckTableViewCell else { return }
        if segue.identifier == "detail" {
            if let vc = segue.destination as? TodoDetailViewController {
                vc.task = cell.task
            }
        }
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "할 일을 입력하세요"
        }
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let self else { return }
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                let newItem = Task(id: (TaskList.list.last?.id ?? -1) + 1,
                                   title: title,
                                   isCompleted: false)
                TaskList.list.append(newItem)
                self.tableView?.insertRows(at: [IndexPath(row: TaskList.list.count-1, section: 0)], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension TodoCheckViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoCheckViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoCheckTableViewCell
        cell.setTask(TaskList.list[indexPath.row])
        return cell
    }
}

//반성문
// 스토리보드에서 모듈 연결이 안되면 어디서 데이터를 찾아야 하는지 못찾는다..
// 네이밍을 잘못한다거나 만든 뷰컨트롤이 마음에 안들어 처음부터 다시 만들게 될때 연결 잘되었는지 확인!
