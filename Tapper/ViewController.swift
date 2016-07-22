//
//  ViewController.swift
//  Tapper
//
//  Created by Neel Khattri on 7/18/16.
//  Copyright © 2016 SimpleStuff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    var maxTaps: Int = 0
    var currentTaps: Int = 0

    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var tapLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.textField.delegate = self
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    @IBAction func coinButtonTapped(sender:UIButton) {
        
        currentTaps += 1
        updateTapsLabel()
        
        if checkForGameOver() == true {
            restartGame()
        }
    }
    
    
    
    @IBAction func playButtonClicked (sender: UIButton!) {

        if textField.text != nil && textField.text != "" {
            
            logoImage.hidden = true
            textField.hidden = true
            playButton.hidden = true
            
            coinButton.hidden = false
            tapLabel.hidden = false
            
            maxTaps = Int(textField.text!)!
            currentTaps = 0
            
           updateTapsLabel()
        }
    }
    
    func restartGame () {
        maxTaps = 0
        textField.text = ""
        logoImage.hidden = false
        textField.hidden = false
        playButton.hidden = false
        
        coinButton.hidden = true
        tapLabel.hidden = true
    }
    
    
    func updateTapsLabel() {
        tapLabel.text = "\(currentTaps) taps"
    }
    
    
    func checkForGameOver () -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        
        return false
    }
}

