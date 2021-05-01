//
//  ContentView.swift
//  Todo
//
//  Created by MahDi SaeDi on 5/1/21.
//


import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showingAddTodoView : Bool = false
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List(0 ..< 5) { item in
                Text("Hello, World!")
            }//:LIST
            .navigationBarTitle("Todo",displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action:{
                                        self.showingAddTodoView.toggle()
                                    }){
                                        Image(systemName: "plus")
                                    }//: ADD BUTTON
                                    .sheet(isPresented: $showingAddTodoView, content: {
                                        AddTodoView()
                                    })
            )
        }//:NAVIGATION
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
