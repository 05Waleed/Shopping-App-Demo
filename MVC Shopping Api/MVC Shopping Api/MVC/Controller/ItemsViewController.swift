//
//  ViewController.swift
//  MVC Shopping Api
//
//  Created by Muhammad Waleed on 31.12.2023.
//

import UIKit

class ItemsViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Array to store the fetched shopping items.
    var shoppingItems: [ShoppingModel] = []
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the custom table view cell from the XIB.
        registerXib()
        // Fetch and update data for the table view.
        updateTableView()
    }

    // MARK: - Private Methods
    
    /// Register the custom XIB for the table view cell.
    private func registerXib() {
        itemsTableView?.register(UINib(nibName: "ItemsTableViewRow", bundle: nil), forCellReuseIdentifier: "ItemsTableViewRow")
    }

    /// Fetch shopping items from the network and update the table view.
    private func updateTableView() {
        NetworkManager.fetchShoppingItems { [weak self] result in
            switch result {
            case .success(let items):
                // Update the data source and reload the table view on the main thread.
                self?.shoppingItems = items
                DispatchQueue.main.async {
                    self?.itemsTableView.reloadData()
                }
            case .failure(let error):
                // Handle the failure case by logging an error message.
                print("Error fetching shopping items: \(error)")
            }
        }
    }
}

// MARK: - Table View Delegate and Data Source

extension ItemsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of shopping items for the table view.
        return shoppingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a custom table view cell and configure it with shopping item data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewRow", for: indexPath) as! ItemsTableViewCell

        let item = shoppingItems[indexPath.row]
        cell.configure(with: item)
        cell.loadImage(from: item.image)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the selected row and navigate to the selected item view controller.
        itemsTableView.deselectRow(at: indexPath, animated: true)
        navigateToSelectedItemVc(at: indexPath)
    }
    
    // MARK: - Navigation
    
    /// Navigate to the SelectedItemViewController with the selected shopping item.
    private func navigateToSelectedItemVc(at indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "SelectedItemViewController") as! SelectedItemViewController
        vc.selectedItems = shoppingItems[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
