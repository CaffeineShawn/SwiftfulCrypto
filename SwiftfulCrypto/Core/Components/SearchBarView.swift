//
//  SearchBarView.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .disableAutocorrection(true)
                .foregroundColor(Color.theme.accent)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        
                        .foregroundColor(Color.theme.accent)
                        
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,
                    alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            SearchBarView(searchText: .constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
        
    }
}
