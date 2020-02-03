//
//  Triangles.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 24/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

public class Triangle {
    
    var toTop: [CGFloat]
    var toBot: [CGFloat]
    var base: [CGFloat]
    var node: SKShapeNode
    var som: String
    var cor: UIColor
    var imagem: String
    var percussao: Bool
    
    init(toTop: [CGFloat], toBot: [CGFloat], base: [CGFloat],  som: String, cor: UIColor, imagem: String, percussao: Bool) {
        self.som = som
        self.cor = cor
        self.imagem = imagem
        self.toTop = toTop
        self.toBot = toBot
        self.base = base
        self.percussao = percussao
        
        let path = UIBezierPath()
        path.move(to: CGPoint())
        path.addLine(to: CGPoint(x: toTop[0], y: toTop[1]))
        path.addLine(to: CGPoint(x: base[0], y: base[1]))
        path.addLine(to: CGPoint(x: toBot[0], y: toBot[1]))
        let triangulo = SKShapeNode(path: path.cgPath)
        
        triangulo.fillColor = cor
        triangulo.strokeColor = UIColor.clear
        self.node = triangulo
    }
    
    func isPlaying() {

        node.fillColor = cor.withAlphaComponent(0.3)
        node.run(SKAction.wait(forDuration: 1.0)){
            self.isWaiting()
        }
    }
    
    func isWaiting() {
        node.fillColor = cor
        //print(cor)
       //voltar pra cor original
    }
}
