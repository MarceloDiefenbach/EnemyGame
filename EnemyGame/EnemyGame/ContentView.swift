//
//  ContentView.swift
//  EnemyGame
//
//  Created by Lucas Justo on 21/04/23.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SpriteView(scene: SceneCombat(), debugOptions: [.showsNodeCount])
        }
        .ignoresSafeArea()
        .statusBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
