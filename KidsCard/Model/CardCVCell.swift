//
//  CardCVCell.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 03/08/1443 AH.
//

import UIKit

class CardCVCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    
    func configure(with card: Card) {
            
            self.cardName.text = card.name
            self.cardImage.image = UIImage(named: card.image)
            
            // 1. Make Voice over ignore the Lable
            self.cardName.isAccessibilityElement = false
            self.cardImage.isAccessibilityElement = false
            
            // 2. Make Voice Over highlight this UICollectionViewCell as an element
            isAccessibilityElement = true
            
            
            // 3. Improve the read back by customizing the label. This should sound much nicer.
            accessibilityLabel = "Image of Cars \(card.name) , the name of Card is \(card.name)"
            
           // accessibilityHint = "If you want this image drag it to the top to create a sentence"
       }
}
