//
//  FinishGoalVCViewController.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 11.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
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

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        

    }
   
    
}
