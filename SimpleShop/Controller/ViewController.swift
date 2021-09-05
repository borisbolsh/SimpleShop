//
//  ViewController.swift
//  SimpleShop
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemsMenuArr: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Cap"
        blankMenu.imageName = "cap"
        
        var blankMenu2 = Menu()
        blankMenu2.name = "Cap2"
        blankMenu2.imageName = "cap2"
        
        return [blankMenu, blankMenu2]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                vc.menu = menu
            }
        }
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsMenuArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.menu = itemsMenuArr[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemsMenuArr[indexPath.row]
        
        self.performSegue(withIdentifier: "showDetailVC", sender: menu)
        
    }
    
    
}
