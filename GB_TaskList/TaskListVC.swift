//
//  ViewController.swift
//  GB_TaskList
//
//  Created by Vitaliy Talalay on 30.12.2021.
//

import UIKit

class TaskListVC: UIViewController {
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        taskListTableView.delegate = self
        taskListTableView.dataSource = self
    }
    
    
    @IBAction func addTask(_ sender: Any) {
    }
}

extension TaskListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "TaskListCell",
                for: indexPath) as? TaskListCell
        else { return UITableViewCell() }
        
        cell.configure(labelText: "Hello")
        return cell
    }
}
