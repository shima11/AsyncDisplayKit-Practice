//
//  ViewController.swift
//  AsyncDisplayKit-Practice
//
//  Created by 島仁誠 on 2017/03/10.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class ViewController: ASViewController<ASDisplayNode> {

    var collectionNode: ASTableNode
    
    init() {
        collectionNode = ASTableNode()
        super.init(node: collectionNode)
        collectionNode.dataSource = self
        collectionNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

}

extension ViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let node = ASTextCellNode()
        node.style.height = ASDimensionMake(44.0)
        node.text = "cell title"
        return node
    }
}

extension ViewController: ASTableDelegate {
    
}

extension ViewController: ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
        let node = ASTextCellNode()
        node.style.height = ASDimensionMake(44.0)
        node.text = "cell title"
        return node
    }
    
}

extension ViewController: ASCollectionDelegate {
    
}

