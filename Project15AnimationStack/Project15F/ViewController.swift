//
//  ViewController.swift
//  Project15F
//
//  Created by Maksat Baiserke on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }
    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
//        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        UIView.animate(withDuration: 10, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1000, options: [], animations: {
            switch self.currentAnimation { // damping will just show how fast it will reach equilibrium pos ( closer to 0 "very slow, with lots of propogation at high speed" closer to 1 "very fast, with least amount of propagation, at low speed")
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .green
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
            default:
                break
            }
        }, completion: {
            finished in
            sender.isHidden = false
        })
        currentAnimation += 1

        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}

