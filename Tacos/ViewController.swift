//
//  ViewController.swift
//  Tacos
//
//  Created by shashank kannam on 12/24/16.
//  Copyright © 2016 shashank kannam. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView:UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataInstance: TacoData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataInstance = TacoData()
        dataInstance.loadDeliciousTacoData()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "TacoCell", bundle: nil), forCellWithReuseIdentifier: "TacoCell")
       
        
        
        
        headerView.shadow()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("here........")
        print(dataInstance.tacoArray.count)
        return dataInstance.tacoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell{
            cell.configurCell(taco: dataInstance.tacoArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell{
            cell.shakeable()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 125)
    }
  
    
}


extension UIView{
    func shadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
    }
}


extension UICollectionViewCell{
    func shakeable(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x-5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x+5, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
    
}
