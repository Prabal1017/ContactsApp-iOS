import SwiftUI

struct ContactDetailView: View {
    var contactDetail: Contact
    
    let icons = ["phone.fill", "video.fill", "message.fill", "envelope.fill"]
    let items = ["Call", "Facetime", "Message", "Mail"]
    
    let columns = [GridItem(.flexible())]
    @StateObject private var viewModel = ContactsViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 100)
                    
                    // Extract the first letter of the contact's name
                    Text(String(contactDetail.name.prefix(1)).uppercased())
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                
                Text(contactDetail.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                LazyHGrid(rows: columns, spacing: 10) {
                    ForEach(Array(zip(icons, items)), id: \.0) { icon, item in
                        ZStack {
                            Rectangle()
                                .frame(width: 88, height: 60)
                                .foregroundColor(.gray)
                                .cornerRadius(10)
                            VStack {
                                Image(systemName: icon)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                                Text(item)
                                    .font(.footnote)
                                    .offset(y: 4)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                
                List {
                    Text("ery")
                }
                
                VStack {
                    Rectangle()
                        .frame(width: 382, height: 60)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                }
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock Contact for preview
        let mockContact = Contact(name: "John Doe", phoneNumber: "123-456-7890")
        
        ContactDetailView(contactDetail: mockContact)
    }
}
