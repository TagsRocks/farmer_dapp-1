//
//  BoxView.swift
//  StoreDapp
//
//  Created by Grumbach on 10/3/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class BoxView: UIView, UIGestureRecognizerDelegate {
    private var color: UIColor = UIColor.white

    override init(frame: CGRect){super.init(frame: frame)}
    required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
    convenience init(initcolor: UIColor? = UIColor.white)
    {
        self.init(frame: CGRect.zero)
        self.construct(initcolor: initcolor)
    }
    func construct(initcolor: UIColor? = UIColor.white)
    {
        self.color = initcolor!
        self.backgroundColor = self.color
        self.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(self.frame.size)}
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("handleTap:")))
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }
    func handleTap(sender: UITapGestureRecognizer)
    {
        self.backgroundColor = UIColor.white
        self.backgroundColor = self.color
    }
}
