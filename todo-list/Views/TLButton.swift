//
//  TLButton.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        })
        .padding(25)
    }
}

#Preview {
    TLButton(title: "Value", background: .pink) {
    
    }
}
