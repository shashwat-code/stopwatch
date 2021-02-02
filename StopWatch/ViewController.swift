//
//  ViewController.swift
//  StopWatch
//
//  Created by Shashwat on 02/02/21.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startbuttonLabel: UIButton!
    var isStarted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var timer:Timer?
    var counter=0.0
    
    @objc
    func increaseCounter(){
        counter=counter+0.1
        timerLabel.text = String(round(counter*10)/10)
    }
    @IBAction func startButton(_ sender: UIButton) {
        if isStarted{
            counter=0.0
            
            timer?.invalidate()
            startbuttonLabel.setTitle("START", for: .normal)
            isStarted=false
            
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseCounter), userInfo: nil, repeats: true)
            startbuttonLabel.setTitle("STOP", for: .normal)
            isStarted=true
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        isStarted=false
        counter=0.0
        timerLabel.text = "0.0"
        startbuttonLabel.setTitle("START", for: .normal)
        timer?.invalidate()
        
    }
}

