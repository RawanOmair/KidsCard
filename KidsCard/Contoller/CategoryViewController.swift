//
//  CategoryViewController.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 04/08/1443 AH.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{


    var CardsArray = [
        Card(name: "Food", image: "Food"),
        Card(name: "Activiteis", image: "Activiteis"),
        Card(name: "Items", image: "Items"),
        Card(name: "Places", image: "Places")
    ]
    
    
    var sentenceArray = [Card]()
    
    @IBOutlet weak var CardCollectionView: UICollectionView!
    @IBOutlet weak var sentenceCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "FoodVC") as! FoodVC
            vc.sentenceArray = sentenceArray
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 1 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ActiviteisVC") as! ActiviteisVC
            vc.sentenceArray = sentenceArray
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ItemsVC") as! ItemsVC
            vc.sentenceArray = sentenceArray
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardCollectionView.delegate = self
        CardCollectionView.dataSource = self
        sentenceCollectionView.delegate = self
        sentenceCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return collectionView == self.CardCollectionView ? self.CardsArray.count : self.sentenceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.CardCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CardCVCell
            cell.cardName.text = self.CardsArray[indexPath.row].name
            cell.cardImage.image = UIImage(named: self.CardsArray[indexPath.row].image)!
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 1.0
            cell.layer.shadowOpacity = 0.5
            cell.layer.cornerRadius = 20.0
            cell.layer.masksToBounds = false
            cell.layer.backgroundColor = #colorLiteral(red: 1, green: 0.9765446782, blue: 1, alpha: 1)
            //cell.customImageView?.image = UIImage(named: self.CardsArray[indexPath.row])
            //cell.customLabel.text = self.CardsArray[indexPath.row].capitalized
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CardCVCell
            cell.cardName.text = self.sentenceArray[indexPath.row].name
            cell.cardImage.image = UIImage(named: self.sentenceArray[indexPath.row].image)!
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 1.0
            cell.layer.shadowOpacity = 0.5
            cell.layer.cornerRadius = 20.0
            cell.layer.masksToBounds = false
            cell.layer.backgroundColor = #colorLiteral(red: 1, green: 0.9765446782, blue: 1, alpha: 1)
            //cell.customImageView?.image = UIImage(named: self.CardsArray[indexPath.row])
            //cell.customLabel.text = self.CardsArray[indexPath.row].capitalized
            return cell
        }
    }

}
