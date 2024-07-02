//
//  todo_listApp.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//
import FirebaseCore
import SwiftUI

@main
struct todo_listApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
