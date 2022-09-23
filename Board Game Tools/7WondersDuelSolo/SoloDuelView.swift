//
//  CancelionView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct SoloDuelView: View {
    
    static let backImage: String = "BackLeaders"
    @State var imageName: String = SoloDuelView.backImage
    @State var width: CGFloat = 241
    @State var height: CGFloat = 374
    
    @State var leader = 0
    
    @State var selected = false
    @State var help = false

    let rangeBase = 1...5

    let colorGreen = Color(red: 70/255, green: 121/255, blue: 118/255)
    let colorYellow = Color(red: 237/255, green: 217/255, blue: 135/255)
    
    
    @State private var start = false
    
    var body: some View {
        ZStack {
            //LinearGradient(gradient: Gradient(colors: [colorGreen, colorYellow]), startPoint: .top, endPoint: .bottom)
            //    .ignoresSafeArea()
            RadialGradient(gradient: Gradient(colors: [colorGreen, colorYellow]), center: .top, startRadius: 500, endRadius: 700)
                .ignoresSafeArea()
            
//            RadialGradient(stops: [
//                .init(color: colorGreen, location: 0.3),
//                .init(color: colorYellow, location: 0.3)
//            ], center: .top, startRadius: 200, endRadius: 700)
//                .ignoresSafeArea()
            //Color(red: 0.99, green: 0.98, blue: 0.84)
            //    .edgesIgnoringSafeArea(.all)
            VStack {
                Text("7 Wonders Duel Solo")
                    .font(.title)
                    .foregroundColor(colorYellow)
                
                Button(action: {
                    leader = Int.random(in: rangeBase)
                    self.imageName = "Leader\(leader)"
                    selected = true
                }) {

                    CardView(width: width, height: height, imageName: imageName)
                        .padding(20)
                }
                
                Spacer()
            }
        }
        .toolbar {
            HStack {
                Button {
                    help = true
                } label: {
                    Image(systemName: "questionmark")
                }
                .sheet (isPresented: $help) {
                    SoloDuelHelpView()
                }
                
                Button {
                    start = true
                } label: {
                    Image(systemName: "play.fill")
                }
                .disabled(!selected)
                .sheet(isPresented: $start) {
                    SoloDuelDecisionView(leader: self.imageName)
                }
            }
        }
        
    }
}

struct SoloDuelView_Previews: PreviewProvider {
    static var previews: some View {
        SoloDuelView()
    }
}
