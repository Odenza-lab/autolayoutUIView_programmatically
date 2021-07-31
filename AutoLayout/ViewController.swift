//
//  ViewController.swift
//  AutoLayout
//
//  Created by ODENZA on 31/7/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(yellowView)
        yellowView.fillSuperView()
        
        let views = [redView, blueView, greenView]
        views.forEach { view.addSubview($0) }
      
        setupViewLayout()
    }
    
    func setupViewLayout() {
        
        
        let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: padding, size: .init(width: 100, height: 0))
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: redView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        blueView.anchorSize(to: redView)
        
        greenView.anchor(top: redView.topAnchor, leading: view.leadingAnchor, bottom: blueView.bottomAnchor, trailing: redView.leadingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .zero)
    }


}

extension UIView {
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        //enable auto layout
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}

