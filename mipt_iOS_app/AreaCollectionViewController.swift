//
//  AreaCollectionViewController.swift
//  mipt_iOS_app
//
//  Created by ms30 on 19.12.21.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.5
        )
    }
}



private let reuseIdentifier = "AreaCell"

class AreaCollectionViewController: UICollectionViewController {

    @IBAction func addAreaButtonTapped(_ sender: Any) {
        addArea()
    }
    @IBOutlet var areaCollectionView: UICollectionView!
    
    var areas = Array<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    
    func addArea() {
        let area = (areas.count)

        areas.append(area)
        areaCollectionView.reloadData()

    }
    


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if areas.count == 0 {
            return areas.count
        } else {
            return 1
        }
    }


    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let areasCount = areas.count
             return areasCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.random
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        return cell
    }
    func collectionView(collectionView:UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: 128, height: 128)
      return size

    }
    
}


	
