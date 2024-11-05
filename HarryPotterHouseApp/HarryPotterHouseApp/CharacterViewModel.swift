//
//  CharacterViewModel.swift
//  HarryPotterHouseApp
//
//  Created by Omveer Panwar on 05/11/24.

import Foundation
import SwiftUI
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var page = 1
    private var isLoading = false
    private var characterService = CharacterService()
    
    func loadCharacters(for house: String) {
        guard !isLoading else { return }
        isLoading = true
        
        characterService.fetchCharacters(for: house) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let characters):
                    self?.characters += characters.prefix(10) 
                case .failure(let error):
                    print("Error loading characters: \(error)")
                }
            }
        }
    }
    
    func refresh(for house: String) {
        characters = []
        page = 1
        loadCharacters(for: house)
    }
}
struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(house: "Gryffindor")
    }
}
