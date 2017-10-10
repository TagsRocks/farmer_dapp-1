//
//  BoxView.swift
//  StoreDapp
//
//  Created by Grumbach on 10/3/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class BoxView: UIView, UIGestureRecognizerDelegate
{
    var delegate :MainViewController? = nil
    var isBackground :Bool = false
    override init(frame: CGRect){super.init(frame: frame)}
    required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
    convenience init()
    {
        self.init(frame: CGRect.zero)
        self.construct()
    }
    func construct()
    {
        self.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(self.frame.size)}
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)));
        self.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil)
    {
        if (self.isBackground == false)
        {
            self.delegate!.currentView = self
            self.delegate?.refreshView()
        }
    }

    func goBackground() {self.layer.zPosition = 2; self.isBackground = true}
    func goForeground() {self.layer.zPosition = 42; self.isBackground = false}
    func goMenu()       {self.isBackground = false}
}
