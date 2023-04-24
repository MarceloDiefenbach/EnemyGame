//
//  StandardThrower.swift
//  EnemyGame
//
//  Created by Lucas Justo on 23/04/23.
//

import Foundation
import SpriteKit

class StandardThrower: SKSpriteNode {
    private let baseTextureName: String = "PlayerCannon"
    private let width: CGFloat = 50
    private let height: CGFloat = 50
    private let shootingObjectProvider = StraightShotProvider.self
    
    init() {
        super.init(texture: SKTexture(imageNamed: baseTextureName), color: .yellow, size: CGSize(width: width, height: height))
        shot()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shot() {
        let test = shootingObjectProvider.instantiateShot(thrower: self)
        
        self.addChild(test)
    }
}
