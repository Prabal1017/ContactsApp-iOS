//
//  ContactsViewViewModel.swift
//  Contacts app
//
//  Created by Prabal Kumar on 08/09/24.
//

import Foundation


class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    let storageKey = "contacts"
    
    init() {
        loadContacts()
    }
    
    // Load contacts from UserDefaults
    func loadContacts() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let savedContacts = try? JSONDecoder().decode([Contact].self, from: data) {
            self.contacts = savedContacts
        }
    }
    
    // Save contacts to UserDefaults
    func saveContacts() {
        if let data = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    // Add a new contact
    func addContact(name: String, phoneNumber: String) {
        let newContact = Contact(name: name, phoneNumber: phoneNumber)
        contacts.append(newContact)
        saveContacts()
    }
}
