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
    let header = UILabel()
    let scanView = UIView()
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
        //image and header
        self.addSubview(img_scan)
        self.img_scan.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.height.equalTo(160)
            make.width.equalTo(160)}

        header.text = "scan"
        header.font = header.font.withSize(40)
        self.addSubview(header)


        //scanView
        self.addSubview(scanView)
        scanView.snp.makeConstraints { make in
            make.size.equalTo(self.frame.size)
            make.center.equalTo(self.center)}

        //add more subviews TODO
    }
    override func goForeground()
    {
        super.goForeground()
        self.img_scan.isHidden = true
        self.scanView.isHidden = false
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
            self.header.snp.remakeConstraints { (make) -> Void in
                make.centerX.equalTo(img_scan)
                make.top.equalTo(self.snp.top).inset(20)}
    }
    override func goMenu()
    {
        super.goMenu()
        self.img_scan.isHidden = false
        self.scanView.isHidden = true
        self.snp.remakeConstraints { (make) -> Void in
            make.left.bottom.equalTo(0)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)
            make.width.equalTo(self.superview!.snp.width).multipliedBy(0.5)}
            self.header.snp.remakeConstraints { (make) -> Void in
                make.centerX.equalTo(img_scan)
                make.top.equalTo(img_scan.snp.bottom).offset(10)}
    }
}
