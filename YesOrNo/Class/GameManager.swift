//
//  GameManager.swift
//  YesOrNo
//
//  Created by mumu on 2019/4/5.
//  Copyright © 2019年 Mumu. All rights reserved.
//

import Foundation
import UIKit
struct GameManager {
    init() {
        
    }
    let colorArray = [UIColor.red,UIColor.white,UIColor.blue,UIColor.green,UIColor.purple,UIColor.black,UIColor.lightGray,UIColor.yellow,UIColor.orange,UIColor.brown]
    let titleArray = ["红色","白色","蓝色","绿色","紫色","黑色","灰色","黄色","橘色","棕色"]
    
    
    func startGame() -> (bgColor:UIColor, titleColor:UIColor ,title:String, answer:Bool) {
//        let randomIndex = Int(arc4random() % colorArray.count)
        let count = colorArray.count
        
        let randomAnswer = arc4random() % 2
        let randomLabelColor = Int(Int(arc4random()) % count)
        var titleC:UIColor?
        
        var answerB:Bool?
        let titleL = titleArray[randomLabelColor]
        var againLabelTitle = randomLabelColor
        if randomAnswer == 0 { //false 需要label颜色和title不一样。
            answerB = false
            //在算出一个随机的title index要和 randomLabelColor 不一样
            while againLabelTitle == randomLabelColor {
                againLabelTitle = Int(Int(arc4random()) % count)
            }
            titleC = colorArray[againLabelTitle]
        } else { //返回ture label颜色和title一致
            titleC = colorArray[randomLabelColor]
            answerB = true
        }
//        var randomColorNumber:Int = Int(Int(arc4random()) % count)
//        while randomColorNumber == againLabelTitle { //防止背景颜色和label颜色一样。
//            randomColorNumber = Int(Int(arc4random()) % count) //随机背景颜色
//        }
//        colorArray[randomColorNumber]
//        let randomBGColor = randomColor()
        
        print("number=),answer=\(randomAnswer)")
        return (bgColor: randomColor(), titleColor: titleC!, title: titleL, answer: answerB!)
    }
    func randomColor() -> UIColor {
        let r = Float(arc4random_uniform(255)) / 256.0
        let g = Float(arc4random_uniform(255)) / 256.0
        let b = Float(arc4random_uniform(255)) / 256.0
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
}
