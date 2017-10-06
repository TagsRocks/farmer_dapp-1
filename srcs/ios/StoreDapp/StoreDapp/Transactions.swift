//
//  Transactions.swift
//  StoreDapp
//
//  Created by Grumbach on 10/6/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class Transactions : BoxView
{
    let img_transactions = UIImageView(image: UIImage(named: "transactions"))
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
        self.addSubview(img_transactions)
        self.img_transactions.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.width.equalTo(180)
            make.height.equalTo(180)}
        //add more subviews TODO
    }

    override func goForeground()
    {
        super.goForeground()
        self.img_transactions.isHidden = true
        //show all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
    }
    override func goMenu()
    {
        self.img_transactions.isHidden = false
        //hide all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.right.bottom.equalTo(0)
            make.width.equalTo(self.superview!.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)}
    }
}
