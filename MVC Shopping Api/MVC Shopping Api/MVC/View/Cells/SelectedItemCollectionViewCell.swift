//
//  SelectedItemCollectionViewCell.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 01.01.2024.
//

import UIKit

class SelectedItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var itemSoldLbl: UILabel!
    @IBOutlet weak var itemReviewsLbl: UILabel!
    @IBOutlet weak var itemRatingLbl: UILabel!
    @IBOutlet weak var itemDetailLbl: UITextView!
    @IBOutlet weak var itemHeadingLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    // MARK: - Public Methods
    
    /// Configure the cell with the details of a shopping item for the collection view.
    ///
    /// - Parameter item: The shopping item to display in the cell.
    func configure(with item: ShoppingModel) {
        itemHeadingLbl.text = item.title
        itemDetailLbl.text = item.description
        itemRatingLbl.text = "\(item.rating.rate) Ratings"
        itemReviewsLbl.text = "\(item.rating.count)k Reviews"
        itemSoldLbl.text = "\(item.rating.count)k Sold"
        itemImage.loadImage(from: item.image)
    }
}
