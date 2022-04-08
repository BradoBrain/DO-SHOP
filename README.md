# DO-SHOP
Shopping list App written in SwiftUI

Below you can find Russian and English versions / Ниже вы можете найти русскую и английскую версию.

Hello! This is the first full-fledged project written by me on SwiftUI.
DO SHOP is a shopping list app written for a wife because her favorite app has been removed from the AppStore.
The interface contains:
- button to call the module window to create new list items,
- a module window with text fields for entering data on the planned purchase, pickers for selecting units of measurement and product categories,
- a section of shopping list items that are automatically colored in the color of the category, can be marked with color as purchased (tapGesture), deleted (swipeAction), or moved inside the list (toolBar EditButton).


The application is implemented on the basis of MVVM.
Project sections are located in the DO SHOP project folder:
1. Model -> ItemModel - contains the main model.
2. ViewModel -> ListViewModel - contains the main class, its functions for creating, updating, saving, editing, categorizing and storing list items.
3. View contains views:
- AddButtonView - defines the style of the button for creating a new list item;
- RawItemView - is the layout of the list item;
- AddItemView - contains the view, functions and elements of the module window for adding a new list item;
- ContentView - with the main ForEach loop taking the layout from the RawItemView and integrating the rest of the views.



Всем привет! Это первый полноценный проект написанный мной на SwiftUI. 
DO SHOP - это приложение список покупок, написанное для супруги, потому что её любимое приложение было удалено из AppStore. 
Интерфейс содержит:
- кнопку вызова модульного окна для создания новых пунктов списка,
- модульное окно с тектовыми полями для ввода данных о планируемой покупке, пикерами выбора единиц измерения и категории товара,
- секцию пунктов списка покупок, которые автоматически окрашиваются в цвет категории, могут быть помечены цветом как купленные (tapGesture), удалены (swipeAction), либо перемещены внутри списка (toolBar EditButton). 


Приложение реализовано на базе MVVM. 
В папке проекта DO SHOP располагаются разделы проекта:
1. Model -> ItemModel - содержит основную модель.
2. ViewModel -> ListViewModel - содержит основной класс, его функции по созданию, обновлению, сохранению, редактированию, категоризации и хранению пунктов списка. 
3. View содержит представления:
- AddButtonView - определяет стиль кнопки создания нового пункта списка;
- RawItemView - является макетом пункта списка; 
- AddItemView - содержащит представление, функций и элементы модульного окна добавления нового пункта списка;
- ContentView - с основным циклом ForEach принимающим макет из RawItemView и интеграцией остальных представлений.
