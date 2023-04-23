//
//  TeamGrid.swift
//  EnemyGame
//
//  Created by Lucas Justo on 21/04/23.
//

import Foundation
import SpriteKit

class TeamGrid: SKSpriteNode {
    private var lines: Int = 2
    private var columns: Int = 5
    private var width: CGFloat = ScreenSize.width * 0.8
    private var height: CGFloat = ScreenSize.height * 0.15
    
    private var team: [Int: SKSpriteNode]
    
    init(fatherNodeWidth: CGFloat, team: [Int: SKSpriteNode]) {
        self.team = team
        super.init(texture: nil, color: .blue, size: CGSize(width: width, height: height))
        configureTeamGrid(fatherNodeWidth: fatherNodeWidth)
        
        // uncomment line below to test new TeamGrid positions if someday lines or columns change its values
        // testTeamGrid()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addThrower(position: Int, thrower: SKSpriteNode) {
        if position >= 0 && position < (lines*columns) {
            thrower.zPosition = self.zPosition + 1
            thrower.position = getPosition(teamIndex: position)
            
            self.addChild(thrower)
        }
    }
    
    private func configureTeamGrid(fatherNodeWidth: CGFloat) {
        self.anchorPoint = .zero
        self.position = CGPoint(x: (fatherNodeWidth - self.width)/2, y: height/2)
    }
    
    private func getPosition(teamIndex: Int) -> CGPoint {
        let blockHeigth: CGFloat = height/CGFloat(lines)
        let blockWidth: CGFloat = width/CGFloat(columns)
        
        let line: Int = Int((floor(CGFloat(teamIndex)/CGFloat(columns))) + 1)
        let column: Int = (teamIndex % Int(columns)) + 1
        
        let x: Double = (blockWidth * CGFloat(column)) - (blockWidth/2)
        let y: Double = (blockHeigth * CGFloat(line)) - (blockHeigth/2)
       
        return CGPoint(x: x, y: y)
    }
    
    private func testTeamGrid() {
        let teamSize: Int = Int(lines * columns)
        
        for i in 0..<teamSize {
            let node: SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
            node.zPosition = self.zPosition + 1
            
            let label: SKLabelNode = SKLabelNode(text: "\(i)")
            label.zPosition = node.zPosition + 1
            label.fontSize = 20
            label.position = .zero
            
            node.addChild(label)
            
            node.position = self.getPosition(teamIndex: i)
            
            self.addChild(node)
        }
    }
}
