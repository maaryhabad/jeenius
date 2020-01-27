//
//  MusicWithIntro.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 27/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import AVFoundation

class MusicWithIntro: Music, AVAudioPlayerDelegate {
    
    private var intro: AVAudioPlayer!
    
    init(introFileName: String, loopFileName: String) {
        super.init(fileName: loopFileName)
        self.intro = super.load(introFileName)
        intro.numberOfLoops = 0 //não repete
        intro.delegate = self
    }
    
    override func play() {
        intro.play()
        
    }
    
    override func stop() {
        intro.stop()
        intro.currentTime = 0
        super.stop()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        super.play()
    }
}

