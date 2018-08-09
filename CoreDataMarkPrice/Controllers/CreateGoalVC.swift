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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func shortTermBtn(_ sender: UIButton) {
    }
    
    @IBAction func longTermBtn(_ sender: UIButton) {
    }
    
    @IBAction func nextbtn(_ sender: UIButton) {
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        // geri sayfaya dönmek için aşağıdaki satırı yazmamız gerekiyor. 
        dismiss(animated: true, completion: nil)
    }
    
    
}
