//
//  CustomAudioPlayer.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 27/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import AVFoundation

class CustomAudioPlayer {
    
    private var players = [AVAudioPlayer]()
    private var url: URL!

    
    init(fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        url = URL(fileURLWithPath: path)
        
        load()
    }
    
    private func load() {
           do {
               let player = try AVAudioPlayer(contentsOf: url)
               player.prepareToPlay()
               players.append(player)
           } catch {
               print("O arquivo não foi encontrado")
           }
       }
    
    func play() {
        // Procura um player disponível
        for player in players {
            if player.isPlaying == false {
                player.play()
                return
            }
        }
        load()
        players.last?.play() //Chama o último da lista
        //Não há player disponível
        //Criar um novo player
    }
}
