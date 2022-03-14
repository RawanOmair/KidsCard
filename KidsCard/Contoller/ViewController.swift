//
//  ViewController.swift
//  KidsCard
//
//  Created by Rawan Omair on 20/07/1443 AH.
//


import UIKit

class ViewController: UIViewController {

   
    //First Page
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var changeLanguage: UIButton!
    @IBOutlet weak var firstSentenceFirstPage: UILabel!
    @IBOutlet weak var secondSentenceFirstPage: UILabel!
    @IBOutlet weak var thiedSentenceFirstPage: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextPageButtonFirstPage: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  firstLabel.text = NSLocalizedString("What is “KidsCards”?", comment: "")
        changeLanguageFunc()
        accessibilityForTheTexts()

    }

    
    @IBAction func changeLanguage(_ sender: Any) {
        let currentLanguage = Locale.current.languageCode
        let newLanguage = currentLanguage == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)
    }
    
    func changeLanguageFunc() {
       
        changeLanguage.setTitle(NSLocalizedString("changeLanguage", comment: ""), for: .normal)
        firstLabel.text = NSLocalizedString("firstQ", comment: "")
        firstSentenceFirstPage.text = NSLocalizedString("firstSentenceFirstPage", comment: "")
        secondSentenceFirstPage.text = NSLocalizedString("secondSentenceFirstPage", comment: "")
        thiedSentenceFirstPage.text = NSLocalizedString("thiedSentenceFirstPage", comment: "")
        
//        case 1:
//        //Second Page
//       
//
//        case 2:
//        //Third Page
//        firstSentenceThirdPage.text = NSLocalizedString("firstSentenceThirdPage", comment: "")
//        secondSentenceThirdPage.text = NSLocalizedString("secondSentenceThirdPage", comment: "")
//        thirdSentenceThirdPage.text = NSLocalizedString("thirdSentenceThirdPage", comment: "")
//        default:
//            break
       // }
    }
    
    
    func accessibilityForTheTexts() {
     
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityLabel = "What is KidsCards?"
     //   firstQ.accessibilityHint = "Your current score"
        
        firstSentenceFirstPage.isAccessibilityElement = true
        firstSentenceFirstPage.accessibilityLabel = "KidsCards will help the special need child  "
        
        secondSentenceFirstPage.isAccessibilityElement = true
        secondSentenceFirstPage.accessibilityLabel = "to exprece his need !"
        
        thiedSentenceFirstPage.isAccessibilityElement = true
        thiedSentenceFirstPage.accessibilityLabel = "WOW ! isn’t great ?"

        changeLanguage.isAccessibilityElement = true
        changeLanguage.accessibilityLabel = "To Change the language from English to Arabic and vice versa"
        
        skipButton.isAccessibilityElement = true
        skipButton.accessibilityLabel = "To skip the introduction pages"
        
        nextPageButtonFirstPage.isAccessibilityElement = true
        nextPageButtonFirstPage.accessibilityLabel = "To go to the next page"
//
//        case 1:
//        //Second Page
//        firstSentenceSecondPage.isAccessibilityElement = true
//        firstSentenceSecondPage.accessibilityLabel = "Simple, Smart and Helpful !"
//
//        secondSentenceSecondPage.isAccessibilityElement = true
//        secondSentenceSecondPage.accessibilityLabel = "It will help your child to learn in creative,"
//
//        thirdSentenceSecondPage.isAccessibilityElement = true
//        thirdSentenceSecondPage.accessibilityLabel = "colorful and simple way !"
//
//        nextPageButtonSecondPage.isAccessibilityElement = true
//        nextPageButtonSecondPage.accessibilityLabel = "To go to the next page"
//
//        case 2:
//        //Third View
//        firstSentenceThirdPage.isAccessibilityElement = true
//        firstSentenceThirdPage.accessibilityLabel = "Customizable"
//
//        secondSentenceThirdPage.isAccessibilityElement = true
//        secondSentenceThirdPage.accessibilityLabel = "KidsCards wants to be closer to your child !"
//
//        thirdSentenceThirdPage.isAccessibilityElement = true
//        thirdSentenceThirdPage.accessibilityLabel = "Can’t wait to start ? let’s begin then !"
//
//        nextPageButtonSecondPage.isAccessibilityElement = true
//        nextPageButtonSecondPage.accessibilityLabel = "To go to the next page"
//        default:
//            break
//        }
    }
 
}


