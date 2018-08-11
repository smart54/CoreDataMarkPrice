//
//  File.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 10.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit


extension UIView {
    
    // next butonunun keyboard ile yukarı kaldırılması olayını bu fonksiyon gerçekleştiriyor.
    func bindTheKeyboard(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    // bir bug var. her keyboard çağrıldığına next butonu biraz daha yukarı çıkıyor. bunun çözülmesi gerekiyor
    @objc func keyboardWillChange(_ notification: NSNotification) {
        // notification içinde bir userInfo diye bir dictionary var ve bu optional. bunu force to unwrap yapıyoruz.
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        // curve keyboardın yukarı doğru çıkış stili ile ilgilenir. Mesela yavaş yukarı kalkıp sonra hızlanması vs.
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        // keyboard aşağıdayken yukarıda çıkmadan önceki çerçevesini yakalar. Yani keyboard çerçevesinin nerede olduğunu söyler. keyboard ın dikdörtgensel değerlerini geri döner.(cgRectValue türüne dönüştürüyoruz)
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        // bu da end frame in değerlerini cgRect türünde döner bize.
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // iki frame in y koordinatı düzlemindeki farklarını alıyoruz.
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        // bu kısımda animasyonu icra ediyoruz.
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            // keyboarddaki değişim kadar butonu animate ettiriyoruz. 
            self.frame.origin.y += deltaY
        }, completion: nil)

    }
    
    
}
