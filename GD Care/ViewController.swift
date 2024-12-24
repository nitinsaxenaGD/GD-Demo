//
//  ViewController.swift
//  GD Care
//
//  Created by Admin on 24/12/24.
//

import UIKit

class ViewController: UIViewController {
@IBOutlet var collectionView: UICollectionView!
    let barItem = ["Home","Test","Tab","Profile","Conctact"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        print(collectionView.frame.width)
        print(collectionView.frame.height)
        
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return barItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItems: CGFloat = 4
           
           // Get the flow layout
           let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
           
           // Define the spacing and insets
           let minimumSpacing: CGFloat = flowLayout?.minimumInteritemSpacing ?? 10
           let sectionInsets: UIEdgeInsets = flowLayout?.sectionInset ?? .zero
           
           // Calculate total horizontal spacing
           let totalHorizontalSpacing = (numberOfItems - 1) * minimumSpacing + sectionInsets.left + sectionInsets.right
           
           // Calculate available width
           let availableWidth = collectionView.bounds.width - totalHorizontalSpacing
           
           // Calculate item width
           let itemWidth = availableWidth / numberOfItems
           
           // Calculate available height, accounting for top and bottom insets
           let availableHeight = collectionView.bounds.height - sectionInsets.top - sectionInsets.bottom
           
           // Adjust item height based on aspect ratio (e.g., 4:5 aspect ratio)
           let itemHeight = itemWidth * 0.8  // For 4:5 aspect ratio
           
           // If item height exceeds available height, adjust to fit
           if itemHeight > availableHeight {
               return CGSize(width: itemWidth, height: availableHeight)
           }
           
           // Print the calculated values for debugging
           print("Available Width: \(availableWidth), Item Width: \(itemWidth), Available Height: \(availableHeight), Item Height: \(itemHeight)")
           
           // Return the item size
           return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
}
