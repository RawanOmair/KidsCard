//
//  FoodCardViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 05/08/1443 AH.
//

import UIKit

class FoodCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var CardsArray = [
        Card(name: "Ice cream", image: "Iceream"),
        Card(name: "Milk", image: "Milk"),
        Card(name: "Pizza", image: "pizza"),
    ]
    @IBOutlet weak var CardCV: UICollectionView!
  
    var selectedCategory : String = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardCV.delegate = self
        CardCV.dataSource = self
        // Do any additional setup after loading the view.
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


