//
//  ViewController.swift
//  SlideshowApp
//
//  Created by m20 on 2016/02/27.
//  Copyright © 2016年 takashi.matsuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func change_image(sender: UITapGestureRecognizer) {
        
        //画面遷移
        performSegueWithIdentifier("TransferImage", sender: nil)
        
        //画像情報渡す
        print("test")
    }
    
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var next_button: UIButton!
    @IBOutlet weak var return_button: UIButton!
    @IBOutlet weak var start_stop_button: UIButton!
    
    let images = [UIImage(named: "IMG_8571.JPG"), UIImage(named: "IMGP8515.JPG"), UIImage(named: "IMGP8500.JPG")]
    weak var timer: NSTimer?
    var flg = true
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destinationViewController as! ImageViewController
        // 遷移先のImageViewControllerに画像を渡す
        imageViewController.fullImage = imageview.image!
        //class名調べる
        print(segue.destinationViewController.dynamicType)
    }
    
    @IBAction func start_stop_button(sender: UIButton) {
        //スライドショー判定
        //スライドショー停止時、スタート
        if flg == true {
            print("再生処理")
            start_stop_button.setTitle("停止", forState: .Normal)
            next_button.enabled = false
            return_button.enabled = false
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "next_button:", userInfo: nil, repeats: true)
            flg=false
        }
        //スライドショー起動時、ストップ
        else if flg == false{
            print("停止処理")
            timer?.invalidate()
            timer=nil
            start_stop_button.setTitle("再生", forState: .Normal)
            next_button.enabled = true
            return_button.enabled = true
            flg=true
        }
    }

    var i = 0
    
    @IBAction func next_button(sender: UIButton) {
        //次の画像切り替え
        let count = images.count
        i += 1
        if i == count{
            i = 0
        }
        imageview.image = images[i]
    }
    @IBAction func return_button(sender: UIButton) {
        //前の画像に切り替え
        let count = images.count
        if i == 0{
            i = count
        }
        i -= 1
        imageview.image = images[i]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageview.image = images[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
}

