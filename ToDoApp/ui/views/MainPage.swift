//
//  ViewController.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import UIKit

class MainPage: UIViewController {
    
    var todo: ToDos?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo = ToDos(id: 1, title: "Ödev", description: "Ödevi bitir", deadline: "2 Ağustos, Çarşamba")
              
    }

    @IBAction func toDetailPageButtonAct(_ sender: Any) {
        performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailPage" {
            let detailVC = segue.destination as! DetailPage
            detailVC.todo = todo
        }
    
    }
    
}


