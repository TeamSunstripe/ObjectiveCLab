//
//  BatteryViewController+Animation.swift
//  testCode
//
//  Created by Ohshima You on 2019/05/22.
//  Copyright © 2019 Team Sun Stripe All rights reserved.
//

import UIKit

/**
 * BatteryViewController.swift
 * バッテリーレベル / バッテリーステータスを表示するビューコントローラークラス
 **/
class BatteryAnimationViewController: BatteryViewController {

}

/**
 * バッテリー残量の変化に関する
 */
extension BatteryAnimationViewController {
    /// バッテリー残量の変化に対する処理
    override func displayBatteryLevel() {
        super.displayBatteryLevel()
        NSLog("%@", "animationBatteryLevel")
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.labelBatteryLevel.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0, alpha: 0.3)
            self.view.layoutIfNeeded()
            
        },completion:nil)
        
        
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {
           
            self.labelBatteryLevel.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0, alpha: 0.3)
            self.view.layoutIfNeeded()
            
            //終わったらアニメーションする
        }, completion: {(finished: Bool) in
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {

                self.labelBatteryLevel.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0, alpha: 0.0)
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            UIView.animate(withDuration: 10, delay:1.5, options: .curveEaseIn, animations: {
               
                self.labelBatteryLevel.backgroundColor = UIColor.init(red: 1.0, green: 0.0, blue: 0, alpha: 0.5)
                self.view.layoutIfNeeded()
                
            }, completion: nil)
        })
    }
    
    /// バッテリーの給電状況の変化に対する処理
    override func displayBatteryState() {
        super.displayBatteryState()
        NSLog("%@", "animationBatteryState")
        UIView.animate(withDuration: 5.0, delay: 5.0, options: .curveLinear, animations: {
            self.labelBatteryStatus.alpha = 1.0

        }, completion: {(finished: Bool) in
            if (finished) {
                self.labelBatteryStatus.alpha = 0.5 
            }
        })
    }
}
