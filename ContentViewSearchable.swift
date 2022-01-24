//
//  ContentView.swift
//  SwiftUI Tutorial: Searchable
//
//  Created by Alvin Sosangyo on 01/24/22.
//


import SwiftUI

struct ContentView: View {
    
    @State var searchCollection = collections
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            
            List(searchCollection) { index in
                        
                ImageLabelRow(collection: index)
                        
            }
            .navigationTitle("Select a Topic")
            
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText) { index in
            if !index.isEmpty {
                searchCollection = collections.filter { $0.name.contains(index) }
            } else {
                searchCollection = collections
            }
        }
        
    } //body
    
} //ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Collections: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

var collections = [

    Collections(name: "Humanity", image: "person.fill"),
    Collections(name: "Wild Life", image: "pawprint.fill"),
    Collections(name: "Global", image: "globe.asia.australia.fill"),
    Collections(name: "Energy", image: "bolt.fill"),
    Collections(name: "Nature", image: "leaf.fill"),
    Collections(name: "Weather", image: "cloud.drizzle.fill"),
    Collections(name: "Travel", image: "airplane"),
    Collections(name: "Video Games", image: "gamecontroller.fill"),
    Collections(name: "Health", image: "heart.fill")
    
]

struct ImageLabelRow: View {
    
    var collection: Collections

    var body: some View {
        HStack {
            Image(systemName: collection.image)
                .font(.system(size: 75))
                .padding()
            
            Text(collection.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
    
}
