//
//  ExpantionViewController.swift
//  SlideshowApp
//
//  Created by 小野 拓人 on 2022/04/14.
//

import UIKit

class ExpantionViewController: UIViewController {
    
    
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        secondImageView.image = image

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
