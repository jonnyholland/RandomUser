//
//  PersonRow.swift
//  CapitalOneTest
//
//  Created by Jonathan Holland on 5/3/22.
//

import SwiftUI

struct PersonRow: View {
    var person: Person
    
    var body: some View {
        HStack(spacing: 20) {
            if let thumbnailURL = URL(string: person.picture.thumbnail) {
                AsyncImage(url: thumbnailURL) { image in
                    image
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person")
                }
            }
            
            Text(person.name.first + " " + person.name.last)
            
            Spacer()
        }
    }
}
