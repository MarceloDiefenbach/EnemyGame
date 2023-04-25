//
//  StandardShot.swift
//  EnemyGame
//
//  Created by Lucas Justo on 24/04/23.
//

import Foundation
import SpriteKit

class StraightShot: SKSpriteNode {
    private let baseTextureName: String = "StandardShot"
    private let width: CGFloat = 20
    private let height: CGFloat = 20
    private weak var thrower: StandardThrower?
    private let projectileSpeed: CGFloat = 750 // pixel per second
    
    init(thrower: StandardThrower) {
        self.thrower = thrower
        super.init(texture: SKTexture(imageNamed: baseTextureName), color: .yellow, size: CGSize(width: width, height: height))
        
        self.configureShot()
        
        self.travel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("shot has been dealocated")
    }
    
    private func configureShot() {
        if let thrower {
            let y = thrower.position.y + thrower.size.height/2
            self.position = CGPoint(x: thrower.position.x, y: y)
            self.zPosition = thrower.zPosition + 1
        }
    }
    
    private func deinitSelf() {
        self.removeAllActions()
        self.removeFromParent()
    }
    
    private func travel() {
        let goal: CGFloat = ScreenSize.height + CGFloat(100)
        let distance: CGFloat = goal - self.position.y
        let duration: CGFloat = distance/self.projectileSpeed

        let travelAction = SKAction.moveTo(y: ScreenSize.height + 100, duration: duration)
        //SKAction.move(to: CGPoint(x: self.position.x - 200, y: ScreenSize.height), duration: duration)
        
        self.run(travelAction) {
            self.deinitSelf()
        }
        
    }
    
    private func calculateNextPosition() -> CGPoint {
        return CGPoint(x: self.position.x, y: self.position.y + 8)
    }
}

class StraightShotProvider {
    static func instantiateShot(thrower: StandardThrower) -> StraightShot {
        return StraightShot(thrower: thrower)
    }
}
