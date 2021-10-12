//
//  CameraViewController.swift
//  InstagramLab
//
//  Created by chetanya sharma on 10/8/21.
//

import UIKit
import AlamofireImage
import Parse
class CameraViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBOutlet weak var CommentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
   
    @IBAction func onSubmit(_ sender: Any) {
        
        let post = PFObject(className: "Posts")
        post["Caption"] = CommentField.text!
       
        post["author"] = PFUser.current()!
        
        let imageData = ImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        post.saveInBackground { success, error in
            if success{
                print("saved")
                self.dismiss(animated: true, completion: nil)

            }
            
            else{
                print("error")
            }
        }
    }
    
    
    
    
    /*@IBAction func onSubmitButton(_ sender: Any) {
        
        
        let post =  PFObject(className: "Posts")
        post["name"] = "spencer"
        post["weight"] = 50
        post["owner"] = PFUser.current()!
        post.saveInBackground { (success, error) in
            if success {
                
                print("saved")
                
            }
            else {
                print ("error!")
            }
        }
        
            
        }*/
        
        
        
    

    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            picker.sourceType = .camera
        }
        else {
            
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledimage = image.af_imageScaled(to: size)
        ImageView.image = scaledimage
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
