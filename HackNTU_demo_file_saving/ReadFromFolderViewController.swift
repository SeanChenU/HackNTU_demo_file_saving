//
//  ReadFromFolderViewController.swift
//  HackNTU_demo_file_saving
//
//  Created by SEAN HD on 2016/11/16.
//  Copyright © 2016年 Appar. All rights reserved.
//

import UIKit

class ReadFromFolderViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(ReadFromFolderViewController.readImageFromAppFolder), for: .touchUpInside)
    }
    
    func readImageFromAppFolder() {
        imageView.image = getImageFromURL(fileURL: getDocumentDirectoryURL().appendingPathComponent("image.jpg"))
        
        textView.text = "File read from app folder!"
    }

    func getImageFromURL(fileURL: URL) -> UIImage? {
        var result: UIImage?
        do {
            let data = try Data(contentsOf: fileURL)
            result = UIImage(data: data)
            return result
        } catch _ {
            print("data from image error")
        }
        return result
    }
    
    func getDocumentDirectoryURL() -> URL {
        let documentsDirectoryURL: URL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentsDirectoryURL
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
