//
//  Shapes.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 24/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import SpriteKit

func createTriangles() -> [SKShapeNode] {
    
    var triangulo: SKShapeNode!
    let center = CGPoint(x: 0.0, y: 0.0)
    var triangulos: [SKShapeNode] = []
    
    for triangle in Model.instance.triangles {
        let path = UIBezierPath()
        path.move(to: center)
        path.addLine(to: CGPoint(x: triangle.toTop[0], y: triangle.toTop[1]))
        path.addLine(to: CGPoint(x: triangle.base[0], y: triangle.base[1]))
        path.addLine(to: CGPoint(x: triangle.toBot[0], y: triangle.toBot[1]))
        triangulo = SKShapeNode(path: path.cgPath)
        
        triangulo.fillColor = triangle.cor
        triangulo.strokeColor = UIColor.clear
        triangulos.append(triangulo)
    }
    return triangulos
}

func createCircle() -> SKShapeNode {
    var circle = SKShapeNode(circleOfRadius: 150)
    circle.position = CGPoint(x: 0.0, y: 0.0)
    circle.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    circle.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    return circle
}

func createImgView() -> UIImageView {
    let image = UIImage(named: "icone.png")
    let imageView = UIImageView(image: image)
    imageView.frame = CGRect(x: 160, y: 400, width: 100, height: 100)
    
    return imageView
}



