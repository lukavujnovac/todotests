//
//  Home.swift
//  todotest
//
//  Created by Luka Vujnovac on 06.10.2021..
//

import SwiftUI

struct Home: View {
    
    @StateObject var modelData = DBViewModel()
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                VStack {
                    ForEach(modelData.cards) {card in
                        CardCell(card: card)
                            .contextMenu{
                                Button { 
                                    modelData.deleteData(cardToDelete: card)
                                } label: { 
                                    Text("Delete")
                                        .foregroundColor(.red)
                                }
                                
                                Button { 
                                    return
                                } label: { 
                                    Text("Cancel")   
                                }
                            }
                    }
                }                
            }.navigationTitle("Tasks")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) { 
                        Button { 
                            modelData.openNewPage.toggle()
                        } label: { 
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $modelData.openNewPage) { 
                    AddPageView()
                        .environmentObject(modelData)
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

