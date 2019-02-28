//
//  ViewController.swift
//  PlaceKittenApp
//
//  Created by MAC Consultant on 2/28/19.
//  Copyright © 2019 William Benfer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onButtonPush(_ sender: Any) {
        
        let width = Int(widthTextField.text ?? "20")
        let height = Int(heightTextField.text ?? "20")
        
        guard let w = width else{return}
        guard let h = height else{return}
        
        let addr = "https://placekitten.com/" + String(w) + "/" + String(h)
        
        guard let url = URL(string: addr) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            if let imageData = data{
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
            
        }.resume()
        
        
        
        
        
    }
}

