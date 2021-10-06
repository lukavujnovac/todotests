//
//  Card.swift
//  todotest
//
//  Created by Luka Vujnovac on 06.10.2021..
//

import SwiftUI
import RealmSwift

class Card: Object, Identifiable{
    @objc dynamic var id: Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
}
