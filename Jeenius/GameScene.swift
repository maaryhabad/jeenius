//
//  GameScene.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 21/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    
    
    let triangleNodes = createTriangles()
    let imageView = createImgView()
    
    override func didMove(to view: SKView) {
        
        MusicPlayer.shared.play(.intro)
        
        for triangleNode in triangleNodes {
            addChild(triangleNode)
        }
        
        let circle = createCircle()
        addChild(circle)
        view.addSubview(imageView)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        for triangle in triangleNodes {
            if triangle.contains(pos) {
                let index = triangleNodes.firstIndex(of: triangle)
                print("triangulo: " , index!)
                let triangulo = Model.instance.triangles[index!]
                imageView.image = UIImage(named: triangulo.imagem)
                
                if triangulo.percussao == true {
                    var percussao = ["bateria.mp3", "caixa.mp3"]
                    var fileName = percussao.randomElement()
                    var sound = CustomAudioPlayer(fileName: fileName!)
                    sound.play()
                    print("tocou o som da", fileName)
                } else {
                    var sopros = ["E2.mp3", "F#2.mp3", "G#2.mp3", "A2.mp3", "B2.mp3", "C#3.mp3", "D#3.mp3", "E3.mp3"]
                    
                    var fileName = triangulo.som + sopros.randomElement()!
                    var sound = CustomAudioPlayer(fileName: fileName)
                    sound.play()
                }

                // função recebe o index, toca o som e dá ótima.
            }
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
