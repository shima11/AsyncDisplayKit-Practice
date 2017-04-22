//
//  ASDKViewController.swift
//  AsyncDisplayKit-Practice
//
//  Created by 島仁誠 on 2017/03/15.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ASDKViewController: UIViewController {

    private let tableNode = ASTableNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubnode(tableNode)
        
        tableNode.frame = view.bounds
        tableNode.backgroundColor = UIColor.blue
    }

}
