//
//  TodoListItemsViewModel.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListItemsViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
