//
//  ButtonStyles.swift
//  T0DO
//
//  Created by Sós Dávid on 2026. 04. 10..
//

import SwiftUI

struct NarancsGombStilus : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .foregroundStyle(Color.black)
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
