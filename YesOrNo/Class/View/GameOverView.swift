//
//  GameOverView.swift
//  YesOrNo
//
//  Created by mumu on 2019/4/4.
//  Copyright © 2019年 Mumu. All rights reserved.
//

import UIKit
typealias HanleBlock = (_ confirm:Bool)->()

class GameOverView: UIView ,CAAnimationDelegate{
    var handleBlock:HanleBlock?
    
    @IBOutlet weak var scoreImage: UIImageView!
    class func overView() ->  GameOverView {
        let gameView:GameOverView = Bundle.main.loadNibNamed(String("\(GameOverView.self)"), owner: nil, options: nil)?.first as! GameOverView
        return gameView
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let path = Bundle.main.path(forResource: "Resource/Image/2", ofType: "png")
        let image = UIImage(named: "2.png")
//        scoreImage.image = UIImage(contentsOfFile: path!)
        scoreImage.image = image;
    }
    func show() -> Void {
        let baseA = CABasicAnimation(keyPath: "position.y")
        baseA.fromValue = UIScreen.main.bounds.height * 2
        baseA.toValue = UIScreen.main.bounds.height - 200
        baseA.isRemovedOnCompletion = false
        baseA.fillMode = CAMediaTimingFillMode.forwards
        baseA.duration = 0.2
        baseA.delegate = self
        self.layer.add(baseA, forKey: "show")
    }
    func dismiss() -> Void {
        let baseA = CABasicAnimation(keyPath: "position.y")
        baseA.fromValue = UIScreen.main.bounds.height - 200
        baseA.toValue = UIScreen.main.bounds.height * 2
        baseA.duration = 0.2
        baseA.isRemovedOnCompletion = false
        baseA.fillMode = CAMediaTimingFillMode.forwards
        baseA.delegate = self
        self.layer.add(baseA, forKey: "dismiss")
    }
    @IBOutlet weak var scoreLabel: UILabel!
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if self.layer.animation(forKey: "dismiss") == anim {
            self.layer.removeAnimation(forKey: "dismiss")
            self.removeFromSuperview()
        } else {
            self.layer.removeAnimation(forKey: "show")
        }
    }
    //10 11
    @IBAction func subBtnClick(_ sender: UIButton) {
        self.dismiss()
        if let handle = handleBlock {
            handle(sender.tag == 10 ? false : true)
        }
    }
    
    @IBOutlet weak var confirmBtnClick: UIButton!
}
