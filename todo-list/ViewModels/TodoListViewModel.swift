//
//  TodoListViewModel.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//
import FirebaseFirestore
import Foundation

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
