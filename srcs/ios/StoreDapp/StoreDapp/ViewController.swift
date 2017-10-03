//
//  ViewController.swift
//  StoreDapp
//
//  Created by Grumbach on 10/3/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //Set Boxes
        let topView = BoxView(initcolor: UIColor.gray)
        let bottomLeftView = BoxView(initcolor: UIColor.darkGray)
        let bottomRightView = BoxView(initcolor: UIColor.lightGray)
        self.view.addSubview(topView)
        self.view.addSubview(bottomLeftView)
        self.view.addSubview(bottomRightView)
        topView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)}
        bottomLeftView.snp.makeConstraints { (make) -> Void in
            make.left.bottom.equalTo(0)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)}
        bottomRightView.snp.makeConstraints { (make) -> Void in
            make.right.bottom.equalTo(0)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)}

        //Set images
        let piggybank = UIImageView(image: UIImage(named: "piggybank"))
        let scan = UIImageView(image: UIImage(named: "scan"))
        let transactions = UIImageView(image: UIImage(named: "transactions"))
        topView.addSubview(piggybank)
        bottomLeftView.addSubview(scan)
        bottomRightView.addSubview(transactions)
        piggybank.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(topView)
            make.height.equalTo(200)
            make.width.equalTo(190)}
        scan.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(bottomLeftView)
            make.height.equalTo(160)
            make.width.equalTo(160)}
        transactions.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(bottomRightView)
            make.width.equalTo(180)
            make.height.equalTo(180)}
    }
}
