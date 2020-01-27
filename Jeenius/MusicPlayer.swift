//
//  MusicPlayer.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 27/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    static var shared = MusicPlayer()
    private var musics = [Song: Music]()
    
    private init() {
        musics[.intro] = MusicWithIntro(introFileName: "intro_1.mp3", loopFileName: "loop_1.mp3")
        musics[.intro2] = MusicWithIntro(introFileName: "intro_2.mp3", loopFileName: "loop_2.mp3")
    }
    
    func play(_ songToPlay: Song) {
        for (song, music) in musics {
            if song == songToPlay {
                music.play()
            } else {
                music.stop()
            }
        }
    }
}

enum Song {
//    case bateria
//    case caixa
    case intro
    case intro2
}
