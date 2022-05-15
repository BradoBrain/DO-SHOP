//
//  AddItemView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var itemName: String                 = ""
    @State var itemNum: String                  = ""
    // For Alert
    @State var alertText: LocalizedStringKey    = ""
    @State var showAlert                        = false
    // For Pickers
    @State var measureSelect: String            = "it"
    @State var categorySelect: String           = "None"
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack {
                // Field to enter a name of item
                TextField(LocalizedStringKey("What would you like to buy?"), text: $itemName).padding()
                    .background()
                    .cornerRadius(30)
                    .frame(width: UIScreen.main.bounds.width - 20)
                
                // Field to enter a number of item
                TextField(LocalizedStringKey("How many would you like?"), text: $itemNum).keyboardType(.decimalPad)
                    .padding()
                    .background()
                    .cornerRadius(30)
                    .frame(width: UIScreen.main.bounds.width - 20)
                
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        //Picker for measurement
                        Picker("Measurement",
                               selection: $measureSelect) {
                            Text(LocalizedStringKey("Pound")).tag("lb")
                            Text(LocalizedStringKey("Ounce")).tag("oz")
                            Text(LocalizedStringKey("Gram")).tag("g")
                            Text(LocalizedStringKey("Kilogram")).tag("kg")
                            Text(LocalizedStringKey("Item")).tag("it")
                            Text(LocalizedStringKey("Pint")).tag("pt")
                            Text(LocalizedStringKey("Litre")).tag("l")
                            Text(LocalizedStringKey("Gallon")).tag("gal")
                            Text(LocalizedStringKey("Millilitre")).tag("ml")
                        }
                               .pickerStyle(.wheel)
                               .frame(maxWidth: geometry.size.width / 3)
                               .clipped()
                        
                        Divider()
                            .frame(height: 150)
                        
                        //Picker for categories
                        Picker("Categories",
                               selection: $categorySelect) {
                            Group {
                                Text(LocalizedStringKey("Alcohol")).tag("Alcohol")
                                Text(LocalizedStringKey("Bread & Flour")).tag("Bread & Flour")
                                Text(LocalizedStringKey("Drink & Juice")).tag("Drink & Juice")
                                Text(LocalizedStringKey("Egg")).tag("Egg")
                                Text(LocalizedStringKey("Fish")).tag("Fish")
                                Text(LocalizedStringKey("Fruit")).tag("Fruit")
                                Text(LocalizedStringKey("Green vagetables")).tag("Green vagetables")
                                Text(LocalizedStringKey("Meat")).tag("Meat")
                                Text(LocalizedStringKey("None")).tag("None")
                                Text(LocalizedStringKey("Milk")).tag("Milk")
                            }
                            Group {
                                Text(LocalizedStringKey("Mushrooms")).tag("Mushrooms")
                                Text(LocalizedStringKey("Nuts, Seeds & Cereals")).tag("Nuts, Seeds & Cereals")
                                Text(LocalizedStringKey("Fat & Oil")).tag("Fat & Oil")
                                Text(LocalizedStringKey("Seafood")).tag("Seafood")
                                Text(LocalizedStringKey("Soy")).tag("Soy")
                                Text(LocalizedStringKey("Sweets & Candy")).tag("Sweets & Candy")
                                Text(LocalizedStringKey("Vagetables")).tag("Vagetables")
                            }
                        }
                               .pickerStyle(.wheel)
                               .frame(maxWidth: geometry.size.width / 1.5)
                               .clipped()
                    }
                } .frame(height: 200)
                
                // Button to save a new item and close the AddItemView
                Button(action: {
                    if fieldIsNotEmpty() == true {
                        presentationMode.wrappedValue.dismiss()
                        saveButtonPressed()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color("bread"))
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(4)
                            //.shadow(color: .gray, radius: 5, y: 7)
                        
                        Text(LocalizedStringKey("SAVE"))
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                })
                Spacer()
            }
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    // Add a new item
    func saveButtonPressed() {
        listViewModel.addItem(title: itemName, number: itemNum, isBought: false, category: categorySelect, measurement: measureSelect, sorter: 1)
        
    }
    
    // Checking: Are the fields empty
    func fieldIsNotEmpty() -> Bool {
        if itemName.isEmpty || itemNum.isEmpty {
            alertText = "Enter a Data"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    // Showing the alert
    func getAlert() -> Alert {
        return Alert(title: Text(alertText))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .environmentObject(ListViewModel())
    }
}
