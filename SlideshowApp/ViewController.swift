//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yuta Saitoh Jr. on 2020/12/31.
//  Copyright © 2020 yuta.saitoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outletの接続
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage]! = [
        UIImage(named: "neko1")!,
        UIImage(named: "neko2")!,
        UIImage(named: "neko3")!,
        UIImage(named: "neko4")!,
        UIImage(named: "neko5")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 再生ボタンを押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        if (timer == nil) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        }
    }
    
    @IBAction func previousImage(_ sender: UIButton) {
        if (timer == nil) {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == -1) {
            // indexを一番最後の数字に戻す
            nowIndex = 4
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        }
    }
    
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toSubViewController" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? SubViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.selectedImg = self.imageArray[nowIndex]
        }
    }
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "toSubViewController",sender: nil)
    }
    
    
}

