//
//  TaskViewController.swift
//  mipt_iOS_app
//
//  Created by ms30 on 19.12.21.
//

import UIKit



class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func addTaskButton(_ sender: Any) {
        addTask()
    }
    @IBOutlet weak var taskTable: UITableView!
    
    
    var tasks = Array<String>()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell")! as UITableViewCell
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func addTask() {
        let task = "task \(tasks.count + 1)"

        tasks.append(task)
        taskTable.reloadData()

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
