//
//  ContentView.swift
//  fetchingFriends
//
//  Created by Максим Нуждин on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var results: [FriendList] = []
    var body: some View {
        NavigationView {
            VStack {
                Text("There are \(results.count) friends available to explore")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                Section {
                    List {
                        ForEach(results) { friend in
                            NavigationLink {
                                detailFriendView(user: friend)
                            } label: {
                                HStack {
                                    VStack {
                                        Text("Name:")
                                        Text(friend.name)
                                    }
                                    VStack {
                                        Text("Age")
                                        Text("\(friend.age)")
                                    }
                                }
                            }
                        }
                    }.task {
                        await getDataFromURL(url: "https://www.hackingwithswift.com/samples/friendface.json")
                        
                    }
                }
            }.navigationBarTitle("Friends")
        }.preferredColorScheme(.dark)
    }
    
    func getDataFromURL(url: String) async {
        
        guard let link = URL(string: url) else {
            print("invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: link)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedData = try? decoder.decode([FriendList].self, from: data) {
                results = decodedData
                return
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
