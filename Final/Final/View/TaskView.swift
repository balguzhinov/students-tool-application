//
//  TaskView.swift
//  Final
//
//  Created by Абай on 21.05.2022.
//

import SwiftUI

struct TaskView: View {
    @StateObject var modelData = DBViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 15){
                    ForEach(modelData.cards){ card in
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text(card.title)
                            Text(card.detail)
                                .font(.caption)
                                .foregroundColor(.gray)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                       
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("Удалить")
                            })
                            
                            Button(action: {
                                modelData.updateObject = card
                                modelData.openNewPage.toggle()
                            }, label: {
                                Text("Обновить")
                            })
                        })
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {modelData.openNewPage.toggle()}){
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $modelData.openNewPage, content: {
                AddPageView()
                    .environmentObject(modelData)
            })
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
