//
//  AddItemView.swift
//  DO SHOP
//
//  Created by Artem Vinogradov on 08.04.2022.
//

import SwiftUI

struct AddItemView: View {
    // To hide a modal window
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var itemName: String = ""
    @State var itemNum: String = ""
    // For Alert
    @State var alertText = ""
    @State var showAlert = false
    // For Pickers
    @State var measureSelect: String = "item"
    @State var categorySelect: String = "None"
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack {
                // Field to enter a Name of Item
                TextField("What do you want?", text: $itemName).padding()
                    .background()
                    .cornerRadius(30)
                    .frame(width: UIScreen.main.bounds.width - 20)


                // Field to enter a Number of Item
                TextField("How many do you want?", text: $itemNum).keyboardType(.decimalPad)
                    .padding()
                    .background()
                    .cornerRadius(30)
                    .frame(width: UIScreen.main.bounds.width - 20)
                HStack{
                    //Text("Measurement:")
                    
                //Picker for measurement
                    Picker("Measurement",
                       selection: $measureSelect) {
                    Text("Pound").tag("lb")
                    Text("Ounce").tag("oz")
                    Text("Gram").tag("g")
                    Text("Kilogram").tag("kg")
                    Text("Item").tag("item")
                    Text("Pint").tag("pt")
                    Text("Litre").tag("l")
                    Text("Gallon").tag("gal")
                    Text("Millilitre").tag("ml")
                    } .pickerStyle(.wheel)
                    .colorMultiply(.black)
                }
                //Picker for categories
                Picker("Categories",
                       selection: $categorySelect) {
                    Group {
                    Text("Alcohol").tag("Alcohol")
                    Text("Bread & Flour").tag("Bread & Flour")
                    Text("Drink & Juice").tag("Drink & Juice")
                    Text("Egg").tag("Egg")
                    Text("Fish").tag("Fish")
                    Text("Fruit").tag("Fruit")
                    Text("Green vagetables").tag("Green vagetables")
                    Text("Meat").tag("Meat")
                    Text("None").tag("None")
                    Text("Milk").tag("Milk")
                    }
                    Group {
                    Text("Mushrooms").tag("Mushrooms")
                    Text("Nuts, Seeds & Cereals").tag("Nuts, Seeds & Cereals")
                    Text("Fat & Oil").tag("Fat & Oil")
                    Text("Seafood").tag("Seafood")
                    Text("Soy").tag("Soy")
                    Text("Sweets & Candy").tag("Sweets & Candy")
                    Text("Vagetables").tag("Vagetables")
                    }
                } .pickerStyle(.wheel)
//                    .frame(width: UIScreen.main.bounds.width - 20, height: 130)
//                    .padding()
                // Button to save a New Item and close a Modal View
                Button(action: {
                    if fieldIsNotEmpty() == true {
                        presentationMode.wrappedValue.dismiss()
                        saveButtonPressed()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color("default"))
                            .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                            .padding(4)
                            .shadow(color: .gray, radius: 5, y: 7)
                        
                        Text("SAVE")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                })
                Spacer()
            }
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    //Func to add new Item
    func saveButtonPressed() {
        listViewModel.addItem(title: itemName, number: itemNum, isBought: false, stroken: false, category: categorySelect, measurement: measureSelect)
        
    }
    
    //Func empty
    func fieldIsNotEmpty() -> Bool {
        if itemName.isEmpty || itemNum.isEmpty {
            alertText = "Enter a Data"
            showAlert.toggle()
            return false
        }
        return true
    }
      
    //Get Alert
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