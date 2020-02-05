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

protocol GameControllerDelegate: class {
    func openMenu()
}

class GameScene: SKScene {
    
    weak var gameControllerDelegate : GameControllerDelegate?
    let instrumentView = createInstrumentImgView()
    var sequencia = prepareSequence()
    var sequenciaFileName: [String] = []
    var ponteiro = 0
    var gameViewController = GameViewController()
    var pause = createButtonPause()
    
    
    enum GameState{
        case showing
        case playing
         
    }
    var score:SKLabelNode = SKLabelNode(text: "0")
    var currentGameStete = GameState.showing
    var delay = 0.01
    //variável já tocou - bool
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        score.fontName = "SFProDisplay-Black"
        
//        MusicPlayer.shared.play(.intro2)
        
        for triangle in Model.instance.triangles {
            addChild(triangle.node)
        }
        
        let circle = createCircle()
        addChild(circle)
        addChild(instrumentView)
//        addChild(pause)
        
        score.position = CGPoint(x: -200, y: 450)
        score.fontColor = .black
        score.fontSize = 100
        score.zPosition = 10
        addChild(score)
        addChild(pause)
        delay  = 0.0
        
        actionPlay()
        
    }
    
    func actionPlay() {
        
        currentGameStete = GameState.showing
        ponteiro = 0
        
        print("tocou actionPlay \(getStringSequence())")
        
        sequenciaFileName = []
        for triangulo in sequencia {
            run(SKAction.wait(forDuration: delay)) {
                triangulo.isPlaying()
                let novoFileName = sortSound(triangulo: triangulo)
                self.sequenciaFileName.append(novoFileName)
                playSound(fileName: novoFileName)
                print("play sound: \(self.sequenciaFileName)")
            }
            delay += 2
            print("trocou a cor pro modelo: \(triangulo.som)")
        }
        run(SKAction.wait(forDuration: delay)) {
            self.currentGameStete = GameState.playing
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        if currentGameStete != .playing{
            return
        }
        
        if sequencia[ponteiro].node.contains(pos) {
            
            if sequencia.count > ponteiro {
                sequencia[ponteiro].node.fillColor = .green
                
                instrumentView.texture = SKTexture(imageNamed: sequencia[ponteiro].imagem)
//                instrumentView.image = UIImage(named: sequencia[ponteiro].imagem)
                
                sequencia[ponteiro].isPlaying()
                
                
                playSound(fileName: sequenciaFileName[ponteiro])
                
                
                
                gameViewController.pontuacao += 1
                score.text = "\(gameViewController.pontuacao)"
                
                ponteiro += 1
                
                //toca o som
                //dá ponto
                //sorteia outro triângulo
            }
            
            if sequencia.count == ponteiro {
                sequencia = prepareSequence()
                ponteiro = 0
                playSound(fileName: "acerto.mp3")
                delay = 1.5
                actionPlay()
                MenuViewController.submitScore(score: self.gameViewController.pontuacao)
                
            }
            //sorteia outro triângulo se for o último
        } else {
            
            sequencia[ponteiro].node.fillColor = .red
            run(SKAction.wait(forDuration: 1.0)) {
                self.sequencia[self.ponteiro].node.fillColor = self.sequencia[self.ponteiro].cor
                self.ponteiro = 0
                self.gameViewController.pontuacao = 0
                self.sequenciaFileName = []
                resetSequence()
                playSound(fileName: "erro.mp3")
                self.sequencia = prepareSequence()
                self.actionPlay()
                MenuViewController.submitScore(score: self.gameViewController.pontuacao)
            }
            
            
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            if pause.contains(location) {
                gameControllerDelegate?.openMenu()
            }
        }
        
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
