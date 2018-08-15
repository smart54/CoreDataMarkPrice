//
//  GoalsVC.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 9.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
import CoreData

// Dikkat! Sınıf haricinde tanımladığımız bu constant bütün Controller tarafından erişime açıktır.
let appDelegate = UIApplication.shared.delegate as? AppDelegate


class GoalsVC: UIViewController {

    // String "" ile başlatılır. Nil ile farkını araştır. Dizi de blank parantez kullanıyoruz.
    var goals : [Goal] = []
    @IBOutlet weak var tableView: UITableView!
    
   // Çok önemli viewDidLoad() metodu sadece bir kere çağrılır. dismiss yapılıp bu sayfaya geri dönüldüğünde viewDidLoad() çalışmaz. Bundan ötürü dismiss için aşapğıdaki metodu kullanacağız.
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // kod tekrarlamasın diye aşağıda fonksiyon oluşturduk
        fetchCoreDataObects()
        tableView.reloadData()

    }
    
    func fetchCoreDataObects() {
        self.fetch { (complete) in
            if complete {
                // fetch requestten diziye en az bir eleman geçtiğini test edersek fetch Requestin gerçekleştiğini varsayabiliriz.
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    
                    tableView.isHidden = true
                    
                }
            }
        }
        
    }

    @IBAction func addGoalBtnPressed(_ sender: Any) {
        // storyboard a verdiğimiz id yi giriyoruz. dikkat else bloğu guard let ile birlikte kullanılmak zorunda...
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        // yukarıda oluşturduğumuz nesneyi giriyoruz. bakcbtn kısmında da dismissDetail() fonksiyonumuzu çağırıyoruz.
        presentDetail(createGoalVC)
    }
    
}
// opsiyona bağlı istesek yukarıda belirtebiliriz bu extension u
extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    // guard let daha sağlam bir program yazmamızı sağlar. eğer cell yüklenmez ise boş bir cell döneriz.(else satırı)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{return UITableViewCell() }
        
        let goal = goals[indexPath.row]
        // type kısmını enum şeklinde yukarıda belirttik.
        // indexPath den aldığımız her bir "goal(Goal)" türündeki veriyi aşağıda dinamik bir şekilde yüklüyoruz
        cell.configureCell(goal: goal)
    
        return cell
    }
    
    // Remove fonkisyonu için tableView i editlenebilir yapıyoruz.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // Remove için bir editing style giriyoruz. Şu an none.
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    // asıl delete işlemi buradaki action da gerçekleşecek. 
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "SİL") { (rowAction, indexPath) in
            
            //
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObects()
            // aşağıdaki satır silinen satırı anime eder.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "SAYDIR") { (rowAction, indexPath) in
            
            self.setProgress(atIndexPath: indexPath)
            // bütün tabloyu yüklemeye gerek yok. sadece indexin bulunduğu tabloyu yüklüyoruz.
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        return [deleteAction, addAction]
    }
    
}

extension GoalsVC {
    
    func setProgress(atIndexPath indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else {
            
            return
        }
        
        do {
            try managedContext.save()
            print("setProgress başarıyla gerçekleşti")
        } catch {
          debugPrint("error on setProgress \(error.localizedDescription)")
        }
        
    }
    
    
    // çağrıldığında tableView den indexPath parametresini alır ve arraydan item siler.
    func removeGoal(atIndexPath indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        // indexPath deki arraydan item siler.
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("başarılı bir şekilde silindi.")
        } catch {
            debugPrint("silinemedi \(error.localizedDescription)")
        }
    }
    
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            // burada fetch yaptığımızda bir array dönülüyor. bundan ötürü yukarıda entity ismi olan Goal türünde bir dizi tanımlıyoruz.
            goals =  try managedContext.fetch(fetchRequest)
            print("başarılı bir şekilde fetch edildi.")
            completion(true)
        } catch {
            
            debugPrint("fetch gerçekleşmedi \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
    
    
}

