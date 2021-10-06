//
//  CardCell.swift
//  todotest
//
//  Created by Luka Vujnovac on 06.10.2021..
//

import SwiftUI

struct CardCell: View {
    
    var card: Card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(height: 60, alignment: .center)
            .shadow(radius: 10)
            .padding()
            .overlay { 
                Text(card.title)
            }
    }
}

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CardCell(card: )
//    }
//}
