//
//  RawItemView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct RawItemView: View {
    @State var title:           ItemModel
    @State var number:          ItemModel
    @State var measurement:     ItemModel
    @State var sorter:          ItemModel
    
    var body: some View {
        HStack {
            Text(title.title)
                .padding(.horizontal)
            
            Spacer()
            
            Text(number.number)
            
            Text(measurement.measurement)
                .padding(.horizontal, 18)
        } //.padding(.vertical, 6)
    }
}


struct RawItemView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Bread", number: "1", isBought: true, category: "Fruit", measurement: "g", sorter: 0)
    static var item2 = ItemModel(title: "Milk", number: "0,5", isBought: false, category: "Milk", measurement: "l", sorter: 1)
    
    static var previews: some View {
        Group {
            RawItemView(title: item1, number: item1, measurement: item1, sorter: item1)
            RawItemView(title: item2, number: item2, measurement: item2, sorter: item2)
        } .previewLayout(.sizeThatFits)
    }
}
