//
//  ItemsVC.swift
//  KidsCard
//
//  Created by Rahaf Alhubeis on 05/08/1443 AH.
//

import UIKit

class ItemsVC: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var CardCollectionView: UICollectionView!
    @IBOutlet weak var sentenceCollectionView: UICollectionView!
    
    var CardsArray = [
        Card(name: "Bag", image: "bag"),
        Card(name: "Book", image: "Book"),
        Card(name: "Hat", image: "Hat"),
        Card(name: "Football", image: "Football"),
    ]
    
 //   var card: [Card] = []
    var sentenceArray = [Card]()
    let reuseIdentifier = "cell1"
  
    @IBAction func NextButton(_ sender: Any) {
     
//      //  performSegue(withIdentifier: "ShowCategory" , sender: self)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
//        vc.sentenceArray = sentenceArray
//        navigationController?.pushViewController(vc, animated: true)
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        
        //CardCollectionView
//        CardCollectionView.dragInteractionEnabled = true
//        CardCollectionView.dragDelegate = self
//        CardCollectionView.dropDelegate = self
//        CardCollectionView.delegate = self
//        CardCollectionView.dataSource = self
//
//
//        //CollectionView-2 drag and drop configuration
//        sentenceCollectionView.dragInteractionEnabled = true
//        sentenceCollectionView.dropDelegate = self
//        sentenceCollectionView.dragDelegate = self
//        sentenceCollectionView.reorderingCadence = .fast //default value - .immediate
//        sentenceCollectionView.delegate = self
//        sentenceCollectionView.dataSource = self
        
        CardCollectionView.delegate = self
        CardCollectionView.dataSource = self
        sentenceCollectionView.delegate = self
        sentenceCollectionView.dataSource = self
        //CollectionView-1 drag and drop configuration
        self.CardCollectionView.dragInteractionEnabled = true
        self.CardCollectionView.dragDelegate = self
        self.CardCollectionView.dropDelegate = self
        
        //CollectionView-2 drag and drop configuration
        self.sentenceCollectionView.dragInteractionEnabled = true
        self.sentenceCollectionView.dropDelegate = self
        self.sentenceCollectionView.dragDelegate = self
        self.sentenceCollectionView.reorderingCadence = .fast //default value - .immediate
        
        // Do any additional setup after loading the view.
    }
    private func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView)
    {
        let items = coordinator.items
        if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
        {
            var dIndexPath = destinationIndexPath
            if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
            {
                dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
            }
            collectionView.performBatchUpdates({
                if collectionView === self.sentenceCollectionView
                {
                    self.sentenceArray.remove(at: sourceIndexPath.row)
                    self.sentenceArray.insert(item.dragItem.localObject as! Card, at: dIndexPath.row)
                }
                else
                {
                    self.CardsArray.remove(at: sourceIndexPath.row)
                    self.CardsArray.insert(item.dragItem.localObject as! Card, at: dIndexPath.row)
                }
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [dIndexPath])
            })
            coordinator.drop(items.first!.dragItem, toItemAt: dIndexPath)
        }
    }
    
    /// This method copies a cell from source indexPath in 1st collection view to destination indexPath in 2nd collection view. It works for multiple items.
    ///
    /// - Parameters:
    ///   - coordinator: coordinator obtained from performDropWith: UICollectionViewDropDelegate method
    ///   - destinationIndexPath: indexpath of the collection view where the user drops the element
    ///   - collectionView: collectionView in which reordering needs to be done.
    private func copyItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView)
    {
        collectionView.performBatchUpdates({
            var indexPaths = [IndexPath]()
            for (index, item) in coordinator.items.enumerated()
            {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                if collectionView === self.sentenceCollectionView
                {
                    self.sentenceArray.insert(item.dragItem.localObject as! Card, at: indexPath.row)
                }
                else
                {
                    self.CardsArray.insert(item.dragItem.localObject as! Card, at: indexPath.row)
                }
                indexPaths.append(indexPath)
            }
            collectionView.insertItems(at: indexPaths)
        })
    }
}

// MARK: - UICollectionViewDataSource Methods
extension ItemsVC : UICollectionViewDataSource
{
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

// MARK: - UICollectionViewDragDelegate Methods
extension ItemsVC : UICollectionViewDragDelegate
{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem]
    {
        let item = collectionView == CardCollectionView ? self.CardsArray[indexPath.row] : self.sentenceArray[indexPath.row]
        let itemProvider = NSItemProvider(object: item.name as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem]
    {
        let item = collectionView == CardCollectionView ? self.CardsArray[indexPath.row] : self.sentenceArray[indexPath.row]
        let itemProvider = NSItemProvider(object: item.name as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?
    {
        if collectionView == CardCollectionView
        {
            let previewParameters = UIDragPreviewParameters()
            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
            return previewParameters
        }
        return nil
    }
}

// MARK: - UICollectionViewDropDelegate Methods
extension ItemsVC : UICollectionViewDropDelegate
{
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool
    {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal
    {
        if collectionView === self.CardCollectionView
        {
            if collectionView.hasActiveDrag
            {
                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            }
            else
            {
                return UICollectionViewDropProposal(operation: .forbidden)
            }
        }
        else
        {
            if collectionView.hasActiveDrag
            {
                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            }
            else
            {
                return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator)
    {
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath
        {
            destinationIndexPath = indexPath
        }
        else
        {
            // Get last index path of table view.
            let section = collectionView.numberOfSections - 1
            let row = collectionView.numberOfItems(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        switch coordinator.proposal.operation
        {
        case .move:
            self.reorderItems(coordinator: coordinator, destinationIndexPath:destinationIndexPath, collectionView: collectionView)
            break
            
        case .copy:
            self.copyItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
            
        default:
            return
        }
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


