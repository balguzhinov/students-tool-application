//
//  AddPageView.swift
//  Final
//
//  Created by Абай on 21.05.2022.
//

import SwiftUI

struct AddPageView: View {
    @EnvironmentObject var modelData : DBViewModel
    @Environment(\.presentationMode) var presentation
    var body: some View {
        
        NavigationView{
            List{
                Section(header: Text("Название")){
                    TextField("", text: $modelData.title)
                }
                
                Section(header: Text("Описание")){
                    TextField("", text: $modelData.detail)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(modelData.updateObject == nil ? "Добавить" : "Обновить")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button(action: {modelData.addData(presentation: presentation)}, label: {
                        Text("Готово")
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("Отменить")
                    })
                }
            }
        }
        .onAppear(perform: modelData.setUpInitialData)
        .onDisappear(perform: modelData.deInitData)
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
