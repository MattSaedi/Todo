//
//  ContentView.swift
//  Todo
//
//  Created by MahDi SaeDi on 5/1/21.
//


import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @State private var showingAddTodoView : Bool = false
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(self.todos,id:\.self){todo in
                        HStack{
                            Text(todo.name ?? "Unknown")
                            Spacer()
                            Text(todo.priority ?? "Unknown")
                        }
                    }//:FOREACH
                    .onDelete(perform:deleteTodo)
                }//:LIST
                .navigationBarTitle("Todo",displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                                        Button(action:{
                                            self.showingAddTodoView.toggle()
                                        }){
                                            Image(systemName: "plus")
                                        }//: ADD BUTTON
                                        .sheet(isPresented: $showingAddTodoView, content: {
                                            AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                                        })
                )
                //MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                }
            }//:ZSTACK
        }//:NAVIGATION
    }
    //MARK: - FUNCTIONS
    private func deleteTodo(at offsets:IndexSet){
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
            
        }
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
