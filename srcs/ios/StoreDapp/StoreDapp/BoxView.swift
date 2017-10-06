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
    var id :String? = nil
    var delegate :MainViewController? = nil
    override init(frame: CGRect){super.init(frame: frame)}
    required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
    convenience init(givenId :String? = nil)
    {
        self.init(frame: CGRect.zero)
        self.construct(givenId: givenId)
    }
    func construct(givenId :String? = nil)
    {
        self.id = givenId!
        self.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(self.frame.size)}
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)));
        self.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil)
    {
        self.delegate!.currentView = self.id!
        self.delegate?.refreshView()
    }
}
