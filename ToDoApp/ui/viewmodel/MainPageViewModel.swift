//
//  MainPageViewModel.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 10.08.2023.
//

import Foundation
import RxSwift

class MainPageViewModel {
    var tdrepo = ToDosDaoRepository()
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init() {
        copyDatabase()
        toDoList = tdrepo.toDoList
    }
    
    func delete(id: Int) {
        tdrepo.delete(id: id)
        uploadToDos()
    }
    
    func search(searchText: String) {
        tdrepo.search(searchText: searchText)
    }
    
    func uploadToDos() {
        tdrepo.uploadToDos()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todos", ofType: ".sqlite")
        
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("todos.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: databaseURL.path()) {
            print("Database already exist.")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
