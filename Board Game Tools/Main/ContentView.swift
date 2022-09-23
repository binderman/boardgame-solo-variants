//
//  ContentView.swift
//  Arkham Horror Variants
//
//  Created by Fabio Vinicius Binder on 07/11/21.
//

import SwiftUI

struct ContentView: View {

    @State var tools = [Tool]()
    
    var body: some View {
        NavigationView {
            List (tools) { tool in
                NavigationLink(destination: tool.view) {
                    HStack {
                        Text(tool.title)
                    }
                }
            }
            .navigationBarTitle("Board Game Tools")
        }
        .accentColor(.black)
            //Color(red: 0.43, green: 0.26, blue: 0.13))
        .onAppear {
            self.tools.append(Tool(id: 1, title: "AH Cancelion's Alternate Clues", view: AnyView(CancelionView())))
            self.tools.append(Tool(id: 2, title: "7 Wonders Duel Solo", view: AnyView(SoloDuelView())))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
