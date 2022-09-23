//
//  CancelionView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct CancelionView: View {
    
    @State var imageName = "back"
    @State var width: CGFloat = 241
    @State var height: CGFloat = 378
    
    @State var clue = 0
    @State var sorteados = [Int]()

    let rangeBase = 1...95
    let rangeDunwich = 96...126
    let rangeInnsmouth = 127...153
    let rangeKingsport = 154...192
    
    @State var dunwich : Bool = false
    @State var innsmouth : Bool = false
    @State var kingsport : Bool = false
    
    var body: some View {
        
        ZStack {
            Color(red: 0.99, green: 0.98, blue: 0.84)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //Text("\(sorteados.count)")
                //    .foregroundColor(Color(red: 0.43, green: 0.26, blue: 0.13))
                Text("AH Cancelion's Alternate Clues")
                    .font(.title)
                    .foregroundColor(Color(red: 0.43, green: 0.26, blue: 0.13))
//                    .padding(40)
                
                Button(action: {
                    clue = Int.random(in: 0...sorteados.count-1)
                    self.imageName = "Clue\(sorteados[clue])"
                    sorteados.remove(at: clue)
                    if sorteados.isEmpty {
                        shuffle()
                    }
                }) {

                    CardView(width: width, height: height, imageName: imageName)
                        .padding(20)
                }
                Button(action: { shuffle() }) {
                    Text("Shuffle")
                        .font(.title2)
                        .foregroundColor(Color(red: 0.43, green: 0.26, blue: 0.13))
                }
                HStack {
                    ExpansionView(toggle: $dunwich, label: "Dunwich", shuffle: self.shuffle)
                    ExpansionView(toggle: $innsmouth, label: "Innsmouth", shuffle: self.shuffle)
                    ExpansionView(toggle: $kingsport, label: "Kingsport", shuffle: self.shuffle)
                }
                .padding(20)
                
                Spacer()
            }
        }
        .onAppear {
            shuffle()
        }
    }
    
    
    func shuffle() -> Void {
        self.imageName = "back"
        sorteados.removeAll()
        
        for i in rangeBase {
            sorteados.append(i)
        }
        
        if dunwich {
            for i in rangeDunwich {
                sorteados.append(i)
            }
        }
        
        if innsmouth {
            for i in rangeInnsmouth {
                sorteados.append(i)
            }
        }
        
        if kingsport {
            for i in rangeKingsport {
                sorteados.append(i)
            }
        }
    }
}

struct CancelionView_Previews: PreviewProvider {
    static var previews: some View {
        CancelionView()
    }
}

struct ExpansionView: View {
    @Binding var toggle: Bool
    let label: String
    var shuffle: () -> Void
    var body: some View {
        Toggle(isOn: self.$toggle) {
            Text(label).foregroundColor(Color(red: 0.43, green: 0.26, blue: 0.13))
        }
        .onChange(of: self.toggle, perform: { newValue in
            self.shuffle()
        })
        .toggleStyle(.button)
        .tint(Color(red: 0.86, green: 0.68, blue: 0.22))
    }
}
