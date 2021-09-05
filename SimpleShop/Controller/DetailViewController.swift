//
//  DetailViewController.swift
//  SimpleShop
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.imageName else { return }
            imageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = menu?.name
        }
    }
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


}
