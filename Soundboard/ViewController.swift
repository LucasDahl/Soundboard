//
//  ViewController.swift
//  Soundboard
//
//  Created by Lucas Dahl on 1/19/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Properties
    var audioPlayer: AVAudioPlayer?
    var soundArray = ["a", "b", "c", "d"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //========
    // Methods
    //========
    
    func playSound(_ note: String) {
        
        // Make a reference to the sound url
        let soundUrl = Bundle.main.url(forResource: note, withExtension: "mp3")
        
        // Make sure that a file was found
        guard soundUrl != nil else { return }
        
        do {
            
            // Try playing the sound file
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
            
            // Actually plays the sound
            audioPlayer?.play()
            
        } catch {
            
            // Print any errors
            print("Error playing sound file: \(error)")
            
        }
        
    }
    
    //=================
    // MARK: - Action
    //=================
    
    @IBAction func buttonTpped(_ sender: UIButton) {
        
        // Get the selected button based on  its tag property, and use that tag - 1 to selcet the sound to play using the method.
        let selectedSound = soundArray[sender.tag - 1]
        
        playSound(selectedSound)
        
    }
    
}

