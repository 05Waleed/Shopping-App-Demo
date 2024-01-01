//
//  UIImageView+Extensions.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 31.12.2023.
//

import UIKit

extension UIImageView {
    // MARK: - Public Methods
    
    /// Load an image asynchronously from a URL with an optional placeholder.
    ///
    /// - Parameters:
    ///   - urlString: The URL string from which to load the image.
    ///   - placeholder: An optional placeholder image to be displayed initially.
    func loadImage(from urlString: String, withPlaceholder placeholder: UIImage? = nil) {
        // Set the placeholder image initially
        self.image = placeholder
        
        // Validate and create a URL from the given string
        guard let url = URL(string: urlString) else {
            // Print an error message if the URL is invalid
            print("Invalid image URL")
            return
        }
        
        // Use URLSession to fetch image data from the URL
        URLSession.shared.dataTask(with: url) { data, _, error in
            // Handle any error that may occur during the data task
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            // Check if image data is available
            if let imageData = data {
                // Update the UI on the main thread with the loaded image data
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }.resume() // Start the data task
    }
}
