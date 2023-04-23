//
//  GoldenStar.swift
//  EnemyGame
//
//  Created by Lucas Justo on 23/04/23.
//

import Foundation
import SpriteKit

class GoldenStar: SKSpriteNode {
    private let baseTextureName: String = "GoldenStar"
    private let spinDurationInSeconds: CGFloat = 1.5
    
    init(fatherZPosition: CGFloat) {
        super.init(texture: SKTexture(imageNamed: baseTextureName + "0"), color: .yellow, size: CGSize(width: 20, height: 20))
        self.zPosition = fatherZPosition + 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Spin Animation
    func spin() {
        let beginIndex: Int = 0
        let endIndex: Int = 7
        
        var textures: [SKTexture] = []
        
        for i in beginIndex...endIndex {
            let texture = SKTexture(imageNamed: baseTextureName + "\(i)")
            textures.append(texture)
        }
        textures.append(SKTexture(imageNamed: baseTextureName + "\(beginIndex)"))
        
        let timePerFrame: CGFloat = spinDurationInSeconds/CGFloat(textures.count)
        
        let spinAction = SKAction.animate(with: textures, timePerFrame: timePerFrame)
        
        self.run(spinAction)
    }
}
