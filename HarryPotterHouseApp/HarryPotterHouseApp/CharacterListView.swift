//
//  CharacterListView.swift
//  HarryPotterHouseApp
//
//  Created by Omveer Panwar on 05/11/24.

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterViewModel()
    let house: String
    let houseColors: [String: Color] = [
        "Gryffindor": .red,
        "Slytherin": .green,
        "Ravenclaw": .blue,
        "Hufflepuff": .yellow
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.characters) { character in
                        VStack(spacing: 20) {
                           
                            VStack(spacing: 20) {
                            
                                Text(character.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.yellow)
                                    .cornerRadius(8)
                                
                              
                                AsyncImage(url: URL(string: character.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 200, height: 300) // Adjust as needed
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                                
                               
                                VStack(spacing: 0) {
                                    
                                    HStack(spacing: 0) {
                                        Text("House")
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .background(houseColors[character.house ?? ""] ?? .gray)
                                            .border(Color.black, width: 1)
                                        
                                        Text(character.house ?? "Unknown")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                            .background(houseColors[character.house ?? ""] ?? .gray)
                                            .border(Color.black, width: 1)
                                    }
                                    
                                   
                                    HStack(spacing: 0) {
                                        Text("Species")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .border(Color.black, width: 1)
                                        
                                        Text(character.species ?? "Unknown")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                            .border(Color.black, width: 1)
                                    }
                                    
                                   
                                    HStack(spacing: 0) {
                                        Text("Gender")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .border(Color.black, width: 1)
                                        
                                        Text(character.gender ?? "Unknown")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                            .border(Color.black, width: 1)
                                    }
                                    
                                  
                                    HStack(spacing: 0) {
                                        Text("Date of Birth")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .border(Color.black, width: 1)
                                        
                                        Text(character.dateOfBirth ?? "Unknown")
                                            .font(.subheadline)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding()
                                            .border(Color.black, width: 1)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(house)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadCharacters(for: house)
            }
        }
    }
}

struct CharacterListView_Preview: PreviewProvider {
    static var previews: some View {
        let sampleViewModel = CharacterViewModel() 
        CharacterListView(viewModel: sampleViewModel, house: "Gryffindor")
    }
}
