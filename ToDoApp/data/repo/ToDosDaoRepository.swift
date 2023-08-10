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
    
    func add(title: String, description: String, deadline: String) {
        print("Title: \(title), Description: \(description), Deadline: \(deadline)")
    }
    
    func update(id: Int, title: String, description: String, deadline: String) {
        print("Updated -> ID: \(id) - Title: \(title) - Description \(description) - Deadline: \(deadline)")
    }
    
    func delete(id: Int) {
        print("Deleted To Do: \(id)")
    }
    
    func search(searchText: String) {
        print("Search To Do: \(searchText)")
    }
    
    func uploadToDos() {
        var todos = [ToDos]()
        
        todos = [
            ToDos(id: 1, title: "Ödev", description: "Ödevi bitir", deadline: "2 Ağustos, Çarşamba"),
            ToDos(id: 2, title: "Doktor", description: "Doktor randevu", deadline: "10 Ağustos, Perşembe"),
            ToDos(id: 3, title: "Toplantı", description: "İş toplantısı", deadline: "25 Ağustos, Cuma"),
            ToDos(id: 4, title: "Sipariş", description: "Sipariş ver", deadline: "12 Ağustos, Cumartesi"),
            ToDos(id: 5, title: "Kitap", description: "Kitap oku", deadline: "15 Ağustos, Salı"),
            ToDos(id: 6, title: "Buluşma", description: "Arkadaşlarla buluş", deadline: "9 Ağustos, Çarşamba")
        ]
        
        toDoList.onNext(todos)
    }
}
