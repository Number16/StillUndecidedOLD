//
//  StatisticsViewController.swift
//  StillUndecided
//
//  Created by 16 on 13/12/2017.
//  Copyright © 2017 Anonim. All rights reserved.
//

import UIKit
import ConcentricProgressRingView
import LionheartExtensions

class StatisticsViewController: UIViewController {

    @IBOutlet weak var StatisticsContainer: UIView!
    var progressRingView: ConcentricProgressRingView!
    
    override func viewDidLoad() {
        let margin: CGFloat = 1
        let radius: CGFloat = 80
        
        
        let rings = [
            ProgressRing(color: UIColor(.RGB(255, 255, 255)), backgroundColor: UIColor(.RGB(20, 20, 20))),
            ProgressRing(color: UIColor(.RGB(200, 200, 200)), backgroundColor: UIColor(.RGB(20, 20, 20))),
            ProgressRing(color: UIColor(.RGB(150, 150, 150)), backgroundColor: UIColor(.RGB(20, 20, 20)))
        ]
        
        progressRingView = try! ConcentricProgressRingView(center: view.center, radius: radius, margin: margin, rings: rings, defaultColor: UIColor.clear, defaultWidth: 18)
        
        dump(progressRingView)
        
        
        progressRingView[0].setProgress(0.9, duration: 1)
        progressRingView[1].setProgress(0.7, duration: 1)
        progressRingView[2].setProgress(0.5, duration: 1)
        
        
        view.backgroundColor = UIColor.black
        
        StatisticsContainer.addSubview(progressRingView)
        progressRingView.center = CGPoint(x: StatisticsContainer.frame.width / 2, y: StatisticsContainer.frame.height / 2)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        for (i, _) in progressRingView.enumerated() {
//            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(randomAnimation(_:)), userInfo: i, repeats: true)
//        }
//    }
//
//    @objc func randomAnimation(_ timer: Timer?) {
//        guard let index = timer?.userInfo as? Int else {
//            return
//        }
//
//        let f = Int64(0.2 * Double(index) * Double(NSEC_PER_SEC))
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(f) / Double(NSEC_PER_SEC), execute: {
//            self.progressRingView[index].setProgress(CGFloat(drand48()), duration: max(0.4, CGFloat(drand48())))
//        })
//    }
}
