//
//  GoalsVC.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 9.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    @IBAction func addGoalBtnPressed(_ sender: Any) {
        
        print("buton basıldı")
    }
    
}
// opsiyona bağlı istesek yukarıda belirtebiliriz bu extension u
extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // guard let daha sağlam bir program yazmamızı sağlar. eğer cell yüklenmez ise boş bir cell döneriz.(else satırı)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{return UITableViewCell() }
        // type kısmını enum şeklinde yukarıda belirttik.
        cell.configureCell(description: "haftada en az 2 kere yumurta ye", type: .shortTerm , goalProgressAmount: 2)
    
        return cell
    }
    
}

