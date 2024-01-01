//
//  SelectedItemViewController.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 01.01.2024.
//

import UIKit

class SelectedItemViewController: UIViewController {
    
    // MARK: - Properties
    
    /// The selected shopping item to display details.
    var selectedItems: ShoppingModel?
    
    // MARK: - Outlets
    
    @IBOutlet weak var buyNowImageBackView: UIView!
    @IBOutlet weak var buyNowBackView: UIView!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up UI elements and display total price.
        setupUIElements()
    }
    
    // MARK: - Private Methods
    
    /// Configure the appearance of UI elements.
    private func setupUIElements() {
        // Round corners and set masked corners for specific views.
        backView.layer.cornerRadius = 15
        buyNowBackView.layer.cornerRadius = 15
        buyNowBackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        buyNowImageBackView.layer.cornerRadius = 15
        buyNowImageBackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        // Update the total price label.
        updateTotalPrice()
    }
    
    /// Update the total price label with the selected item's price.
    private func updateTotalPrice() {
        if let price = selectedItems?.price {
            totalPriceLbl.text = "$\(price)"
        }
    }
}

// MARK: - Collection View Data Source and Delegate

extension SelectedItemViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue a cell and configure it with the selected item's details.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectedItemCollectionViewCell
        guard let item = selectedItems else { return UICollectionViewCell() }
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size of each item in the collection view.
        return CGSize(width: 392, height: 573)
    }
}
