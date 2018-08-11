//
//  CreateGoalVC.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 9.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    
    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var kısaVade: UIButton!
    
    @IBOutlet weak var uzunVade: UIButton!
    
    @IBOutlet weak var ileriButonu: UIButton!
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // neden IBOutlet?
        // ekran yüklendiğinde keyboard yukarı kalktığı gibi ileri butonu da yukarı kalkacak.
        ileriButonu.bindTheKeyboard()
        
       
        kısaVade.setSelectedColor()
        uzunVade.setDeselectedColor()
    }

    @IBAction func shortTermBtn(_ sender: UIButton) {
        
        goalType = .shortTerm
        kısaVade.setSelectedColor()
        uzunVade.setDeselectedColor()
    }
    
    @IBAction func longTermBtn(_ sender: UIButton) {
        
        goalType = .longTerm
        kısaVade.setDeselectedColor()
        uzunVade.setSelectedColor()
    }
    
    @IBAction func nextbtn(_ sender: UIButton) {
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        // geri sayfaya dönmek için aşağıdaki satırı yazmamız gerekiyor.
        dismissDetail()
    }
    
    
}
