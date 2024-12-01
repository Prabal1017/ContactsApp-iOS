import SwiftUI

struct ContactsView: View {
    @StateObject private var viewModel = ContactsViewModel()
    @State private var isShowingNewContactView = false
    
    
    var body: some View {
        NavigationView {
            List(viewModel.contacts) { contact in
                NavigationLink(destination:ContactDetailView(contactDetail: contact)){
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.phoneNumber)
                            .font(.subheadline).foregroundColor(.gray)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingNewContactView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingNewContactView) {
                NewContactView(viewModel: viewModel, isShowingNewContactView: $isShowingNewContactView)
                    .presentationDetents([.medium])
            }
        }
    }
}



#Preview {
    ContactsView()
}
