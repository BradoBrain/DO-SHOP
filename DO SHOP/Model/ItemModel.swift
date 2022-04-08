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
    let strikethrough:  Bool
    let category:       String
    let measurement:    String
    
    init(id:            String = UUID().uuidString,
         title:         String,
         number:        String,
         isBought:      Bool,
         strikethrough: Bool,
         category:      String,
         measurement:   String
    ) {
        self.id             =  id
        self.title          = title
        self.number         = number
        self.isBought       = isBought
        self.strikethrough  = strikethrough
        self.category       = category
        self.measurement    = measurement
    }
    
    // Function to update an item completion
    func updateItem() -> ItemModel {
        return ItemModel(id: UUID().uuidString, title: title, number: number, isBought: !isBought, strikethrough: !strikethrough, category: category, measurement: measurement)
    }

}
