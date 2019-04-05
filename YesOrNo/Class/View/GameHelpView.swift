//
//  GameHelpView.swift
//  YesOrNo
//
//  Created by mumu on 2019/4/5.
//  Copyright © 2019年 Mumu. All rights reserved.
//

import UIKit

class GameHelpView: UIView,CAAnimationDelegate {
    static func helpView() -> GameHelpView {
        let helpview = Bundle.main.loadNibNamed(String("\(GameHelpView.self)"), owner: nil, options: nil)?.first as! GameHelpView
        return helpview
    }
    func show() -> Void {
        let baseA = CABasicAnimation(keyPath: "transform.scale")
        baseA.fromValue = 0.5
        baseA.toValue = 1.0
        baseA.duration = 0.2
        baseA.isRemovedOnCompletion = true
        baseA.delegate = self
        self.layer .add(baseA, forKey: "base")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    @IBAction func confirmBtnClick(_ sender: UIButton) {
//        self.layer.animation(forKey: "base").remove
        self.removeFromSuperview()
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        self.layer.removeAllAnimations()
    }
}
