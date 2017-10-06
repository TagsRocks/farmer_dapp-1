//
//  Scan.swift
//  StoreDapp
//
//  Created by Grumbach on 10/6/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class Scan : BoxView
{
    let img_scan = UIImageView(image: UIImage(named: "scan"))
    //add more subviews TODO

    let web3 = Web3()

    override init(frame aFrame: CGRect) {super.init(frame: aFrame)}
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder)}
    convenience init()
    {
        self.init(frame: CGRect.zero)
        super.construct()
        initView()
    }

    private func initView()
    {

        self.addSubview(img_scan)
        self.img_scan.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.height.equalTo(160)
            make.width.equalTo(160)}
        //add more subviews TODO
    }
    override func goForeground()
    {
        super.goForeground()
        self.img_scan.isHidden = true
        //show all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
    }
    override func goMenu()
    {
        self.img_scan.isHidden = false
        //hide all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.left.bottom.equalTo(0)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)
            make.width.equalTo(self.superview!.snp.width).multipliedBy(0.5)}
    }
}
