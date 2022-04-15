//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小野 拓人 on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    
    @IBOutlet var tapFirstImageView: UITapGestureRecognizer!
    
    @IBOutlet weak var moveOnButton: UIButton!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var startPauseButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面遷移の時に記入、segueがどこに繋がるか理解するコード
        self.performSegue(withIdentifier: "toExpantionVC", sender: nil)
        // Do any additional setup after loading the view.
        
        firstImageView.image = UIImage(named: "panda")
        
    }

    
    
    
    @IBAction func TapFirstImageView(_ sender: Any) {
        
        //画像の画面遷移のコード
        let expantionViewController = self.storyboard?.instantiateViewController(withIdentifier: "toExpantionVC") as! ExpantionViewController
        expantionViewController.image = firstImageView.image
              self.present(expantionViewController, animated: true, completion: nil)
    }
    
    
    var figure = 0
    
    
    //進むボタン押した時のコード
    @IBAction func MoveOnButton(_ sender: Any) {
        
        //表示される画像の分岐
        if figure == 4 {
            figure = 0
        } else {
            figure += 1
        }
        
        //画像一覧
        firstImageView.image = [ #imageLiteral(resourceName: "panda"), #imageLiteral(resourceName: "fox"), #imageLiteral(resourceName: "sky"), #imageLiteral(resourceName: "sakura"), #imageLiteral(resourceName: "green")][figure]
    }
    
    //戻るボタン押した時のコード
    @IBAction func BackButton(_ sender: Any) {
        

        
        //表示される画像の分岐
        if figure == 0 {
            figure = 4
        } else {
            figure -= 1
        }
        
        //画像一覧
        firstImageView.image = [ #imageLiteral(resourceName: "panda"), #imageLiteral(resourceName: "fox"), #imageLiteral(resourceName: "sky"), #imageLiteral(resourceName: "sakura"), #imageLiteral(resourceName: "green")][figure]
    }
    
    //ここより以下はタイマー設定
    
    // 配列に指定するindex番号を宣言
       var nowIndex:Int = 0

       // スライドショーに使用するタイマーを宣言
       var timer: Timer!
    
    var firstImageViewSlide = [ #imageLiteral(resourceName: "panda"), #imageLiteral(resourceName: "fox"), #imageLiteral(resourceName: "sky"), #imageLiteral(resourceName: "sakura"), #imageLiteral(resourceName: "green")]
    
    @IBAction func StartPauseButton(_ sender: Any) {
        
        
        // 再生中か停止しているかを判定
         if (timer == nil) {
             // 再生時の処理を実装

             // タイマーをセットする
             timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

             tapFirstImageView.isEnabled = false
             moveOnButton.isEnabled = false
             backButton.isEnabled = false
             
             
             startPauseButton.setTitle("停止", for: .normal)
             

         } else {
             // 停止時の処理を実装
             // タイマーを停止する
             timer.invalidate()

             // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
             timer = nil
             
             tapFirstImageView.isEnabled = true
             moveOnButton.isEnabled = true
             backButton.isEnabled = true
             
             startPauseButton.setTitle("再生", for: .normal)

         }
     }

     @objc func changeImage() {
         // indexを増やして表示する画像を切り替える
         nowIndex += 1

         // indexが表示予定の画像の数と同じ場合
         if (nowIndex == firstImageViewSlide.count) {
             // indexを一番最初の数字に戻す
             nowIndex = 0
         }
         // indexの画像をstoryboardの画像にセットする
         firstImageView.image = firstImageViewSlide[nowIndex]
     }
    
    
    
    

}

