//
//  CreateGoalVC.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 9.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
// UItextViewDelegate sınıfını eklemeyi unutmuyoruz.
class CreateGoalVC: UIViewController, UITextViewDelegate {

    
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
        
        goalTextView.delegate = self
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
        
        if goalTextView.text != "" && goalTextView.text != "Amacınız Nedir?" {
            
            
            // segue yerine kullanılıyor. çünkü bu da storyboard identifier ile yönlendirme yapıyor. aşağıda initData yı initiate yapabilmemiz için cast yapıyoruz.
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            // UIViewControllerExt.swift dosyasına göz at aşağıdaki kod detayları için
            // Bu kısım hemen hemen hiç anlaşılmadı. İyice araştır. 
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
        
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        // geri sayfaya dönmek için aşağıdaki satırı yazmamız gerekiyor.
        dismissDetail()
    }
    // textfield kısmını bir şey yazmaya başladığımızda temizleyeceğiz.
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
