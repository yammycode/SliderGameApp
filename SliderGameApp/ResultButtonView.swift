//
//  ResultButtonView.swift
//  SliderGameApp
//
//  Created by Anton Saltykov on 28.10.2022.
//

import SwiftUI

struct ResultButtonView: View {
    let computeScore: Int
    let completion: () -> ()

    @State private var resultAlertPresented = false
    
    var body: some View {
        Button("Показать результат") {
            resultAlertPresented.toggle()
        }
        .alert("Ваш результат:", isPresented: $resultAlertPresented) {
            Button("OK", role: .cancel) {
                completion()
            }
        } message: {
            Text(computeScore.formatted())
        }
    }
}


struct ResultButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ResultButtonView(computeScore: 80) {}
    }
}
