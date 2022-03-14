//
//  SecondViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 10/08/1443 AH.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var firstSentenceSecondPage: UILabel!
    @IBOutlet weak var secondSentenceSecondPage: UILabel!
    @IBOutlet weak var thirdSentenceSecondPage: UILabel!
    @IBOutlet weak var nextPageButtonSecondPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLanguageFunc()
        accessibilityForTheTexts()
        // Do any additional setup after loading the view.
    }
    
    
    func changeLanguageFunc() {
       
        
        firstSentenceSecondPage.text = NSLocalizedString("firstSentenceSecondPage", comment: "")
        secondSentenceSecondPage.text = NSLocalizedString("secondSentenceSecondPage", comment: "")
        thirdSentenceSecondPage.text = NSLocalizedString("thirdSentenceSecondPage", comment: "")
       
        
    }
    
    
    func accessibilityForTheTexts() {
        
        //Second Page
        firstSentenceSecondPage.isAccessibilityElement = true
        firstSentenceSecondPage.accessibilityLabel = "Simple, Smart and Helpful !"
        
        secondSentenceSecondPage.isAccessibilityElement = true
        secondSentenceSecondPage.accessibilityLabel = "It will help your child to learn in creative,"
        
        thirdSentenceSecondPage.isAccessibilityElement = true
        thirdSentenceSecondPage.accessibilityLabel = "colorful and simple way !"
        
        nextPageButtonSecondPage.isAccessibilityElement = true
        nextPageButtonSecondPage.accessibilityLabel = "To go to the next page"
    
    }

}
