//
//  ViewController.swift
//  SingingMinion
//
//  Created by BettyPan on 2020/12/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var lyricTextField: UITextView!
    @IBOutlet weak var singingSpeed: UISlider!
    @IBOutlet weak var singingTone: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var toneLabel: UILabel!
    @IBOutlet weak var singingSpeedMinion: UIImageView!
    @IBOutlet weak var singingToneMinion: UIImageView!
    
    
    func updateLocationSpeedMinion(degrees:CGFloat){
        singingSpeedMinion.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degrees).translatedBy(x: 0, y: -90)
    }
    func updateLocationToneMinion(degrees:CGFloat){
        singingToneMinion.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degrees).translatedBy(x: 0, y: -90)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //設定小小兵圓形起始點
        updateLocationSpeedMinion(degrees: 0)
        updateLocationToneMinion(degrees: 0)
        
    }
//設定開始唱歌按鍵
    @IBAction func startSinging(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: lyricTextField.text!)
        let synthesizer = AVSpeechSynthesizer()
        utterance.rate = singingSpeed.value
        utterance.pitchMultiplier = singingTone.value
        synthesizer.speak(utterance)
    }
    
    //設定Speed Slider
    @IBAction func changeSingingSpeed(_ sender: UISlider) {
        updateLocationSpeedMinion(degrees: CGFloat(sender.value))
        speedLabel.text = String(format: "%.2f", sender.value/36)
      
    }
    
    @IBAction func changeSingingTone(_ sender: UISlider) {
        updateLocationToneMinion(degrees: CGFloat(sender.value))
        toneLabel.text = String(format: "%.2f", sender.value/36)
        
    }
    
    
}

