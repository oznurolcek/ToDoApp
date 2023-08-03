//
//  ViewController.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import UIKit

class MainPage: UIViewController {
    
    var todos = [ToDos]()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        todos = [
            ToDos(id: 1, title: "Ödev", description: "Ödevi bitir", deadline: "2 Ağustos, Çarşamba"),
            ToDos(id: 2, title: "Doktor", description: "Doktor randevu", deadline: "10 Ağustos, Perşembe"),
            ToDos(id: 3, title: "Toplantı", description: "İş toplantısı", deadline: "25 Ağustos, Cuma"),
            ToDos(id: 4, title: "Sipariş", description: "Sipariş ver", deadline: "12 Ağustos, Cumartesi"),
            ToDos(id: 5, title: "Kitap", description: "Kitap oku", deadline: "15 Ağustos, Salı"),
            ToDos(id: 6, title: "Buluşma", description: "Arkadaşlarla buluş", deadline: "9 Ağustos, Çarşamba")
            
            ]
              
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailPage" {
                if let todo = sender as? ToDos {
                    let detailVC = segue.destination as! DetailPage
                    detailVC.todo = todo
                }
            }
        
        }
    
    func alertDialog(title : String, message : String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertMessage.addAction(cancelButton)
            
        let yesButton = UIAlertAction(title: "OK", style: .default) {
            action in
            print("Deleted To Do")
        }
            alertMessage.addAction(yesButton)
            self.present(alertMessage, animated: true)

        }
    
}

extension MainPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
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
            self.alertDialog(title: "Delete", message: "Do you want to delete \(todo.title!)")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
}


