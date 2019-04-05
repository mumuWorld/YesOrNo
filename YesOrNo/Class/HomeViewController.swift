//
//  HomeViewController.swift
//  YesOrNo
//
//  Created by mumu on 2019/4/4.
//  Copyright © 2019年 Mumu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var negativeBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var bgColorView: UIView!
    @IBOutlet weak var startGameBtn: UIButton!
    
    lazy var helpView:GameHelpView = {
        let help = GameHelpView.helpView()
        help.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 200)
        return help
    }()
    lazy var overView:GameOverView = {
        let over =  GameOverView.overView()
        over.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
        return over
    }()
    
    lazy var gameManager:GameManager = GameManager()
    
    var currentAnswert:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.overView.handleBlock = {[weak self] (confirm:Bool)->() in
            if confirm {
                self?.handleManagerParm()
            } else {
                self?.negativeBtn.isHidden = true
                self?.confirmBtn.isHidden = true
                self?.startGameBtn.isHidden = false
            }
        }
        let isneed = Tools.isNeedShowHelp()
        if isneed {
            self.view.addSubview(self.helpView)
            self.helpView.show()
            Tools.setNeedShowHelp(bool: false)
        }
        
        self.negativeBtn.isHidden = true
        self.confirmBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func negativeBtnClick(_ sender: UIButton) {
        let selectedAnswer:Bool = (sender.tag == 10) ? false : true
        
        if selectedAnswer == currentAnswert {
            let currentScore = Int(scoreLabel.text!)
            scoreLabel.text = "\(currentScore! + 1)"
            self.handleManagerParm()
        } else { //回答错误 展示失败view
            self.overView.scoreLabel.text = self.scoreLabel.text
            self.overView.show()
            self.view.addSubview(self.overView)

        }
    }
    
    @IBAction func startGameClick(_ sender: UIButton) {
        self.negativeBtn.isHidden = false
        self.confirmBtn.isHidden = false
        self.startGameBtn.isHidden = true
//        return (bgColor: colorArray[randomLabelColor], titleColor: titleC!, title: titleL, answer: answerB!)
        self.handleManagerParm()
    }

    func handleManagerParm() -> Void {
        let result = self.gameManager.startGame()
        self.bgColorView.backgroundColor = result.bgColor
        self.colorLabel.textColor = result.titleColor
        self.colorLabel.text = "我是" + result.title
        self.currentAnswert = result.answer
    }
    
    @IBAction func helpBtnClick(_ sender: UIButton) {
        self.helpView.show()
        self.view.addSubview(self.helpView)
    }
    
}
