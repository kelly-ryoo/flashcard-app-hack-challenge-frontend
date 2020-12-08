//
//  SetViewController.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import UIKit

class SetViewController: UIViewController {
    
    private var fset: FlashcardSet!

    init(fs: FlashcardSet) {
        super.init(nibName: nil, bundle: nil)
        self.fset = fs
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
