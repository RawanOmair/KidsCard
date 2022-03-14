//
//  CategoryCardViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 05/08/1443 AH.
//

import UIKit

class CategoryCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var CardsArray = [
        Card(name: NSLocalizedString("Food", comment: ""), image: "Food"),
        Card(name:  NSLocalizedString("Activities", comment: ""), image: "Activiteis"),
        Card(name:  NSLocalizedString("Items", comment: ""), image: "Items"),
        Card(name:  NSLocalizedString("Place", comment: ""), image: "Places")
    ] 
    @IBOutlet weak var CardCV: UICollectionView!
    var selectedCard : String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardCV.delegate = self
        CardCV.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = CardsArray[indexPath.item].name
      //  performSegue(withIdentifier: "CardsVC" , sender: selectedCard)
       print("In the Category: The Selected Card is \(selectedCard)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "FoodCardViewController") as! FoodCardViewController
         //   let vc = storyboard?.instantiateViewController(withIdentifier: "FoodVC") as! CategoryViewController
            vc.selectedCard = selectedCard 
            navigationController?.pushViewController(vc, animated: true)
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
        
        if indexPath == [0] {
            performSegue(withIdentifier: "CardsVC" , sender: selectedCard)
        }
        
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




//did select 
