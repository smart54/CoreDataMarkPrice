//
//  GoalCell.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 9.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit
import CoreData

class GoalCell: UITableViewCell {

    
    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLablel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    @IBOutlet weak var completionView: UIView!
    // Yukarıda Type için enum sınıfı oluşturduk. type, GoalType türünde olacak.
    func configureCell(goal: Goal) {
        
        self.goalDescriptionLabel.text = goal.goalDescription
        
        self.goalTypeLablel.text = goal.goalType
        // aşağıdaki string ile paranteze alınan kısım Int türünden String türüne dönüştürülüyor. Format bu şekilde.
        self.goalProgressLabel.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
        
        
    }
}
