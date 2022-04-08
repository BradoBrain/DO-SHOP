//
//  ListViewModel.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    // Deleting Item Function
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Move Item Funtion
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // Add new Item Func
    func addItem(title: String, number: String, isBought: Bool, stroken: Bool, category: String, measurement: String) {
        let newItem = ItemModel(title: title, number: number, isBought: false, stroken: false, category: category, measurement: measurement)
        items.append(newItem)
    }
    
    // Item Status
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateItem()
        }
    }
    
    // save func
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    //markedItem func
    func markedItems(categories: String) -> Color {
        switch categories {
        case "Alcohol":
            return Color("alcohol")
        case "Bread & Flour":
            return Color("bread")
        case "Drink & Juice":
            return Color("drink")
        case "Egg":
            return Color("egg")
        case "Fish":
            return Color("fish")
        case "Fruit":
            return Color("fruit")
        case "Green vagetables":
            return Color("greenvagetable")
        case "Meat":
            return Color("meat")
        case "Milk":
            return Color("milk")
        case "Mushrooms":
            return Color("mushroom")
        case "Nuts, Seeds & Cereals":
            return Color("nut")
        case "Fat & Oil":
            return Color("oil")
        case "Seafood":
            return Color("seafood")
        case "Soy":
            return Color("soy")
        case "Sweets & Candy":
            return Color("sweet")
        case "Vagetables":
            return Color("vagetable")
        default:
            return Color("default")
        }
    }
}
