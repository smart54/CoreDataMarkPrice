//
//  UIViewControllerExt.swift
//  CoreDataMarkPrice
//
//  Created by Demo on 10.08.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit


// işlem yapacağımız controller ın storyBoard ına bir identifier verilmesi gerekiyor.(aslından her bir Viewcontroller ın storyBoard id sini sınıf adı olarak deklare etti)
extension UIViewController {
    
    // her zaman göstermek istemediğimden "_" simgesini yerleştiriyorum diyor.
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        // Core Animation(CA) kütüphanesini initialize yapıyoruz
        let transition = CATransition()
        // animasyonun süresi
        transition.duration = 0.5
        // animasyon türü
        transition.type = kCATransitionPush
        // nereden nereye hareket edecek!
        transition.subtype = kCATransitionFromRight
        // özelliklerini belirttiğimiz transition u layer a set ediyoruz. yani layer ın transition u set ediyoruz. 2. parametre için built-in key(kCATransition) hali hazırda var. Onu yazıyoruz.
        self.view.window?.layer.add(transition, forKey: kCATransition)
        // şimdi fonksiyona parametre olarak verdiğimiz(viewControllerToPresent) viewController ı present etme zamanı... ilk parametre fonksiyonunu parametresi... 2. parametre false olmak zorunda aksi takdirde default animation gösteriliyor. completion(how finish) kısmını önemsemiyoruz.
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerPresent: UIViewController){
        // Yukarıdakinin aynısı
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedViewController = presentedViewController else { return }
        // yukarıdaki özellikler ile varsayılan dismiss fonksiyonunu override ediyoruz.
        presentedViewController.dismiss(animated: false) {
            
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerPresent, animated: false, completion: nil)
        }
    }
    
    // yukarıdaki satırlardan sadece "kCATransitionFromLeft" komutu değişti. back butona basıldığında soldan hareket edecek.
    func dismissDetail() {
        // Core Animation(CA) kütüphanesini initialize yapıyoruz
        let transition = CATransition()
        // animasyonun süresi
        transition.duration = 0.5
        // animasyon türü
        transition.type = kCATransitionPush
        // nereden nereye hareket edecek!
        transition.subtype = kCATransitionFromLeft
        // özelliklerini belirttiğimiz transition u layer a set ediyoruz. yani layer ın transition u set ediyoruz. 2. parametre için built-in key(kCATransition) hali hazırda var. Onu yazıyoruz.
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        // dismiss in ilk parametresi false olacak. aksi takdirde default animasyon devreye giriyor.
        dismiss(animated: false, completion: nil)
        
    }
}
