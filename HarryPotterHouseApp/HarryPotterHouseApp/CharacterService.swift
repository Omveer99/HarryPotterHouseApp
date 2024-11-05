//
//  CharacterService.swift
//  HarryPotterHouseApp
//
//  Created by Omveer Panwar on 05/11/24.

import Foundation

class CharacterService {
    func fetchCharacters(for house: String, completion: @escaping (Result<[Character], Error>) -> Void) {
        let urlString = "https://hp-api.herokuapp.com/api/characters/house/\(house.lowercased())"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
