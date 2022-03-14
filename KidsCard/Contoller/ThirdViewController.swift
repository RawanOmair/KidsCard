//
//  ThirdViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 11/08/1443 AH.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var firstSentenceThirdPage: UILabel!
    @IBOutlet weak var secondSentenceThirdPage: UILabel!
    @IBOutlet weak var thirdSentenceThirdPage: UILabel!
    @IBOutlet weak var nextPageButtonThirdPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func changeLanguage(_ sender: Any) {
        let currentLanguage = Locale.current.languageCode
        let newLanguage = currentLanguage == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)
    }
    
    func changeLanguageFunc() {
 

        //Third Page
        firstSentenceThirdPage.text = NSLocalizedString("firstSentenceThirdPage", comment: "")
        secondSentenceThirdPage.text = NSLocalizedString("secondSentenceThirdPage", comment: "")
        thirdSentenceThirdPage.text = NSLocalizedString("thirdSentenceThirdPage", comment: "")
    
    }
    
    
    func accessibilityForTheTexts() {
   
    //Third View
        firstSentenceThirdPage.isAccessibilityElement = true
        firstSentenceThirdPage.accessibilityLabel = "Customizable"
        
        secondSentenceThirdPage.isAccessibilityElement = true
        secondSentenceThirdPage.accessibilityLabel = "KidsCards wants to be closer to your child !"
        
        thirdSentenceThirdPage.isAccessibilityElement = true
        thirdSentenceThirdPage.accessibilityLabel = "Can’t wait to start ? let’s begin then !"
        
        nextPageButtonThirdPage.isAccessibilityElement = true
        nextPageButtonThirdPage.accessibilityLabel = "To go to the next page"
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
