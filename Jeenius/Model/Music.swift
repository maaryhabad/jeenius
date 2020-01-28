//
//  Music.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 27/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import AVFoundation

class Music: NSObject {
    
    private var player: AVAudioPlayer!
    
    
    
    init(fileName: String) {
        super.init()
        self.player = load(fileName)
    }
    
    func load(_ fileName: String) -> AVAudioPlayer {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.numberOfLoops = -1 //tocar infinitamente
            return player
        } catch {
            fatalError("O arquivo não foi encontrado")
        }
    }
    
    func play() {
        if player.isPlaying {
            return
        }
        player.play()
    }
    
    func stop() {
        player.stop()
        player.currentTime = 0 //volta para o começo
    }
}
