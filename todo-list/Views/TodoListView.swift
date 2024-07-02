//
//  TodoListView.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemsView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.showingNewItemView){
            NewItemView(newItemPresented: $viewModel.showingNewItemView)
        }
    }
}

#Preview {
    TodoListView(userId: "1JA6VnzYImbxTyUTnTZLcZ5sV2C3")
}
