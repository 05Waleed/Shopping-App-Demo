//
//  ItemsTableViewCell.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 31.12.2023.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var itemDescriptionLbl: UILabel!
    @IBOutlet weak var itemRatingLbl: UILabel!
    @IBOutlet weak var itemCategoryLbl: UILabel!
    @IBOutlet weak var itemHeadingLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!

    // MARK: - Public Methods
    
    /// Configure the cell with the details of a shopping item.
    ///
    /// - Parameter item: The shopping item to display in the cell.
    func configure(with item: ShoppingModel) {
        itemHeadingLbl.text = item.title
        itemPriceLbl.text = "$\(item.price)"
        itemDescriptionLbl.text = item.description
        itemRatingLbl.text = "★ \(item.rating.rate)"
        itemCategoryLbl.text = "\(item.category.rawValue)"
    }
    
    /// Load an image from the given URL and set it in the cell's image view.
    ///
    /// - Parameter url: The URL of the image to be loaded.
    func loadImage(from url: String) {
        itemImage.loadImage(from: url)
    }
}
