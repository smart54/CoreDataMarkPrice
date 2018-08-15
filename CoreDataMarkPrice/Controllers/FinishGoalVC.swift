//
//  FinishGoalVCViewController.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 11.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
import CoreData
// points düzgün görüntülemek içn UITextViewDelegate kısmını ve pointText.delegate = self kısmını eklememiz gerekiyor.
class FinishGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var pointText: UITextField!
    @IBOutlet weak var createGoalButton: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // yukarıdaki IBOutletleri herhangi bir UI elementini bind(ciltletmek) için oluşturuyoruz. farklı sınıflarda yazmış olduğumuz fonksiyonlar ile şeklini animasyonunu vs. değiştirebiliyoruz.
        
        createGoalButton.bindTheKeyboard()
        
        // bu viewController ı pointText konusunda delegate yapacağız.
        pointText.delegate = self as? UITextFieldDelegate
        

    }

    // burada verilerin kaydedilmesine bağlı dismiss işlemi gerçekleşecek.
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
        if pointText.text != "" {
            // eğer save den complete true geldiyse dismiss yap
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
    
        dismissDetail()
        
    }
    // completion neden oluşturuldu araştır. başarılı bir şekilde tamamlandığında true veya false döner. 
    func save(completion: (_ finished: Bool) -> ()) {
        // GoalsVC de class haricinde tanımladığımız appDelegate değişkenini burada tanımladık.
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        // Burada Goal clasının bir instance ını oluşturup parametre olarak managedContext i veriyoruz ki nereye kayıt yapılacğını bilsin bu class.
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        // rowValue yazılmak zorunda yoksa hata veriyor. herhalde enum class ı ilgilendiren birşey bu
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointText.text!)!
        // puanımızın başlangıcı 0 olacak. database deki veri türü de int32 dir.
        goal.goalProgress = Int32(0)
        
        do {
           try managedContext.save()
            print("başarıyla veriler kaydedildi.")
            completion(true)
        } catch {
            // localizeDescription is plain English version of error
            debugPrint("kaydedemedi \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
