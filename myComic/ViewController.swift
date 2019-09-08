//
//  ViewController.swift
//  myComic
//
//  Created by Yako Kobayashi on 2019/06/26.
//  Copyright © 2019 stepAppSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageNumber:Int = 0       //ページ番号の初期値を0にする
    let MAX_PAGE_NUMBER:Int = 4  //最終ページを４ページにする
    
    @IBOutlet weak var imageView: UIImageView!
    //初期化
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "wani0")
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(pageNumber == 1) {          //1ページ目の時
            imageView.stopAnimating()  //アニメーションを止める
            pageNumber -= 1            //ページ番号を１減らす（0ページ目にする）
            imageView.image = UIImage(named: "wani0") //imageViewにイメージ"wani0"を表示する
        }
        else if(pageNumber > 1) {               //１ページ目でもエンドページでもない時
            pageNumber -= 1                     //ページ番号を１減らす
            changePage(pageNumber: pageNumber)  //ファンクションchangePageを実行する
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if(pageNumber == MAX_PAGE_NUMBER) {           //ページ番号が最終ページ（４）の時
            pageNumber += 1                           //ページ番号を１増やす（５にする）
            imageView.stopAnimating()                 //アニメーションを止める
            imageView.image = UIImage(named: "wani9") //imageViewにイメージ"wani9"を表示する
        }
        else if(pageNumber < MAX_PAGE_NUMBER) {       //ページ番号が最終ページ（４）より前のページの時
            pageNumber += 1                           //ページ番号を１増やす
            changePage(pageNumber: pageNumber)        //ファンクションchangePageを実行する
        }
    }
    
    //ページを切り替えてアニメーションを動かすファンクション pageNumber：表示したいページ
    func changePage(pageNumber: Int) {
        imageView.stopAnimating()   //動いていたアニメーションを止める
        let fileNameA:String = String(format:"wani%d",pageNumber * 2 - 1)  //アニメ素材の画像名fileNameAを取得する
        let fileNameB:String = String(format:"wani%d",pageNumber * 2)      //アニメ素材の画像名fileNameBを取得する
        //imageViewで表示するアニメーションの画像を用意する
        imageView.animationImages = [UIImage(named:fileNameA),UIImage(named:fileNameB)!] as? [UIImage]
        //画像のコマ送りの時間を設定
        imageView.animationDuration = 1
        //コマ送りを開始する
        imageView.startAnimating()
    }
}

