//
//  BackButtonView.swift
//  StoreDapp
//
//  Created by Grumbach on 10/6/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import SnapKit

class BackButtonView: UIImageView, UIGestureRecognizerDelegate
{
    var delegate :MainViewController? = nil
    override init(image: UIImage?){super.init(image: image)}
    required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
    convenience init(image: UIImage)
    {
        print("hello?")
        self.init(image: image)
        self.construct()
    }
    func construct()
    {
        print("GOOD")
        self.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(self.frame.size)}
        self.layer.zPosition = CGFloat.greatestFiniteMagnitude
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)));
        self.addGestureRecognizer(tapGesture)
        print("GOOD")
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil )
    {
        print("HEY!")
        self.delegate!.currentView = "weclome"
        self.delegate?.refreshView()
    }
}

