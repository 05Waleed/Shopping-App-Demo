//
//  NetworkManager.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 31.12.2023.
//

import UIKit

class NetworkManager {
    // MARK: - Public Methods
    
    /// Fetch shopping items from a remote API.
    ///
    /// - Parameter completion: A closure to be executed upon completion, providing a result containing either an array of ShoppingModel or an error.
    class func fetchShoppingItems(completion: @escaping (Result<[ShoppingModel], Error>) -> Void) {
        // Create a URL from the specified API endpoint
        guard let itemsURL = URL(string: API.itemsURL) else {
            // If the URL is invalid, invoke the completion handler with a failure result
            completion(.failure(NetworkError.invalidURL))
            return
        }

        // Perform a data task to fetch data from the specified URL
        URLSession.shared.dataTask(with: itemsURL) { data, _, error in
            // Check for any error that may have occurred during the data task
            if let error = error {
                // If an error is present, invoke the completion handler with a failure result
                completion(.failure(error))
                return
            }

            // Check if data is available
            if let data = data {
                do {
                    // Decode the JSON data into an array of ShoppingModel objects
                    let decoder = try JSONDecoder().decode([ShoppingModel].self, from: data)
                    
                    // Invoke the completion handler with a success result containing the decoded data
                    completion(.success(decoder))
                    
                    // Print the decoded data for debugging purposes
                    print(decoder)
                } catch {
                    // If there's an error during decoding, invoke the completion handler with a failure result
                    completion(.failure(error))
                }
            }
        }.resume() // Start the data task
    }
}

// Enumeration to represent network-related errors
enum NetworkError: Error {
    case invalidURL
}
