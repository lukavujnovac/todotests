//
//  DBViewModel.swift
//  todotest
//
//  Created by Luka Vujnovac on 06.10.2021..
//

import Foundation
import RealmSwift

class DBViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var detail: String = ""
    
    @Published var openNewPage: Bool = false
    
    @Published var cards: [Card] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else  {return}
        
        let results = dbRef.objects(Card.self)
        
        self.cards = results.compactMap({ card in
            return card
        })
    }
    
    func deleteData(cardToDelete: Card) {
        //moras nac koji triba izbrisat
        guard let dbRef = try? Realm() else {return}
        try? dbRef.write{
            dbRef.delete(cardToDelete)
            
            fetchData()
        }
    }
    
    func addData() {
        let card = Card()
        card.title = title
        card.detail = detail
        
        
        guard let dbRef = try? Realm() else {return}
        
        try? dbRef.write {
            dbRef.add(card)
            
            self.openNewPage = false
            self.title = ""
            
            fetchData()
        }
    }
}
