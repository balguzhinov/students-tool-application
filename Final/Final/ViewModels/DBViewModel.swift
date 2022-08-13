//
//  DBViewModel.swift
//  Final
//
//  Created by Абай on 21.05.2022.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
   
    @Published var title = ""
    @Published var detail = ""
    
    @Published var openNewPage = false
    
    
    // Fetched Data
    @Published var cards : [Card] = []
    
    //Updating Data
    @Published var updateObject : Card?
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        
        guard let dbRef = try? Realm() else {return}
        
        let results = dbRef.objects(Card.self)
        
        self.cards = results.compactMap({(card) -> Card? in
            return card
        })
    }
    
    func addData(presentation: Binding<PresentationMode>){
        let card = Card()
        card.title = title
        card.detail = detail
        
        guard let dbRef = try? Realm() else {return}
        
        try? dbRef.write{
            
            
            guard let availabeObject = updateObject else{
                dbRef.add(card)
                
                fetchData()
                
                return
            }
            availabeObject.title = title
            availabeObject.detail = detail
        }
        
        presentation.wrappedValue.dismiss()
    }
    
    func deleteData(object: Card){
        guard let dbRef = try? Realm() else{return}
        
        try? dbRef.write{
            dbRef.delete(object)
            
            fetchData()
        }
    }
    
    
    func setUpInitialData(){
        // Updation
        
        
        guard let updateData = updateObject else{return}
        
        //Check if it is update object and assigning values
        
        title = updateData.title
        detail = updateData.detail
    }
    
    func deInitData(){
        title = ""
        detail = ""
    }
}
