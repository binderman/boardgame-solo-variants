//
//  ConfigView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct ConfigView: View {
    @State var dunwich : Bool = false
    @State var innsmouth : Bool = false
    @State var kingsport : Bool = false
    var body: some View {
        VStack {
            Text("Expansions to Include")
                .padding(20)
            Toggle(isOn: $dunwich) {
                Text("Dunwich Horror")
            }
            Toggle(isOn: $innsmouth) {
                Text("Innsmouth Horror")
            }
            Toggle(isOn: $kingsport) {
                Text("Kingsport Horror")
            }
            Spacer()
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
