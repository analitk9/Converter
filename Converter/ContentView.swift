//
//  ContentView.swift
//  Converter
//
//  Created by Denis Evdokimov on 5/21/24.
//
import SwiftUI

struct ContentView: View {
    private let kindOfunits = ["Температура", "Расстояние", "Время", "Объем"]
    private let units: [String:[String]] =
        [
        "Температура":["цельсий","фаренгейт","кельвин"],
        "Расстояние":["метры","километры","футы","ярды","миля"],
        "Время":["секунды","минуты","часы"],
        "Объем":["милл","литры","кружки","пинты","галлоны"]
        ]
    private var firstUnits: [String] {
         let selectUnitName = kindOfunits[selectedUnit]
            
        return units[selectUnitName] ?? ["unknown1","unknown2","unknown3"]
    }
    private var secondUnits: [String] {
         let selectUnitName = kindOfunits[selectedUnit]
        return (units[selectUnitName]?.filter{$0 != units[selectUnitName]?[firstSelect]}) ??  ["unknown1","unknown2","unknown3"]
    }
   
    @State private var selectedUnit = 0 //номер выбранного вида измерений
    
    @State private var firstSelect = 0
    @State private var secondSelect = 0
    
    @State private var firstValue: String = ""
    @FocusState private var isFocusFirstVal: Bool
    
    private var result: String {
        let convertKindFirst = UnitsList.init(rawValue: (firstUnits[firstSelect]))
        let convertKindSecond = UnitsList.init(rawValue: (secondUnits[secondSelect]))
       
        guard let kindFirst = convertKindFirst,
              let kindSecond  = convertKindSecond,
              let val = Double(firstValue) else { return "" }
        let measur = Measure(firstUnit: kindFirst, secondUnit: kindSecond, value: val).convert()
        return "\(measur)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Единицы измерений")){
                    Picker("Единицы измерений",selection: $selectedUnit){
                        ForEach(0..<kindOfunits.count, id: \.self) {
                            Text("\(self.kindOfunits[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("что преобразовываем")){
                    Picker("", selection: $firstSelect) {
                        ForEach(0..<firstUnits.count, id: \.self) {
                            Text("\(self.firstUnits[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("во что преобразовываем")) {
                    Picker("", selection: $secondSelect) {
                        ForEach(0..<secondUnits.count, id: \.self){
                            Text("\(self.secondUnits[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Преобразуемое значение: \(self.firstUnits[self.firstSelect])")) {
                    TextField("значение", text: $firstValue)
                        .keyboardType(.numberPad)
                        .focused($isFocusFirstVal)
                }
                Section(header: Text("полученное значение: \(self.secondUnits[self.secondSelect])")){
                    Text(result)
                }
            }
              .navigationBarTitle(Text("Конвертация"))
              .toolbar(content: {
                  if isFocusFirstVal {
                      Button {
                          isFocusFirstVal = false
                      } label: {
                          Text("Done")
                      }

                  }
              })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
