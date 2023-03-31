//
//  GameScene.swift
//  UpdatedMonsterDemo
//
//  Created by Jacob Wise on 3/21/23.
//

import SpriteKit
import GameplayKit
import Spine


class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
     do
     {
         let char = try Skeleton(json: "LeviathanMonster3", folder: "Leviathan", skin: "default")
         char.name = "Leviathan"
         char.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
         char.xScale = 0.5
         char.yScale = 0.5
         
         addChild(char)
       
         let beam:SKAction = try char.action(animation: "beam")
         let beamReversed = beam.reversed()
         let idle = try char.action(animation: "idle")
         let glow = try char.action(animation: "glow")
         let bite = try char.action(animation: "bite")
         
         
         let ground = try char.action(animation: "ground")
         //let groundReverse = try char.action(animation: "groundReverse")

         
         let groundReversed = ground.reversed()
         let beamSeq = SKAction.sequence([beam, beamReversed])
         let groundSeq = SKAction.sequence([ground, groundReversed])
         let functionalSequence = SKAction.sequence([idle, glow, bite, beam])
         let brokenSequence = SKAction.sequence([beamSeq, groundSeq])
        
         let runForever = SKAction.repeatForever(functionalSequence)
         self.run(runForever)
       
      

         
         
         //char.run(.repeatForever(seq))
     } catch {
         print(error)
     }
    }
}
