//
//  SceneCombat.swift
//  EnemyGame
//
//  Created by Lucas Justo on 21/04/23.
//

import Foundation
import SpriteKit
import GameplayKit

class SceneCombat: SKScene {

    var entities = [GKEntity]()

    private var lastUpdateTime : TimeInterval = 0
    private var background: SKSpriteNode = SKSpriteNode(imageNamed: "BackgroundStandard")

    override func sceneDidLoad() {
        self.configureScene()
    }
    
    private func configureScene() {
        self.size = CGSize(width: ScreenSize.width, height: ScreenSize.height)
        self.view?.ignoresSiblingOrder = true
        self.lastUpdateTime = 0
        
        self.configureBackground()
    }

    private func configureBackground() {
        background.anchorPoint = .zero
        background.size = CGSize(width: frame.width, height: frame.height)
        background.zPosition = 0
        background.position = .zero
        
        let teamGrid: TeamGrid = TeamGrid(fatherNodeWidth: self.size.width, team: [:])
        teamGrid.zPosition = 1
        
        background.addChild(teamGrid)
        
        self.addChild(background)
    }

//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }


    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }

        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime

        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }

        self.lastUpdateTime = currentTime
    }
}
