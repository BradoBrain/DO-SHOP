//
//  ContentView1.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var addNewItem = false
    
    init() {
        // Background of ListView
        UITableView.appearance().backgroundColor = UIColor(Color("background"))
        // Color of navigationTitle Large
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("bread"))]
        // Color of navigationTitle Inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("bread"))]
    }
    
    var body: some View {
        VStack {
            ZStack {
            List {
                ForEach(listViewModel.sortedItem) { item in
                    RawItemView(title: item, number: item, measurement: item, sorter: item)

                    
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color("background"))
                        .padding(20)
                        .background(item.isBought ? Color("finished") : listViewModel.markedItems(categories: item.category))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.vertical, 0)
                        //.shadow(color: .gray, radius: 5, x: 0, y: 5)
                    
                    // Function to change item status
                        .onTapGesture {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                    
                    
                } // End of ForEach body
                
                // Delete function
                .onDelete(perform: listViewModel.deleteItem)
                // Moving function
                .onMove(perform: listViewModel.moveItem)
            }
            .listStyle(PlainListStyle())
            .navigationTitle(LocalizedStringKey("Shoping List")).foregroundColor(.white)
            .toolbar { EditButton().foregroundColor(Color("default")) }
                VStack {
            Spacer()
            // Button to create a new item
            Button(action: {addNewItem.toggle()}, label: {AddButtonView()})
                .sheet(isPresented: $addNewItem) {
                    NavigationView { AddItemView() }
                }
                }
        } .background(Color("background"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
            .environmentObject(ListViewModel())
    }
}
