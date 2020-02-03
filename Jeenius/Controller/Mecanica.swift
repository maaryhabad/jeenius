//
//  Mecanica.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 28/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

private var sequencia: [Triangle] = []
private var indice = 0
private var model = Model.instance.triangles
private var sound: CustomAudioPlayer!

func resetSequence(){
    sequencia = []
    indice = 0
}

func prepareSequence() -> [Triangle] {
    let random = model.randomElement()
    sequencia.append(random!)
    indice += 1
    return sequencia
}

func getStringSequence() -> [String]{
    var aux = [String]()
    for tri in sequencia{
        aux.append(tri.imagem)
    }
    return aux
}

func sortSound(triangulo: Triangle) -> String { // sorteia o triângulo
    
    let fileName: String
    
    if triangulo.percussao == true {
        let percussao = ["bateria.mp3", "caixa.mp3"]
        if triangulo.cor == UIColor(#colorLiteral(red: 0.937254902, green: 0.537254902, blue: 0.9058823529, alpha: 1)) {
            fileName = percussao[0]
        } else {
            fileName = percussao[1]
        }

        print("tocou o som da", fileName)
    } else {
        let sopros = ["E2.mp3", "F#2.mp3", "G#2.mp3", "A2.mp3", "B2.mp3", "C#3.mp3", "D#3.mp3", "E3.mp3"]
        let elemento = sopros.randomElement()
        
        fileName = triangulo.som + elemento!
    }
    
    return fileName
}

func playSound(fileName: String) {
    sound = CustomAudioPlayer(fileName: fileName)
    sound.play()
    print("tocou o: ", fileName)
}


//checa se a pessoa clicou no certo.

//desativa os triângulos enquanto toca.
