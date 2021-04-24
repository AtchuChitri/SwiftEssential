//
//  ViewController.swift
//  RSwiftUsingPods
//
//  Created by Bollisetty Bala Baskar on 24/04/21.
//

import UIKit
//import Rswift

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let icon = R.image.car3()
        imageView.image = icon
        // Do any additional setup after loading the view.
    }


}

