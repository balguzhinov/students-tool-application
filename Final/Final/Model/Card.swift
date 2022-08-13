//
//  Card.swift
//  Final
//
//  Created by Абай on 21.05.2022.
//

import SwiftUI
import RealmSwift

// Creating Realm Object

class Card: Object,Identifiable{
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
    
    
    
}
