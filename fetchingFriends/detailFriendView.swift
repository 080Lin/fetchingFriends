//
//  detailFriendView.swift
//  fetchingFriends
//
//  Created by Максим Нуждин on 11.01.2022.
//

import SwiftUI

struct detailFriendView: View {
    let colors: [Color] = [.red, .yellow, .blue, .pink, .green]
    var profileImage: some View {
        colors.randomElement()
            .frame(width: 140, height: 210, alignment: .leading)
    }
    let user: FriendList
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    HStack(alignment: .top) {
                        profileImage
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text("\(user.age) y.o.")
                            Text("Working for")
                            Text(user.company)
                                .bold()
                            Text("Contact mail:")
                            Text(user.email)
                                .bold()
                        }.padding(.horizontal)
                    }
                    Spacer()
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Position:")
                            .font(.title)
                        Text(user.about)
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Living at:")
                            .font(.title)
                        Text(user.address)
                    }
                }
                VStack(alignment: .leading) {
                    Text("Connected with:")
                        .font(.title)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.friends) { uf in
                                VStack(alignment: .center) {
                                    CustomFriendOverlay(name: uf.name, color: colors.randomElement()!)
                                        .padding()
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }.padding()
                .navigationTitle(user.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct detailFriendView_Previews: PreviewProvider {
    static var previews: some View {
        detailFriendView(user: FriendList(name: "Maxim", age: 22, company: "Raiffaisenbank", id: "1", isActive: false, email: "vainikkaxd", address: "oktyabrya 13", about: "iOS developer", registered: Date.now, tags: ["iOS", "swift", "SwiftUI"], friends: []))
    }
}


struct CustomFriendOverlay: View {
    
    let name: String
    let color: Color
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            color
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            if Bool.random() {
                Color.green
                    .frame(height: 30)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Color.black, lineWidth: 5)
                    )
            } else {
                Color.red
                    .frame(height: 30)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Color.black, lineWidth: 5)
                    )
            }
        }
        Text(name)
            .multilineTextAlignment(.center)
    }
    
}

