//
//  DrawController.swift
//  Random
//
//  Created by Nicolas BOSTE on 4/17/17.
//  Copyright © 2017 Nicolas BOSTE. All rights reserved.
//

import UIKit

class DrawController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if min != nil && max != nil && draws != nil {
            dispResult()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var min :Int?
    var max :Int?
    var draws :Int?
    var result = [UInt32]()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func dispResult()
    {
        let size :UInt32 = UInt32(max!) - UInt32(min!)
        var rand :UInt32
        //var tmp :UInt32 = 0
        
        for _ in 0..<draws! {
            rand = arc4random_uniform(size)
            /*for cell in result! {
                if cell == rand {
                    tmp = 1
                }
            }*/
            result.append(rand)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "\(result[indexPath.row])"
        }
        return cell
    }
}
