//
//  SoloDuelHelpView.swift
//  Board Game Variants
//
//  Created by Fabio Vinicius Binder on 18/11/21.
//

import SwiftUI

struct SoloDuelHelpView: View {
    
    @State var page = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.99, green: 0.98, blue: 0.84)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                page += 1
            }) {
                Image("Rules\(page % 4 + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct SoloDuelHelpView_Previews: PreviewProvider {
    static var previews: some View {
        SoloDuelHelpView()
    }
}
