//
//  ItemModel.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id:             String
    let title:          String
    let number:         String
    let isBought:       Bool
    let category:       String
    let measurement:    String
    let sorter:         Int
    
    init(id:            String = UUID().uuidString,
         title:         String,
         number:        String,
         isBought:      Bool,
         category:      String,
         measurement:   String,
         sorter:        Int
    ) {
        self.id             =  id
        self.title          = title
        self.number         = number
        self.isBought       = isBought
        self.category       = category
        self.measurement    = measurement
        self.sorter         = sorter
    }
    
    // Function to update an item completion
    func updateItem() -> ItemModel {
        return ItemModel(id: UUID().uuidString, title: title, number: number, isBought: !isBought, category: category, measurement: measurement, sorter: isBought ? 1 : 0)
    }

}
