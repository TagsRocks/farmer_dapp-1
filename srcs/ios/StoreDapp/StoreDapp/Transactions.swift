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
    let header = UILabel()
    let transactionsView = UIView()
    let img_meme = UIImageView(image: UIImage(named: "meme2"))
    //add more subviews NB

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
        self.addSubview(img_transactions)
        self.img_transactions.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.width.equalTo(180)
            make.height.equalTo(180)}

        header.text = "history"
        header.font = header.font.withSize(40)
        self.addSubview(header)


        // transactionsView
        self.addSubview(transactionsView)
        self.transactionsView.addSubview(img_meme)

        transactionsView.snp.remakeConstraints { make in
            make.size.equalTo(self.frame.size)
            make.center.equalTo(self)}
        img_meme.snp.remakeConstraints { (make) -> Void in
        make.center.equalTo(self.transactionsView)}
        //add more subviews constraints NB
    }

    override func goForeground()
    {
        super.goForeground()
        self.img_transactions.isHidden = true
        self.transactionsView.isHidden = false
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
            self.header.snp.remakeConstraints { (make) -> Void in
                make.centerX.equalTo(img_transactions)
                make.top.equalTo(self.snp.top).inset(20)}
    }
    override func goMenu()
    {
        super.goMenu()
        self.img_transactions.isHidden = false
        self.transactionsView.isHidden = true
        self.snp.remakeConstraints { (make) -> Void in
            make.right.bottom.equalTo(0)
            make.width.equalTo(self.superview!.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)}
        self.header.snp.remakeConstraints { (make) -> Void in
            make.centerX.equalTo(img_transactions)
            make.top.equalTo(img_transactions.snp.bottom)}
    }
}
