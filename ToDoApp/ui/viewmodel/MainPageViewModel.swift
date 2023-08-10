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
}
