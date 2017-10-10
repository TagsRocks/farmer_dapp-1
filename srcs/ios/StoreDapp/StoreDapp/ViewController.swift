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
    let walletView = Wallet()
    let scanView = Scan()
    let transactionsView = Transactions()
    let backButton = UIImageView(image: UIImage(named: "back"))
    public var currentView: BoxView? = nil

    convenience init()
    {
        self.init(nibName: nil, bundle: nil)
        walletView.delegate = self
        scanView.delegate = self
        transactionsView.delegate = self
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.addSubview(walletView)
        self.view.addSubview(scanView)
        self.view.addSubview(transactionsView)
        self.view.addSubview(backButton)

        self.initBackButton()
        self.welcomePage()
    }
    func initBackButton()
    {
        backButton.layer.zPosition = CGFloat.greatestFiniteMagnitude - 1
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)));
        backButton.addGestureRecognizer(tapGesture)
        backButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(17)
            make.left.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo(60)}
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil)
    {
        currentView = nil
        refreshView()
    }
    func welcomePage()
    {
        walletView.backgroundColor = UIColor.gray
        scanView.backgroundColor = UIColor.darkGray
        transactionsView.backgroundColor = UIColor.lightGray

        self.refreshView()
    }
    func refreshView()
    {
        UIView.animate(withDuration: 0.3)
        {
            if self.currentView != nil
            {
                self.backButton.isHidden = false
                self.walletView.goBackground()
                self.transactionsView.goBackground()
                self.scanView.goBackground()
                self.currentView!.goForeground()
            }
            else
            {
                self.backButton.isHidden = true
                self.walletView.goMenu()
                self.transactionsView.goMenu()
                self.scanView.goMenu()
            }
            self.view.layoutIfNeeded()
        }
    }
}
