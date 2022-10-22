//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import SwiftUI

struct CircleButtonAnimationView: View {

    // HomeView tells need to animate or not use bindings
    @Binding var animate: Bool

    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)

    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
    }
}
