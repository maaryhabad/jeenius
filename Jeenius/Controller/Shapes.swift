//
//  Shapes.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 24/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import SpriteKit


func createCircle() -> SKShapeNode {
    let circle = SKShapeNode(circleOfRadius: 150)
    circle.position = CGPoint(x: 0.0, y: 0.0)
    circle.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    circle.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    return circle
}

func createInstrumentImgView() -> SKSpriteNode {
    var player = SKSpriteNode()
    
    let image = UIImage(named: "icone.png")
    let texture = SKTexture(image: image!)
    player = SKSpriteNode(texture: texture)
    player.position = CGPoint (x: 0, y: 0)
    player.size = CGSize(width: 200, height: 200)
    
    return player
}

func createButtonPause() -> SKSpriteNode {
    let button = SKSpriteNode(imageNamed: "pause.png")
    
    button.name = "btn"
    button.size = CGSize(width: 100, height: 100)
    button.position = CGPoint(x: 200, y: 500)
    
    return button
}

//func createInstrumentImgView() -> SKSpriteNode() {
//
////    imageView.frame = CGRect(x: 160, y: 400, width: 100, height: 100)
////    imageView.frame = CGRect(origin: CGPoint(), size: CGSize(width: 100, height: 100))
//
////    return imageView
//}





