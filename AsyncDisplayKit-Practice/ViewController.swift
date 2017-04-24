//
//  ViewController.swift
//  AsyncDisplayKit-Practice
//
//  Created by 島仁誠 on 2017/04/23.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    let collectionNode: ASCollectionNode!

    let layoutInspector = CollectionViewLayoutInspector()

    let kNumberOfImages: UInt = 14

    required init?(coder aDecoder: NSCoder) {

        let layout = CollectionViewLayout()
        layout.numberOfColumns = 3;
        layout.headerHeight = 44;
        collectionNode = ASCollectionNode(frame: CGRect.zero, collectionViewLayout: layout)

        super.init(coder: aDecoder)

        layout.delegate = self

        collectionNode.dataSource = self
        collectionNode.delegate = self
        collectionNode.view.layoutInspector = layoutInspector
        collectionNode.backgroundColor = UIColor.white
        collectionNode.view.isScrollEnabled = true
        collectionNode.registerSupplementaryNode(ofKind: UICollectionElementKindSectionHeader)

    }

    override func viewDidLoad() {

        super.viewDidLoad()

        view.addSubnode(collectionNode)
    }

    deinit {
        collectionNode.dataSource = nil
        collectionNode.delegate = nil
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        collectionNode.frame = view.bounds
    }

}

extension ViewController: ASCollectionDataSource {

    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 3
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
        let cell = ASCellNode()
        cell.backgroundColor = UIColor.lightGray
        cell.bounds = CGRect(origin: .zero, size: CGSize(width: 80, height: 80))
        return cell
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> ASCellNode {
        let textAttributes : NSDictionary = [
            NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline),
            NSForegroundColorAttributeName: UIColor.gray
        ]
        let textInsets = UIEdgeInsets(top: 11, left: 0, bottom: 11, right: 0)
        let textCellNode = ASTextCellNode(attributes: textAttributes as! [AnyHashable : Any], insets: textInsets)
        textCellNode.text = String(format: "Section %zd", indexPath.section + 1)
        return textCellNode;
    }
}

extension ViewController: ASCollectionDelegate {

}

extension ViewController: CollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: CollectionViewLayout, originalItemSizeAtIndexPath: IndexPath) -> CGSize {
//        return _sections[originalItemSizeAtIndexPath.section][originalItemSizeAtIndexPath.item].size
        return CGSize(width: 120, height: 120)
    }
}

