//
//  Wallet.swift
//  StoreDapp
//
//  Created by Grumbach on 10/6/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class Wallet : BoxView
{
    let img_piggybank = UIImageView(image: UIImage(named: "piggybank"))
    //add more subviews TODO

    let web3 = Web3()
    var coinBase: String? = nil
    var currentBalance: Int32? = nil

    override init(frame aFrame: CGRect) {super.init(frame: aFrame)}
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder)}
    convenience init()
    {
        self.init(frame: CGRect.zero)//TODO fix this on all 3 boxes!no touch
        super.construct()
        initView()
        initWeb3()
    }

    private func initView()
    {

        self.addSubview(img_piggybank)
        self.img_piggybank.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.height.equalTo(200)
            make.width.equalTo(190)}
        //add more subviews TODO
    }
    private func initWeb3()
    {
        if let coinBase = web3.coinBase {
            currentBalance = web3.getBalance(coinbase: coinBase)}
        else {
            coinBase = "[Error fetching coinBase]"}
    }

    override func goForeground()
    {
        super.goForeground()
        self.img_piggybank.isHidden = true
        //show all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
    }
    override func goMenu()
    {
        self.img_piggybank.isHidden = false
        //hide all other subviews TODO
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)}
    }
}
