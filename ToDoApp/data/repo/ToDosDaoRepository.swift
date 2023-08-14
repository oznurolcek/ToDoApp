//
//  ToDosDaoRepository.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 10.08.2023.
//

import Foundation
import RxSwift

class ToDosDaoRepository {
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    let database:FMDatabase?
    
    init() {
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todos.sqlite")
        database = FMDatabase(path: databaseURL.path)
    }
    
    func add(title: String, description: String, deadline: String) {
        database?.open()
        do {
            try database!.executeUpdate("INSERT INTO todos (title, description, deadline) VALUES (?, ?, ?)", values: [title, description, deadline])
        } catch {
            print(error.localizedDescription)
        }
        database?.close()
    }
    
    func update(id: Int, title: String, description: String, deadline: String) {
        database?.open()
        do {
            try database!.executeUpdate("UPDATE todos SET title = ?, description = ?, deadline = ? WHERE id = ?", values: [title, description, deadline, id])
        } catch {
            print(error.localizedDescription)
        }
        database?.close()
    }
    
    func delete(id: Int) {
        database?.open()
        do {
            try database!.executeUpdate("DELETE FROM todos WHERE id = ?", values: [id])
        } catch {
            print(error.localizedDescription)
        }
        database?.close()
    }
    
    func search(searchText: String) {
        database?.open()
        
        var todos = [ToDos]()
        
        do {
            let result = try database!.executeQuery("SELECT * FROM todos WHERE title LIKE '%\(searchText)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let title = result.string(forColumn: "title")!
                let description = result.string(forColumn: "description")!
                let deadline = result.string(forColumn: "deadline")!
                
                let todo = ToDos(id: id, title: title, description: description, deadline: deadline)
                todos.append(todo)
            }
            toDoList.onNext(todos)
        } catch {
            print(error.localizedDescription)
        }
        
        database?.close()
    }
    
    func uploadToDos() {
        database?.open()
        
        var todos = [ToDos]()
        
        do {
            let result = try database!.executeQuery("SELECT * FROM todos", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let title = result.string(forColumn: "title")!
                let description = result.string(forColumn: "description")!
                let deadline = result.string(forColumn: "deadline")!
                
                let todo = ToDos(id: id, title: title, description: description, deadline: deadline)
                todos.append(todo)
            }
            toDoList.onNext(todos)
        } catch {
            print(error.localizedDescription)
        }
        database?.close()
    }
}
