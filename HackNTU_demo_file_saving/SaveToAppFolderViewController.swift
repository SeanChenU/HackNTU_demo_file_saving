//
//  SaveToAppFolderViewController.swift
//  HackNTU_demo_file_saving
//
//  Created by SEAN HD on 2016/11/16.
//  Copyright © 2016年 Appar. All rights reserved.
//

import UIKit

class SaveToAppFolderViewController: UIViewController {
    
    var imageLink = "https://i.guim.co.uk/img/media/03b0688ca9bb24a68be7d1c89a9ca180fb1cc66a/44_0_847_508/master/847.jpg?w=620&q=55&auto=format&usm=12&fit=max&s=8f739afb392f30742ba0cd2f982838cf"
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = "Try to save image to app folder from: \(self.imageLink)"
        
        imageView.image = getImageFromURL(path: imageLink)
        
        button.addTarget(self, action: #selector(SaveToAppFolderViewController.saveToFolder), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveToFolder() {
        self.saveImageToFolder(image: getImageFromURL(path: imageLink))
    }
    
    // Get Image From URL
    func getImageFromURL(path: String) -> UIImage? {
        var result: UIImage?
        do {
            let data = try Data(contentsOf: URL(string: path)!)
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
    
    func saveImageToFolder(image: UIImage?) {
        guard image != nil else {
            return
        }
    
        // create a name for your image
        let fileURL = getDocumentDirectoryURL().appendingPathComponent("image.jpg")
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try UIImageJPEGRepresentation(image!, 1.0)?.write(to: fileURL)
            } catch {
                print("Error saving file")
            }
        } else {
            print("file already exists")
        }
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
