import Lottie
import UIKit

public class ViewController: UITableViewController {
    var pictures = [String]()

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.clear

        let label = UILabel()
        label.text = "Animals"
        label.textAlignment = .center
        navigationItem.titleView = label
        label.backgroundColor = UIColor.clear

        label.textColor = UIColor.red
        label.font = UIFont(name: "ZillaSlab-Bold", size: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))

        self.tableView.backgroundView = UIImageView(image: UIImage(named: "luna2.jpeg"))

        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
        let path = "\(Bundle.main.resourcePath!)/Images"
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            self.pictures.append(item)
        }
        self.pictures.append("The carousel")
        print(self.pictures)
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = (self.pictures[indexPath.row] as NSString).deletingPathExtension
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        cell.textLabel?.font = UIFont(name: "ZillaSlab-Bold", size: 23)
        cell.textLabel?.textAlignment = .center // center aligns text

        cell.textLabel?.textColor = UIColor.black
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = backgroundView
        return cell
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = true
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("TABLEVIEW")
        let segueIdentifier: String
        if indexPath.row == 5 {
            segueIdentifier = "CarouselSeg"
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        }
//
//        if indexPath.row == 5 {
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "normalVCtoPageVC") as? RootPageViewController {
//
//                navigationController?.pushViewController(vc, animated: false)
//            }
//        }

        if indexPath.row != 5 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedImage = self.pictures[indexPath.row]
                vc.entirePictures = Array(self.pictures)
                vc.currentPosition = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
