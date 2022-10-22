//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/22.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            print("Xmark: \(self._presentationMode.wrappedValue)")
                presentationMode.wrappedValue.dismiss()

        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })

    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
