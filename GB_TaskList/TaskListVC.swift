//
//  ViewController.swift
//  GB_TaskList
//
//  Created by Vitaliy Talalay on 30.12.2021.
//

import UIKit

class TaskListVC: UIViewController {
    
    private var task = Task("root")
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    override func viewWillAppear(_: Bool) {
        taskListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskListTableView.delegate = self
        taskListTableView.dataSource = self
    }
    
    public func setTask(_ task: Task?) {
        guard let task = task else { return }
        self.task = task
    }
    
    @IBAction func addTask(_ sender: Any) {
        let newRowIndex = task.tasks.count
        task.tasks.append(Task("Task \(newRowIndex + 1)"))
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        taskListTableView.insertRows(at: indexPaths, with: .automatic)
    }
}

extension TaskListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return task.tasks.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "TaskListCell",
                for: indexPath) as? TaskListCell
        else { return UITableViewCell() }
        
        let cellData = task.tasks[indexPath.row]
        cell.configure(labelText: "\(cellData.name) (\(cellData.description()))")
        return cell
    }
}

extension TaskListVC: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {

        let task = task.tasks[indexPath.row]
        let vc = storyboard!.instantiateViewController(
            withIdentifier: "TaskListVC") as! Self
        vc.setTask(task as? Task)
        navigationController?.pushViewController(vc, animated: true)
    }
}
