//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 三浦　一真 on 2020/08/10.
//  Copyright © 2020 Kazuma Miura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //最初の画像を設定
    var imageIndex = 0
    
    var tappedImage :UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    let images = [UIImage(named: "asuka1"), UIImage(named: "asuka2"), UIImage(named: "asuka3")]
    
    
    var flg = false
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    var tapCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstImage = images[0]
        imageView.image = firstImage
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    
    @IBAction func reverseBotton(_ sender: Any) {
        if imageIndex == 0{
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    var counter = 0
    @IBAction func startstopBotton(_ sender: Any) {
        
        if tapCount % 2 == 0{
            Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(updateTimer(_:)),userInfo: nil, repeats: true)
            reverseBotton.isEnabled = true
            advanceBotton.isEnabled = true      }
        else{
            self.timer.invalidate()
            reverseBotton.isEnabled = false
            advanceBotton.isEnabled = false        }
        tapCount += 1    }
    
    
    
    
    @IBAction func advanceBotton(_ sender: Any) {
        if imageIndex == 2{
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
        
    }
    
    
    @IBOutlet weak var reverseBotton: UIButton!
    
    
    
    @IBOutlet weak var advanceBotton: UIButton!
    
    
    @IBAction func tapAction(_ sender: Any) {
        counter = counter + 1
        
        if counter == 1{
            self.performSegue(withIdentifier: "second", sender: nil)
            
            counter = 0
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second"{
            let resultViewController:ResultViewController = segue.destination as! ResultViewController
            resultViewController.imagea = imageView.image!        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
