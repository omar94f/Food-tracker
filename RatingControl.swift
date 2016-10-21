//
//  RatingControl.swift
//  Food tracker
//
//  Created by Omar Farooq on 10/17/16.
//  Copyright © 2016 Omar. All rights reserved.
//

import UIKit

//@IBDesignable
class RatingControl: UIView {
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<starCount{
            let button = UIButton( frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons += [button]
            addSubview(button)
            
        }
        // print("this is it")
    }
    override func layoutSubviews() {
        let buttonSize = 44
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
  /*  override func invalidateIntrinsicContentSize(){
    
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
         return CGSize(width: width, height: buttonSize)
    }*/
    func ratingButtonTapped(button: UIButton){
        print("Rating tapped")
    }

}
