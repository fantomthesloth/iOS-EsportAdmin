//
//  AddArticleViewController.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 27..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit

class AddArticleViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var postArticleButton: UIButton!
    
    var parentVC: NewsViewController?
    var myUser: MyUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        contentTextView.layer.cornerRadius = 5.0
        contentTextView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        contentTextView.layer.borderWidth = 0.5
        contentTextView.clipsToBounds = true
        
        postArticleButton.layer.cornerRadius = 5.0
    }
    
    func formatDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter.string(from: date)
    }
    
    
    @IBAction func postArticle(_ sender: Any) {
        let authorId = myUser?.id ?? ""
        let authorName = "\(myUser?.firstName ?? "") \(myUser?.lastName ?? "")"
        let authorProfilePicUrl = myUser?.profilePic ?? ""
        let title = titleTextField.text
        let content = contentTextView.text
        let dateCreated = formatDate()
        
        RestClient.postArticle(authorId: authorId, authorName: authorName, authorPicUrl: authorProfilePicUrl, title: title!, content: content!, created: dateCreated, delegate: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}
extension AddArticleViewController: PostArticleDelegate {
    func postArticleDidSucces(response: News) {
        parentVC?.getNews()
        self.showAlert(title: "Siker", message: "A hír feltöltése sikeresen megtörtént", actionTitle: "Ok", actionStyle: .default)
    }
    
    func postArticleDidFail(error: Error?) {
        self.showAlert(title: "Hiba", message: "Valami hiba történt a hír feltöltése közben, kérlek próbáld újra később", actionTitle: "Ok", actionStyle: .default)
    }
    

}
