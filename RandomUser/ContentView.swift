//
//  ContentView.swift
//  CapitalOneTest
//
//  Created by Jonathan Holland on 5/3/22.
//

import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject private var coordinator = Self.Coordinator()
    
    var body: some View {
        NavigationView {
            List(self.coordinator.people, id: \.self) { person in
                NavigationLink {
                    PersonDetailView(person: person)
                } label: {
                    PersonRow(person: person)
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    /// Provides extra functionality for the view layer.
    final class Coordinator: ObservableObject {
        /// The people to display in the view.
        @Published var people = [Person]()
        /// The microservice to fetch people from the API.
        @Published var fetchService = FetchService()
        
        init() {
            // Listen to any changes that happen and assign them to our local variable
            self.fetchService
                .$fetchedPeople
                .assign(to: \.people, on: self)
                .store(in: &self.subscriptions)
        }
        
        // MARK: Combine
        private var subscriptions = Set<AnyCancellable>()
        
        // MARK: Methods
        /// Get a new list of people from the API.
        func refreshPeople() async {
            await self.fetchService.refreshPeople()
        }
    }
    
    /// A microservice to provide fetching functionality to and from APIs.
    final class FetchService: ObservableObject {
        @Published private(set) var fetchedPeople = [Person]()
        
        init() {
            Task {
                await self.refreshPeople()
            }
        }
        
        // MARK: Methods
        /// Get random people from the API and update `fetchedPeople`.
        func refreshPeople() async {
            self.fetchedPeople = await self._fetchPeople()
        }
        
        /// Attempt to fetch people from the API.
        ///
        /// - Returns: An array of `Person`
        private func _fetchPeople() async -> [Person] {
            do {
                if let randomPeople = try await self._fetchPeopleFromURL() {
                    return randomPeople.results
                }
            } catch {
                print("ERROR: \(error)")
            }
            
            return []
        }
        
        /// Get people from the url and attempt to decode into `RandomPeople`.
        ///
        /// - Returns: A `RandomPeople` object or `nil` if it was not able to decode.
        /// - Throws: An error will be thrown if the data is unable to retrieve the data or if the data is unable to be decoded.
        @MainActor private func _fetchPeopleFromURL() async throws -> RandomPeople? {
            guard let url = URL(string: "https://randomuser.me/api/?results=100") else { return nil }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(RandomPeople.self, from: data)
        }
    }
}
