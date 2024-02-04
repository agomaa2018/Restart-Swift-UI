//
//  AudioPlayer.swift
//  restart
//
//  Created by Ahmed Gomaa on 04/02/2024.
//

import Foundation
import AVFoundation

var AudioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            AudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path) )
            AudioPlayer?.play()
        }
        catch {
            print("this file does not exist")
        }
    }
}
