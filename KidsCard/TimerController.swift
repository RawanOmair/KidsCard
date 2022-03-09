//
//  TimerController.swift
//  KidsCard
//
//  Created by Rawan Omair on 05/08/1443 AH.
//


import UIKit

class TimerController: UIViewController {

   
    

    @IBOutlet weak var timerTextView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var seconds:Int = 0
    var timer = Timer()
    
    var hasStarted = false

    @IBAction func startTimer(_ sender: UIButton)
    {
        if hasStarted { pauseTimer() }
           else { startTimer() }
    }
    
    @IBAction func resetTimer(_ sender: UIButton)
    {
        resetTimer()
    }

}
  
   
extension TimerController {
    
    func pauseTimer() {
        
        if hasStarted {
            timer.invalidate()
            startButton.setTitle("START", for: .normal)
            hasStarted = false
    }
    }
        func startTimer() {
            guard let timerInfo = timerTextView.text else {
                Alerts.showBasicAlert(title: "Error!", massage: "There was some kind of error when trying to countdown", on: self)
                return }
            
            do {
                seconds = try timeToSeconds(for: timerInfo)
            } catch {
                Alerts.showBasicAlert(title: "Invalid time format", massage: "Please make sure you enter a valid time in the textview", on: self)
            }
          
            guard seconds > 0 else {
                
                Alerts.showBasicAlert(title: "Invalid time format", massage: "Please make sure you enter a valid time in the textview", on: self)
                
                return }
            
            timerTextView.isEditable = false
            resetButton.isHidden = false
            
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
            startButton.setTitle("PAUSE", for: .normal)
            hasStarted = true
        }
    
    func reset() {
        timer.invalidate()
        resetButton.isHidden = true
        
        seconds = 0
        timerTextView.isEditable = true
        hasStarted = false
        
        startButton.setTitle("START", for: .normal)
        timerTextView.text = "00:00:00"
        
        
    }
    
          @objc  func count() {
        seconds -= 1
        timerTextView.text =  secondsToTime(for: seconds)
        
        if timerTextView.text == "24:00:00" || timerTextView.text == "00:00:00"  {
            reset()
            Alerts.showBasicAlert(title: "Timer has finished!", massage: "The timer has finished counting down from the specified time period.", on: self)
            
           
        }
    }
            
            func resetTimer() {
                reset()
                Alerts.showBasicAlert(title: "Timer reset!", massage: "", on: self)
            }

   
}

