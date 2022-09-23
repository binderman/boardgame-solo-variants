//
//  CancelionView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct SoloDuelDecisionView: View {
    
    @State var leader: String
    static let backImage: String = "BackDecisions"
    @State var imageName: String = SoloDuelDecisionView.backImage
    @State var width: CGFloat = 378
    @State var height: CGFloat = 241
    
    @State var card = 0

    let rangeBase = 1...12

    let colorGreen = Color(red: 70/255, green: 121/255, blue: 118/255)
    let colorYellow = Color(red: 237/255, green: 217/255, blue: 135/255)
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [colorGreen, colorYellow]), center: .top, startRadius: 500, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("7 Wonders Duel Solo")
                    .font(.title)
                    .foregroundColor(colorYellow)
                
                Button(action: {
                    card = Int.random(in: rangeBase)
                    self.imageName = "Decision\(card)"
                }) {

                    CardView(width: width, height: height, imageName: imageName)
                        .padding(20)
                }
                
                Spacer()
                
                Image(leader)
                    .resizable()
                    .frame(width: height/1.5, height: width/1.5, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 5))
                
                Spacer()
            }
        }
    }
}

struct SoloDuelDecisionView_Previews: PreviewProvider {
    static var previews: some View {
        SoloDuelDecisionView(leader: "Leader1")
    }
}
