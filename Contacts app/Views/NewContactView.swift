//
//  NewContactView.swift
//  Contacts app
//
//  Created by Prabal Kumar on 08/09/24.
//

import SwiftUI

struct NewContactView: View {
    @ObservedObject var viewModel = ContactsViewModel()
    @Binding var isShowingNewContactView: Bool
    
    @State private var name = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingNewContactView = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !name.isEmpty && !phoneNumber.isEmpty {
                            viewModel.addContact(name: name, phoneNumber: phoneNumber)
                            isShowingNewContactView = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewContactView(viewModel: ContactsViewModel(), isShowingNewContactView: .constant(true))
}
