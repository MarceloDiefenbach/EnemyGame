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
    private var lastUpdateTime : TimeInterval = 0
    private var background: SKSpriteNode = SKSpriteNode(imageNamed: "BackgroundStandard")
    
    #warning("shouldRemoveStar")
    var thrower: StandardThrower? = nil
    
    override func sceneDidLoad() {
        self.configureScene()
    }
    
    private func configureScene() {
        self.size = CGSize(width: ScreenSize.width, height: ScreenSize.height)
        self.view?.ignoresSiblingOrder = true
        self.lastUpdateTime = 0
        self.view?.showsNodeCount = true
        
        self.configureBackground()
    }

    private func configureBackground() {
        background.anchorPoint = .zero
        background.size = CGSize(width: frame.width, height: frame.height)
        background.zPosition = 0
        background.position = .zero
        
        let teamGrid: TeamGrid = TeamGrid(fatherNode: self.background, team: [:])
        
        #warning("shouldRemoveStar")
        self.thrower = StandardThrower()
        teamGrid.addThrower(position: 8, thrower: self.thrower!)
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        #warning("shouldRemove")
        self.thrower?.shot()
    }
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

        self.lastUpdateTime = currentTime
    }
}
