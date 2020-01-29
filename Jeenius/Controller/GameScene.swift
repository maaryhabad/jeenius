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
    
    let imageView = createImgView()
    var sequencia = prepareSequence()
    var sequenciaFileName: [String] = []
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        
        MusicPlayer.shared.play(.intro2)
        
        for triangle in Model.instance.triangles {
            addChild(triangle.node)
        }
        
        let circle = createCircle()
        addChild(circle)
        view.addSubview(imageView)
        
        actionPlay()
        
    }
    
    func actionPlay() {
        var delay = 0.0
        
        for triangulo in sequencia {
            run(SKAction.wait(forDuration: delay)) {
                triangulo.isPlaying()
                var novoFileName = sortSound(triangulo: triangulo)
                self.sequenciaFileName.append(novoFileName)
                
                //tocar a sequência(?)
            }
            delay += 2
            print("trocou a cor pro modelo")
        }
        run(SKAction.wait(forDuration: delay)) {
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        // se o triângulo for igual ao triângulo sorteado
            //toca o mesmo som
            //dá um ponto
        // se não
            // reinicia a sequencia
            // tirar todos os pontos
        for triangle in Model.instance.triangles {
            if triangle.node.contains(pos) { //sequencia[triangle] == triangle
                imageView.image = UIImage(named: triangle.imagem)
                triangle.isPlaying()
                
                for file in sequenciaFileName {
                    playSound(fileName: file)
                }
                
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
