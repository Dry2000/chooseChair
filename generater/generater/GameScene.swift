//
//  GameScene.swift
//  generater
//
//  Created by 洞井僚太 on 2019/07/17.
//  Copyright © 2019 洞井僚太. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var recentInt:[Int]=[]
  //  var touchLabel = SKSpriteNode(imageNamed: "button")
    var figure:Int!
    var figureLabel:SKLabelNode!
   let namelab:[String] = ["任意の名前"]
    var nameLabel:[SKLabelNode] = []
   // var text = UILabel!
    
    override func didMove(to view: SKView) {
        for i in 0..<namelab.count{
            let label = SKLabelNode(text:namelab[i])
            nameLabel.append(label)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* for touch in touches{
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            print(touchedNode)
            if touchedNode == touchLabel{
                setFigure()
                print("ok")
            }
 
 }*/setFigure()
    }
    func setFigure(){
        //var figureLabel:SKLabelNode!
        var count = false
        while(true){
            figure = Int(arc4random_uniform(43))
            
            if recentInt.count == 0 && figure != 0{
           /*     self.removeAllChildren()
                self.addChild(touchLabel)*/
                nameLabel[0].position = CGPoint(x:0,y:self.frame.height/3)
                nameLabel[0].fontSize = frame.width/4
                self.addChild(nameLabel[0])
                var figureLabel = SKLabelNode(text:"\(String(figure))")
               // figureLabel.text = "\(String(describing: figure))"
                figureLabel.position = CGPoint(x:0,y:-frame.height/3)
                figureLabel.fontSize = frame.width/2
                addChild(figureLabel)
                recentInt.append(figure)
                break
            }
            for i in 0..<recentInt.count{
              //print(figure)
                if figure == recentInt[i]||figure == 0{
                    break
                }
                else if (i+1)==recentInt.count{
                  //  print(1)
                    self.removeAllChildren()
                   // figureLabel.removeFromParent()
                    nameLabel[i].removeFromParent()
                    nameLabel[i+1].position = CGPoint(x:0,y:self.frame.height/3)
                    nameLabel[i+1].fontSize = frame.width/4
                    self.addChild(nameLabel[i+1])
                    var figureLabel = SKLabelNode(text:"\(String(figure))")
               //      self.addChild(touchLabel)
                   // figureLabel.removeFromParent()
                  //  figureLabel.text = "\(String(describing: figure))"
                    figureLabel.position = CGPoint(x:0,y:-frame.height/3)
                    figureLabel.fontSize = frame.width/2
                    addChild(figureLabel)
                    recentInt.append(figure)
                    print(recentInt)
                    count = true
                    break
                }
            }
            if count{
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
