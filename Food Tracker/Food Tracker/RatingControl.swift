//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Jeffrey Eng on 11/16/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    // MARK: Properties
    
    var rating = 0 {
        didSet {
            // Trigger a layout update every time the rating changes. Ensures UI is always showing an accurate representation of the rating property value.
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    // Set spacing value between each star
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
        let button = UIButton()
            
        button.setImage(emptyStarImage, for: .normal)
        button.setImage(filledStarImage, for: .selected)
        button.setImage(filledStarImage, for: [.highlighted, .selected])
        
        // Makes sure the image doesn't show an additional highlight during the state change
        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
        // Add button to the array
        ratingButtons += [button]
        // Adds the button created above to the RatingControl view
        addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override public var intrinsicContentSize: CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
