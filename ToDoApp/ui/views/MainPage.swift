//
//  ViewController.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import UIKit

class MainPage: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDosTableView: UITableView!
    
    var todos = [ToDos]()

    var viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        _ = viewModel.toDoList.subscribe(onNext: { todos in
            self.todos = todos
            self.toDosTableView.reloadData()
        })
              
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadToDos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailPage" {
                if let todo = sender as? ToDos {
                    let detailVC = segue.destination as! DetailPage
                    detailVC.todo = todo
                }
            }
        
        }
}

extension MainPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension MainPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDosTableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoCell
        cell.titleLabel.text = todos[indexPath.row].title
        cell.deadlineLabel.text = todos[indexPath.row].deadline
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDosTableView.deselectRow(at: indexPath, animated: true)
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "toDetailPage", sender: todo)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            contextualAction, view, bool in
            let todo = self.todos[indexPath.row]
            let alert = UIAlertController(title: "Delete", message: "Do you want delete \(todo.title!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
                action in
                self.viewModel.delete(id: todo.id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
}


