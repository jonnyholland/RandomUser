//
//  PersonDetailView.swift
//  CapitalOneTest
//
//  Created by Jonathan Holland on 5/3/22.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack {
            if let thumbnailURL = URL(string: self.person.picture.large) {
                AsyncImage(url: thumbnailURL) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person")
                }
            }
            
            Text(self.person.name.first + " " + self.person.name.last)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "mail")
                    Text(self.person.email)
                }
                .foregroundColor(.secondary)
                
                HStack {
                    Image(systemName: "phone")
                    Text(self.person.phone)
                }
                .foregroundColor(.secondary)
                
                HStack(alignment: .top) {
                    Image(systemName: "mappin.and.ellipse")
                    Text(self.person.location.fullAddress)
                }
                .foregroundColor(.secondary)
            }
            .padding(.top, 8)
            
            Spacer()
        }
    }
}
