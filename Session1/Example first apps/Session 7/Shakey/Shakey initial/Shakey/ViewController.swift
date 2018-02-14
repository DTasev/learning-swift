//
//  ViewController.swift
//  Shakey
//
//  Created by Chris Price on 18/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var avPlayer = AVAudioPlayer()
    var diceArray: [UIImageView] = [] // IBOutlets for the five dice
    var dicePics: [UIImage] = []  // Pictures of different dice faces
    
    @IBOutlet weak var diceTop: UIImageView!
    @IBOutlet weak var diceLeft: UIImageView!
    @IBOutlet weak var diceMiddle: UIImageView!
    @IBOutlet weak var diceRight: UIImageView!
    @IBOutlet weak var diceBottom: UIImageView!
    
    
    @IBAction func doTheShake(sender: UIButton) {
        playSound("shakey")
        wibbleAllDice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceArray = [diceTop, diceLeft, diceMiddle, diceRight, diceBottom]
        dicePics = [ UIImage( named: "one.jpg" )!, UIImage( named: "two.jpg" )!,
             UIImage( named: "three.jpg" )!, UIImage( named: "four.jpg" )!,
             UIImage( named: "five.jpg" )!, UIImage( named: "six.jpg" )! ];
        for item in diceArray {
            item.image = dicePics[getRandom(dicePics.count)-1]
        }
    }


    func playSound(soundFileName: String) {
        let fileURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource( soundFileName, ofType: "mp3")!)
        do{
            avPlayer = try AVAudioPlayer.init(contentsOfURL: fileURL )
            avPlayer.prepareToPlay()
            avPlayer.play()
        }catch {
            print("Failed to play the audio file")
        }
    }
    
    // Return a random number between 1 and max
    func getRandom( biggest: Int) -> Int{
        let tmpNum = Int(arc4random_uniform(UInt32(1000)))
        return (tmpNum % biggest)+1
    }
    
    func randomPics() -> [UIImage] {
    //Takes an array of images, and returns 10 of them in random order
        var tempImages: [UIImage]  = []
        for _ in 1...10 {
          tempImages.append( dicePics[getRandom(dicePics.count)-1] )
        }
        return tempImages;
    }
    
    func wibbleOneDice( thisDice: UIImageView ) {
        thisDice.animationImages = randomPics( )
        thisDice.animationDuration = 2; // seconds
        thisDice.animationRepeatCount = 2; // 0 = loops forever
        thisDice.startAnimating()
    }
    
    // Run the following method to make the dice "roll"
    func wibbleAllDice() {
       for dice in diceArray{
           wibbleOneDice( dice )
        }
    }
}

