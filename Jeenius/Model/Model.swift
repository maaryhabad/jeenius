//
//  Model.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 24/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class Model {
    static let instance = Model()
    
    private init() {
        
    }
    
    let triangles: [Triangle] = [
        Triangle(toTop: [0.0, -1000], toBot: [0.0, 0.0], base: [1000, -1000], som: "trombone_", cor: UIColor(#colorLiteral(red: 0.4352941176, green: 0.7529411765, blue: 0.8392156863, alpha: 1)), imagem: "trombone.png", percussao: false),
        Triangle(toTop: [1000, -1000], toBot: [0.0, 0.0], base: [1000, 200], som: "", cor: UIColor(#colorLiteral(red: 0.9568627451, green: 0.631372549, blue: 0.9254901961, alpha: 1)), imagem: "bateria.png", percussao: true),
        Triangle(toTop: [1000, 200], toBot: [0.0, 0.0], base: [1000, 2000], som: "sax_", cor: UIColor(#colorLiteral(red: 0.5568627451, green: 0.7764705882, blue: 0.6470588235, alpha: 1)), imagem: "sax.png", percussao: false),
        Triangle(toTop: [1000, 2000], toBot: [0.0, 0.0], base: [-1000, 2000], som: "", cor: UIColor(#colorLiteral(red: 0.9764705882, green: 0.8196078431, blue: 0.5098039216, alpha: 1)), imagem: "caixa.png", percussao: true),
        Triangle(toTop: [-1000, 2000], toBot: [0.0, 0.0], base: [-1000, -700], som: "trompete_", cor: UIColor(#colorLiteral(red: 0.8784313725, green: 0.4392156863, blue: 0.3058823529, alpha: 1)), imagem: "trompete.png", percussao: false),
        Triangle(toTop: [-1000, -700], toBot: [0.0, 0.0], base: [-1000, -200000], som: "trompa_", cor: UIColor(#colorLiteral(red: 0.6196078431, green: 0.4862745098, blue: 0.6196078431, alpha: 1)), imagem: "trompa.png", percussao: false)
    ]
}
