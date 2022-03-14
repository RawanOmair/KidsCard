//
//  Alerts.swift
//  KidsCard
//
//  Created by Rawan Omair on 05/08/1443 AH.
//

import UIKit

struct Alerts {
    
    static func showBasicAlert(title: String,  massage: String, on vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel)
        
        alert.addAction(dismiss)
        
        vc.present(alert, animated: true)
    }
}
