//
//  RawItemView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct RawItemView: View {
    @State var title: ItemModel
    @State var number: ItemModel
    @State var measurement: ItemModel
    @State var stroken: ItemModel
    
    var body: some View {
        ZStack {
            HStack {
                Text(title.title)
                    .strikethrough(stroken.stroken, color: .white)
                    .padding(.horizontal)
                    
                
                Spacer()
                
                Text(number.number)
                    .strikethrough(stroken.stroken, color: .white)
                
                Text(measurement.measurement)
                // Add a strikethrough
                    .strikethrough(stroken.stroken, color: .white)
                    .padding(.horizontal, 18)
                
            }
            .padding(.vertical, 6)
        }
        
    }
}


struct RawItemView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Bread", number: "1", isBought: true, stroken: true, category: "Fruit", measurement: "g")
    static var item2 = ItemModel(title: "Milk", number: "0,5", isBought: false, stroken: false, category: "Milk", measurement: "l")
    
    static var previews: some View {
        Group {
            RawItemView(title: item1, number: item1, measurement: item1, stroken: item1)
            RawItemView(title: item2, number: item2, measurement: item2, stroken: item2)
        } .previewLayout(.sizeThatFits)
    }
}
