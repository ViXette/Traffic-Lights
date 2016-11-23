//
//  ViewController.swift
//  Traffic Lights
//
//  Created by VX on 22/11/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var trafficLight: UIImageView!
	@IBOutlet weak var counter_label: UILabel!
	@IBOutlet weak var startStop_button: UIButton!
	
	var timer = Timer()
	var scoreTimer = Timer()
	
	var timerNum = 0
	var scoreNum = 0
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		scoreNum = 0
		counter_label.text = String(scoreNum)
	}
	

	@IBAction func startStopTapped(_ sender: UIButton) {
		if scoreNum == 0 {
			counter_label.text = "0"
			
			timerNum = 3
			
			trafficLight.image = UIImage(named: "TrafficLight")
			
			startStop_button.isEnabled = false
			startStop_button.setTitle("", for: [])
			
			timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
		} else {
			scoreTimer.invalidate()
		}
		
		if timerNum == 0 {
			scoreNum = 0
			startStop_button.setTitle("Restart", for: [])
		}
	}
	
	
	func updateCounter() {
		trafficLight.image = UIImage(named: "TrafficLight\(timerNum)")

		timerNum -= 1
		
		if timerNum == 1 {
			startStop_button.setTitle("Stop", for: [])
		} else if timerNum == 0 {
			timer.invalidate()
			
			startStop_button.isEnabled = true
			
			scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
		}
	}
	
	
	func updateScoreTimer()	{
		scoreNum += 1
		counter_label.text = String(scoreNum)
	}

	
}

