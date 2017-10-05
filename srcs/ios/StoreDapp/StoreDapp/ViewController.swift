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
    let walletView = BoxView(givenId:"wallet")
    let scanView = BoxView(givenId:"scan")
    let transferView = BoxView(givenId:"transfers")
    let back = UIImageView(image: UIImage(named: "back"))
    let piggybank = UIImageView(image: UIImage(named: "piggybank"))
    let scan = UIImageView(image: UIImage(named: "scan"))
    let transactions = UIImageView(image: UIImage(named: "transactions"))
    public var currentView = "welcome"
    
     convenience init(){
        self.init(nibName: nil, bundle: nil)

        walletView.delegate = self
        scanView.delegate = self
        transferView.delegate = self
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.addSubview(walletView)
        self.view.addSubview(scanView)
        self.view.addSubview(transferView)
        self.view.addSubview(back)
        walletView.addSubview(piggybank)
        scanView.addSubview(scan)
        transferView.addSubview(transactions)

        self.refreshView()
    }
    
    private func clearall()
    {
        back.isHidden = true
        transactions.isHidden = true
        piggybank.isHidden = true
        scan.isHidden = true
        walletView.isHidden = true
        scanView.isHidden = true
        transferView.isHidden = true
    }
    private func welcomePage()
    {
        walletView.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)}
        scanView.snp.remakeConstraints { (make) -> Void in
            make.left.bottom.equalTo(0)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)}
        transferView.snp.remakeConstraints { (make) -> Void in
            make.right.bottom.equalTo(0)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)}
        piggybank.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(walletView)
            make.height.equalTo(200)
            make.width.equalTo(190)}
        scan.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(scanView)
            make.height.equalTo(160)
            make.width.equalTo(160)}
        transactions.snp.remakeConstraints { (make) -> Void in
            make.center.equalTo(transferView)
            make.width.equalTo(180)
            make.height.equalTo(180)}
        clearall()
        transactions.isHidden = false
        piggybank.isHidden = false
        scan.isHidden = false
        walletView.isHidden = false
        scanView.isHidden = false
        transferView.isHidden = false
    }
    private func walletPage()
    {
        back.snp.remakeConstraints { (make) -> Void in
            make.top.left.equalTo(0)}
        walletView.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
        clearall()
        back.isHidden = false
        walletView.isHidden = false
    }
    private func scanPage()
    {
        back.snp.remakeConstraints { (make) -> Void in
            make.top.left.equalTo(0)}
        scanView.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
        clearall()
        scanView.isHidden = false
        back.isHidden = false
    }
    private func transferPage()
    {
        back.snp.remakeConstraints { (make) -> Void in
            make.top.left.equalTo(0)}
        transferView.snp.remakeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(0)}
        clearall()
        transferView.isHidden = false
        back.isHidden = false
    }

    func refreshView()
    {
        walletView.backgroundColor = UIColor.gray
        scanView.backgroundColor = UIColor.darkGray
        transferView.backgroundColor = UIColor.lightGray
        UIView.animate(withDuration: 5){
            switch self.currentView {
            case "wallet":
                self.walletPage()
            case "scan":
                self.scanPage()
            case "transfers":
                self.transferPage()
            default:
                self.welcomePage()}
            self.walletView.superview?.layoutIfNeeded()
        }
    }
}
