//
//  FoodCardViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 05/08/1443 AH.
//

import UIKit

class FoodCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var CardsArray = [
        Card(name: NSLocalizedString("Ice cream", comment: ""), image: "Iceream"),
        Card(name: NSLocalizedString("Milk", comment: ""), image: "Milk"),
        Card(name: NSLocalizedString("Pizza", comment: ""), image: "pizza"),
    ]
    @IBOutlet weak var CardCV: UICollectionView!
  
    var selectedCard : String = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardCV.delegate = self
        CardCV.dataSource = self
        initTheArray()
        // Do any additional setup after loading the view.
    }
    
    func initTheArray() {
        print("In the FoodVC: The Selected Card is \(selectedCard)")
        switch selectedCard {
        case "Food":
            CardsArray = [
                Card(name: NSLocalizedString("Ice cream", comment: ""), image: "Iceream"),
                Card(name: NSLocalizedString("Milk", comment: ""), image: "Milk"),
                Card(name: NSLocalizedString("Pizza", comment: ""), image: "pizza"),
                ]
        case "Activiteis":
            CardsArray = [
                Card(name:NSLocalizedString("Play", comment: ""), image: "play"),
                Card(name: NSLocalizedString("Dance", comment: ""), image: "Dance"),
                Card(name:NSLocalizedString("Farm", comment: ""), image: "Farming"),
            ]
        case "Items":
            CardsArray = [
                Card(name:NSLocalizedString("Bag", comment: ""), image: "bag"),
                Card(name: NSLocalizedString("Book", comment: ""), image: "Book"),
                Card(name: NSLocalizedString("Hat", comment: ""), image: "Hat"),
                Card(name: NSLocalizedString("Football", comment: ""), image: "Football"),
            ]
        case "Places":
            CardsArray = [
                Card(name:NSLocalizedString("School", comment: ""), image: "School"),
                Card(name:NSLocalizedString("Home", comment: ""), image: "Home"),
                Card(name:NSLocalizedString("Hospital", comment: ""), image: "Hospital"),
            ]
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.CardsArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath as IndexPath) as! CardCVCell
         
      
        cell.cardName.text = self.CardsArray[indexPath.row].name
        cell.cardImage.image = UIImage(named: self.CardsArray[indexPath.row].image)!
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.cornerRadius = 20.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


