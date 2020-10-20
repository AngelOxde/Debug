import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var entirePictures = [String]()
    var currentPosition2: Int?
    var currentPosition: Int?

    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            print("Swipe Right")
        }
        else if gesture.direction == .left {
            print("Swipe Left")
        }
        else if gesture.direction == .up {
            changeImageForwards()
        }
        else if gesture.direction == .down {
            changeImageBackwards()
        }
    }

    @objc func changeImageForwards() {
        if currentPosition! < entirePictures.count - 1 {
            currentPosition = currentPosition! + 1
        }
        else {
            currentPosition = 0
        }
        if currentPosition! != 5 {
            let imageToLoad: String? = entirePictures[currentPosition!]
            title = (imageToLoad! as NSString).deletingPathExtension
            navigationItem.largeTitleDisplayMode = .never
            imageView.image = UIImage(named: "\(Bundle.main.resourcePath!)/Images" + "/" + imageToLoad!)
        }
        
        var segueIdentifier: String
        
        if currentPosition == 5 {
            segueIdentifier = "DetailToCarousel"
            performSegue(withIdentifier: segueIdentifier, sender: RootPageViewController.self)
//            self.navigationController?.popToRootViewController(animated: true)
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "New", style: .plain, target: nil, action: nil)
           }
        
    
    }
        
    @objc func changeImageBackwards() {
        if currentPosition! == 0 {
            currentPosition = entirePictures.count - 1
        }
        else if currentPosition! != 0 {
            currentPosition = currentPosition! - 1
        }
        
        if currentPosition! != 5 {
            let imageToLoad: String? = entirePictures[currentPosition!]
            title = (imageToLoad! as NSString).deletingPathExtension
            navigationItem.largeTitleDisplayMode = .never
            imageView.image = UIImage(named: "\(Bundle.main.resourcePath!)/Images" + "/" + imageToLoad!)
        }
        
        var segueIdentifier: String
        
        if currentPosition == 5 {
            segueIdentifier = "DetailToCarousel"
            performSegue(withIdentifier: segueIdentifier, sender: RootPageViewController.self)
            print("segue works")
//            navigationItem.backBarButtonItem = UIBarButtonItem(title: "New", style: .plain, target: nil, action: nil)
//            self.navigationController?.popToRootViewController(animated: true)
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if currentPosition! == 5 {
//
//            segueIdentifier = "DetailToCarousel"
//            self.performSegue(withIdentifier: segueIdentifier, sender: RootPageViewController.self)
//            print("segue works")
//        }
//

        // ABOVE IS THE CODE
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "janbg.jpg")
        backgroundImage.contentMode = UIImageView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        title = (entirePictures[currentPosition!] as NSString).deletingPathExtension
        navigationItem.largeTitleDisplayMode = .never
        
        let initializer: String? = entirePictures[currentPosition!]
        if let imageToLoad = initializer {
            imageView.image = UIImage(named: "\(Bundle.main.resourcePath!)/Images" + "/" + imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        let nav = navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.isNavigationBarHidden = false
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    

}
