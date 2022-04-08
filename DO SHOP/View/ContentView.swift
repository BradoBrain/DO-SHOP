//
//  ContentView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var addNewItem = false
    @State private var strikethrough = false
    
    // Background of ListView
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("background"))
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(listViewModel.items) { item in
                        RawItemView(title: item, number: item, measurement: item, strikethrough: item)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color("background"))
                            .padding(10)
                            .background(item.isBought ? Color("finished") : listViewModel.markedItems(categories: item.category))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.vertical, 5)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        // Function to change item status
                            .onTapGesture {
                                withAnimation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0)) {
                                    self.strikethrough.toggle()
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    // Delete function
                    .onDelete(perform: listViewModel.deleteItem)
                    // Moving function
                    .onMove(perform: listViewModel.moveItem)
                } .listStyle(GroupedListStyle())
                    .navigationTitle("Let's do shop").foregroundColor(.white)
                    .toolbar {
                        EditButton().foregroundColor(Color("default"))
                    }
            }
            
            // Button to create a new item
            Button(action: {addNewItem.toggle()}, label: {AddButtonView()})
                .sheet(isPresented: $addNewItem) {
                    NavigationView {
                        AddItemView()
                    }
                }
        } .background(Color("background"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .environmentObject(ListViewModel())
    }
}
