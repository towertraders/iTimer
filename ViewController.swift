//
//  ViewController.swift
//  iTimer2
//
//  Created by Gavin Vincent on 28/07/2016.
//  Copyright © 2016 Tower Traders Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timerHistory: UILabel!
    var Counter = 0
    var Stopwatch = NSTimer()
    
    @IBAction func resetTimer(sender: AnyObject) {
        Stopwatch.invalidate()
        Counter = 0
        timer.text = "\(Counter)"
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        Stopwatch = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func endTimer(sender: AnyObject) {
        Stopwatch.invalidate()
        let myDate = NSDate()
        let correctDate = NSDateFormatter()
        correctDate.dateStyle = .MediumStyle
        timerHistory.text = "\(correctDate.stringFromDate(myDate)) = \(Counter) seconds"
    }
    
    func updateTimer() {
        Counter += 1
        timer.text = "\(Counter)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Counter = 0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

