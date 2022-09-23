//
//  CardView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct CardView: View {
    
    var width: CGFloat
    var height: CGFloat
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 6))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(width: 241, height: 378, imageName: "back").previewLayout(.sizeThatFits)
    }
}
