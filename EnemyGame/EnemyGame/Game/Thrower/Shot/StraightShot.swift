//
//  StandardShot.swift
//  EnemyGame
//
//  Created by Lucas Justo on 24/04/23.
//

import Foundation
import SpriteKit

class StraightShot: SKSpriteNode {
    private let baseTextureName: String = "GreenAlien"
    private let width: CGFloat = 20
    private let height: CGFloat = 20
    private weak var thrower: StandardThrower?
    private let projectileSpeed: CGFloat = 1000 // pixel per second
    
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
            self.position = CGPoint(x: thrower.position.x, y: thrower.position.y + thrower.size.height/2)
            self.zPosition = thrower.zPosition + 1
        }
    }
    
    private func killSelf() {
        self.removeAllActions()
        self.removeFromParent()
    }
    
    private func travel() {
        Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true) { timer in
            self.position = self.calculateNextPosition()
            if self.position.y > (ScreenSize.height + self.projectileSpeed/100) {
                timer.invalidate()
                self.killSelf()
            }
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
