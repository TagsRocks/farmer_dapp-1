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
    let header = UILabel()
    let walletView = UIView()
    let labelCoinbase = UILabel()
    let labelBalance = UILabel()
    //add more subviews NB

    let web3 = Web3()
    var coinBase: String? = nil
    var currentBalance: Int32? = nil

    override init(frame aFrame: CGRect) {super.init(frame: aFrame)}
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder)}
    convenience init()
    {
        self.init(frame: CGRect.zero)
        super.construct()
        initWeb3()
        initView()
    }

    private func initWeb3()
    {
        if let getCoinbase = web3.coinBase
        {
            self.coinBase = getCoinbase
            if let getBalance = web3.getBalance(coinbase: getCoinbase){
                self.currentBalance = getBalance}
            else {
                self.currentBalance = -42}
        }
        else {
            self.coinBase = "[Error fetching coinBase]"}
    }
    private func initView()
    {
        //image and header
        self.addSubview(img_piggybank)
        self.img_piggybank.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.height.equalTo(200)
            make.width.equalTo(190)}

        header.text = "wallet"
        header.font = header.font.withSize(40)
        self.addSubview(header)


        //walletView
        self.addSubview(walletView)
        labelCoinbase.text = "Coinbase: \n\(self.coinBase!)"
        labelBalance.text = "Balance: \n\(self.currentBalance!)"
        labelCoinbase.font = labelCoinbase.font.withSize(30)
        labelBalance.font = labelBalance.font.withSize(30)
//        labelCoinbase.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.walletView.addSubview(labelCoinbase)
        self.walletView.addSubview(labelBalance)

        walletView.snp.makeConstraints { make in
            make.size.equalTo(self.frame.size)
            make.center.equalTo(self.center)}
        labelCoinbase.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(100)
            make.left.equalTo(self.walletView).inset(20)}
        labelBalance.snp.makeConstraints { make in
            make.top.equalTo(self.labelCoinbase.snp.bottom).offset(10)
            make.left.equalTo(self.walletView).inset(20)}
    }

    override func goForeground()
    {
        super.goForeground()
        self.img_piggybank.isHidden = true
        self.walletView.isHidden = false
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
        self.header.snp.remakeConstraints { (make) -> Void in
            make.centerX.equalTo(img_piggybank)
            make.top.equalTo(self.snp.top).inset(20)}
    }
    override func goMenu()
    {
        super.goMenu()
        self.img_piggybank.isHidden = false
        self.walletView.isHidden = true
        self.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(self.superview!.snp.height).multipliedBy(0.5)}
       self.header.snp.remakeConstraints { (make) -> Void in
           make.centerX.equalTo(img_piggybank)
           make.top.equalTo(img_piggybank.snp.bottom)}
    }
}
