//
//  HouseListView.swift
//  HarryPotterHouseApp
//
//  Created by Omveer Panwar on 05/11/24.
//


import SwiftUI

struct HouseListView: View {
    let houses = ["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]
    let houseColors: [Color] = [.red, .green, .blue, .yellow]
    let houseImages = [
        "https://i.imghippo.com/files/Zz06c1728466625.jpg",
        "https://i.imghippo.com/files/qBe0v1728466743.jpg",
        "https://i.imghippo.com/files/dNdZD1728466888.jpg",
        "https://i.imghippo.com/files/zlDEL1728466864.jpg"
    ]
    
    // Define grid layout with two columns
    let gridColumns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            Text("Houses")
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(0..<houses.count, id: \.self) { index in
                        NavigationLink(destination: CharacterListView(house: houses[index])) {
                            VStack {
                                AsyncImage(url: URL(string: houseImages[index])) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 200)
                                .clipShape(Circle())
                                
                                Text(houses[index])
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(houseColors[index])
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
#Preview {
    HouseListView()
}
