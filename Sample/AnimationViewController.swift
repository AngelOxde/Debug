//
//  AnimationViewController.swift
//  YouthEducation
//
//  Created by KRISH JAIN on 12/10/2020.
//

import UIKit
import Lottie

//class AnimationViewController: UIViewController {
//    @IBOutlet var animationView: AnimationView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        startAnimation()
//        // Do any additional setup after loading the view.
//        animationView.play()
//         animationView.play { (finished) in
//            self.performSegue(withIdentifier: "TestSegway", sender: nil)
//          }
//    }
//
//    func startAnimation() {
//        animationView.animation = Animation.named("test2")
//
//
//
//        }
//    }
    

class AnimationViewController: UIViewController {
    @IBOutlet var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        startAnimation()
        // Do any additional setup after loading the view.
        let logoAnimation = AnimationView(name: "books")
        logoAnimation.contentMode = .scaleAspectFit
        logoAnimation.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoAnimation)

        logoAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoAnimation.heightAnchor.constraint(equalToConstant: 400).isActive = true
        logoAnimation.widthAnchor.constraint(equalToConstant: 500).isActive = true
        logoAnimation.play()
         logoAnimation.play { (finished) in
            self.performSegue(withIdentifier: "TestSegway", sender: nil)
          }
    }
//
//    func startAnimation() {
//        animationView.animation = Animation.named("test2")
//
//
//
//        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


