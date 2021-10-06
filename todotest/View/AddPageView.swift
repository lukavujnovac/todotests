//
//  AddPageView.swift
//  todotest
//
//  Created by Luka Vujnovac on 06.10.2021..
//

import SwiftUI

struct AddPageView: View {
    
    @EnvironmentObject var modelData: DBViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            List{
                Section { 
                    TextField("", text: $modelData.title)
                } header: { 
                    Text("title")
                }
                
                Section { 
                    TextField("", text: $modelData.detail)
                } header: { 
                    Text("detail")
                }
                
                HStack{
                    Button(action: modelData.addData) { 
                        Text("Done")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {presentation.wrappedValue.dismiss()} ) { 
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                
                .listStyle(GroupedListStyle())
                .navigationTitle("Add Data")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
