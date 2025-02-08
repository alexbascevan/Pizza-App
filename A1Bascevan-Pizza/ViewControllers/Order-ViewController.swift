//
//  Order-ViewController.swift
//  A1Bascevan-Pizza
//
//  Created by Alexander Bascevan on 2025-01-21.
//

import UIKit

class Order_ViewController: UIViewController {

    // Outlets for switches
    @IBOutlet var pepperoniSwitch: UISwitch!
    @IBOutlet var sausageSwitch: UISwitch!
    @IBOutlet var groundBeefSwitch: UISwitch!
    @IBOutlet var mushroomsSwitch: UISwitch!
    @IBOutlet var greenPeppersSwitch: UISwitch!
    @IBOutlet var tomatoesSwitch: UISwitch!
    
    // Outlet for address
    @IBOutlet var addressTextField: UITextField!

    
    // Outlet for segmented control
    @IBOutlet var sizeSegmentedControl: UISegmentedControl!
    
    // Outlet for the order label
    @IBOutlet var orderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateOrderLabel() // Initial update
    }

    // Function to update the order label
    func updateOrderLabel() {
        let sizes = ["Small", "Medium", "Large"]
        let selectedSize = sizes[sizeSegmentedControl.selectedSegmentIndex]

        var toppings: [String] = []
        if pepperoniSwitch.isOn { toppings.append("Pepperoni") }
        if sausageSwitch.isOn { toppings.append("Sausage") }
        if groundBeefSwitch.isOn { toppings.append("Ground Beef") }
        if mushroomsSwitch.isOn { toppings.append("Mushrooms") }
        if greenPeppersSwitch.isOn { toppings.append("Green Peppers") }
        if tomatoesSwitch.isOn { toppings.append("Tomatoes") }

        let toppingsText = toppings.isEmpty ? "No toppings" : toppings.joined(separator: ", ")

        // Get address from text field
        let addressText = addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let addressDisplay = addressText.isEmpty ? "Address: (Not provided)" : "Address: \(addressText)"

        // Set label text with newline
        orderLabel.text = "Order: \(selectedSize) Pizza with \(toppingsText)\n\(addressDisplay)"

    }

    // Action method for switches
    @IBAction func toppingSwitchChanged(_ sender: UISwitch) {
        updateOrderLabel()
    }

    // Action method for segmented control
    @IBAction func sizeSegmentChanged(_ sender: UISegmentedControl) {
        updateOrderLabel()
    }
    
    // Update label when address is entered
    @IBAction func addressChanged(_ sender: UITextField) {
        updateOrderLabel()
    }
}
