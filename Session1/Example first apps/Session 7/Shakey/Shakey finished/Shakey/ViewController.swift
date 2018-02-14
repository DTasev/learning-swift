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
    
    func wibbleLeft(sender: UISwipeGestureRecognizer) {
        playSound("shakeleft")
        wibbleOneDice(diceLeft)
    }
    
    func wibbleRight(sender: UISwipeGestureRecognizer) {
        playSound("shakeright")
        wibbleOneDice(diceRight)
    }
    
    func wibbleTop(sender: UISwipeGestureRecognizer) {
        playSound("shakeup")
        wibbleOneDice(diceTop)
    }
    
    func wibbleBottom(sender: UISwipeGestureRecognizer) {
        playSound("shakedown")
        wibbleOneDice(diceBottom)
    }

    func wibbleMiddle(sender: UITapGestureRecognizer) {
        playSound("shakemiddle")
        wibbleOneDice(diceMiddle)
    }
    
    func wibbleAll(sender: UIRotationGestureRecognizer) {
        playSound("shakeallover")
        wibbleAllDice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Put all the dice views into an array, so can change all at once
        diceArray = [diceTop, diceLeft, diceMiddle, diceRight, diceBottom]
        // Put all possible dice images into an array
        dicePics = [ UIImage( named: "one.jpg" )!, UIImage( named: "two.jpg" )!,
             UIImage( named: "three.jpg" )!, UIImage( named: "four.jpg" )!,
             UIImage( named: "five.jpg" )!, UIImage( named: "six.jpg" )! ];
        // Put random values on each dice
        for item in diceArray {
            item.image = dicePics[getRandom(dicePics.count)-1]
        }
        //Set up recognizers for each possible swipe
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.wibbleRight(_:)) )
        rightRecognizer.direction = .Right // Default value anyway
        self.view.addGestureRecognizer(rightRecognizer)
        
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.wibbleLeft(_:)) )
        leftRecognizer.direction = .Left
        self.view.addGestureRecognizer(leftRecognizer)
        
        let upRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.wibbleTop(_:)) )
        upRecognizer.direction = .Up
        self.view.addGestureRecognizer(upRecognizer)
        
        let downRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.wibbleBottom(_:)) )
        downRecognizer.direction = .Down
        self.view.addGestureRecognizer(downRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.wibbleMiddle(_:)) )
        tapRecognizer.numberOfTapsRequired = 2 
        self.view.addGestureRecognizer(tapRecognizer)
        
        let rotateRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.wibbleAll(_:)) )
        rotateRecognizer.rotation = 30
        self.view.addGestureRecognizer(rotateRecognizer)
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
    //Takes an array of images, and returns 6 of them in random order
        var tempImages: [UIImage]  = []
        print("Start wibble")
        for _ in 1...6 {
            let x =  getRandom(dicePics.count)-1
            print( x )
            tempImages.append( dicePics[x] )
        }
        print("Done wibble")
        return tempImages;
    }
    
    func wibbleOneDice( thisDice: UIImageView ) {
        thisDice.animationImages = randomPics( )
        thisDice.animationDuration = 0.8 // seconds
        thisDice.animationRepeatCount = 2; // 0 = loops forever
        thisDice.startAnimating()
        thisDice.image = thisDice.animationImages![thisDice.animationImages!.count-1]
    }
    
    // Run the following method to make the dice "roll"
    func wibbleAllDice() {
       for dice in diceArray{
           wibbleOneDice( dice )
        }
    }
}

