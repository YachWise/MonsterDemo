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

    var skeleton: Skeleton?
    
    //da boss
    var bossNode: SKNode = SKNode()
    
    //skactions
    var bite: SKAction?
    var idle: SKAction?
    var ground: SKAction?
    var beam: SKAction?
    var glow: SKAction?
    var angry: SKAction?
    
    //button nodes
    var idleNode: SKShapeNode?
    var biteNode: SKShapeNode?
    var groundNode: SKShapeNode?
    var beamNode: SKShapeNode?
    var glowNode: SKShapeNode?
    
    override func didMove(to view: SKView) {
     do
     {
         
         let idleNode: SKShapeNode = SKShapeNode(rect: CGRect(x: -200, y: 400, width: 50, height: 50), cornerRadius: 0)
         idleNode.zPosition = 50
         idleNode.fillColor = .blue
         idleNode.name = "Idle"
         self.idleNode = idleNode
         
         let biteNode: SKShapeNode = SKShapeNode(rect: CGRect(x: -100, y: 400, width: 50, height: 50), cornerRadius: 0)
         biteNode.zPosition = 50
         biteNode.fillColor = .red
         biteNode.name = "Bite"
         self.biteNode = biteNode
         
         
         let groundNode: SKShapeNode = SKShapeNode(rect: CGRect(x: 0, y: 400, width: 50, height: 50), cornerRadius: 0)
         groundNode.zPosition = 50
         groundNode.fillColor = .magenta
         groundNode.name = "Ground"
         self.groundNode = groundNode
         
         let beamNode: SKShapeNode = SKShapeNode(rect: CGRect(x: 100, y: 400, width: 50, height: 50), cornerRadius: 0)
         beamNode.zPosition = 50
         beamNode.fillColor = .cyan
         beamNode.name = "Beam"
         self.beamNode = beamNode
         
         let glowNode: SKShapeNode = SKShapeNode(rect: CGRect(x: 200, y: 400, width: 50, height: 50), cornerRadius: 0)
         glowNode.zPosition = 50
         glowNode.fillColor = .green
         glowNode.name = "Glow"
         self.glowNode = glowNode
         
         self.addChild(self.idleNode!)
         self.addChild(self.biteNode!)
         self.addChild(self.groundNode!)
         self.addChild(self.beamNode!)
         self.addChild(self.glowNode!)
         
         let char = try Skeleton(json: "LeviathanMonster7", folder: "Leviathan", skin: "default")
         char.name = "Leviathan"
         //TODO: - For Frog
         //let frogAnimation = try char.action(animation: "angry")
         //let repeatedFrog = SKAction.repeatForever(frogAnimation)
         //self.angry = frogAnimation
         
         
         char.position = CGPoint(x: self.frame.midX, y: self.frame.midY / 2)
         char.xScale = 0.5
         char.yScale = 0.5
         skeleton = char
         addChild(char)
         bossNode = char
       
         //TODO: - For Leviathan
         let beam:SKAction = try char.action(animation: "beam")
         let idle = try char.action(animation: "idle")
         let glow = try char.action(animation: "glow")
         let bite = try char.action(animation: "bite")
         let ground = try char.action(animation: "ground")


         self.idle = idle
         self.bite = bite
         self.ground = ground
         self.beam = beam
         self.glow = glow
         let repeatedIdle = SKAction.repeatForever(idle)
         let repeatedBite = SKAction.repeatForever(bite)
         //self.bossNode.run(repeatedIdle)
         //char.run(frogAnimation)
         
        
      

         
         
     } catch {
         print(error)
     }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch!.location(in: self)
        
        if (atPoint(location).name == "Idle") {
            self.bossNode.run(self.idle!)
            //self.bossNode.run(self.angry!)
        }
        else if (atPoint(location).name == "Bite")
        {
            self.bossNode.run(self.bite!)
        
        }
        else if (atPoint(location).name == "Ground")
        {
            self.bossNode.run(self.ground!)
  //          print(self.bossNode.children)
   //         print(self.bossNode.childNode(withName: "Ground_14"))
        }
        else if (atPoint(location).name == "Glow")
        {
            self.bossNode.run(self.glow!)
        }
        else if (atPoint(location).name == "Beam")
        {
            self.bossNode.run(self.beam!)
        }
    }
}
