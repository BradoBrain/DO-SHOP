//
//  AddButtonView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        // Button stile
        ZStack {
            
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color("bread"))
                //.shadow(color: .gray, radius: 5)
            
            
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
            .previewLayout(.sizeThatFits)
    }
}
