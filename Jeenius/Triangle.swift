//
//  Triangles.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 24/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class Triangle {
    
    var toTop: [CGFloat]
    var toBot: [CGFloat]
    var base: [CGFloat]
    var som: String
    var cor: UIColor
    var imagem: String
    var percussao: Bool
    
    init(toTop: [CGFloat], toBot: [CGFloat], base: [CGFloat], som: String, cor: UIColor, imagem: String, percussao: Bool) {
        self.som = som
        self.cor = cor
        self.imagem = imagem
        self.toTop = toTop
        self.toBot = toBot
        self.base = base
        self.percussao = percussao
    }
}
