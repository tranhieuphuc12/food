//
//  UIRating.swift
//  FoodManagement2024
//
//  Created by DaiTran on 27/4/24.
//

import UIKit

class UIRating: UIStackView {
    
    private var ratingButtons = [UIButton]()
    private var _ratingValue = 0
    
    var ratingValue:Int  {
        get{
            return self._ratingValue
        }
        set{
            self._ratingValue = newValue
            ratingConstruct()
            
        }
    }
    
    @IBInspectable private var starNum:Int = 5{
        didSet{
            ratingConstruct()
        }
    }
    @IBInspectable private var starSize:CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            ratingConstruct()
        }
    }
    
    // MARK: Constructors
    required init(coder: NSCoder) {
        super.init(coder: coder)
        ratingConstruct()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ratingConstruct()
    }
    
    // Function constructed object UIRating
    private func ratingConstruct(){
        for btn in ratingButtons{
            btn.removeFromSuperview()
            removeArrangedSubview(btn)
        }
        ratingButtons.removeAll()
        
        let highlighted = UIImage(named: "highlighted.png")
        let normal = UIImage(named: "normal.png")
        let selected = UIImage(named: "selected.png")
        
        for _ in 0..<starNum{
            let btnRating = UIButton()
            
            
            btnRating.addAction(UIAction(handler: {action in
                if let btn = action.sender as? UIButton{
                    self.ratingButtonTapped(btn)
                }
                
            }), for: .touchUpInside)
            
            //configure size for object
            btnRating.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            btnRating.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            
            //background color
//            btnRating.backgroundColor = .orange
            
            btnRating.setImage(normal, for: .normal)
            btnRating.setImage(selected, for: .selected)
            btnRating.setImage(highlighted, for: .highlighted)
            
            
            //btnRating(sub_UI) -> UIRating(base_UI)
            addArrangedSubview(btnRating)// have order
            ratingButtons.append(btnRating)
                        
//
        }
        updateButtonState()
    }
    private func ratingButtonTapped(_ button: UIButton){
       
        if let index = ratingButtons.firstIndex(of: button){
            let selectedRating = index + 1
            
            _ratingValue = selectedRating == _ratingValue ? _ratingValue-1: selectedRating
            
        }
//        print(ratingValue)
        updateButtonState()
    }
    
    private func updateButtonState(){
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected = index < _ratingValue
            
        }
        
    }

}
