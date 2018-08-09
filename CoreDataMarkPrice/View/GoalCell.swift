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
    
    // Yukarıda Type için enum sınıfı oluşturduk. type, GoalType türünde olacak.
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        
        self.goalDescriptionLabel.text = description
        // aşağıda rawValue String tir. rawValue komutu sanırım veri tipli değeri tanıyarak alıyor.
        self.goalTypeLablel.text = type.rawValue
        // aşağıdaki string ile paranteze alınan kısım Int türünden String türüne dönüştürülüyor. Format bu şekilde.
        self.goalProgressLabel.text = String(describing: goalProgressAmount)
    }
}
