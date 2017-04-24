//
//  ImageCellNode.swift
//  AsyncDisplayKit-Practice
//
//  Created by 島仁誠 on 2017/04/24.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ImageCellNode: ASCellNode {

    let imageNode = ASImageNode()

    required init(with image : UIImage) {

        super.init()

        imageNode.image = image
        addSubnode(imageNode)
    }

    override func didLoad() {
        super.didLoad()

        imageNode.layer.cornerRadius = 8
//        imageNode.layer.masksToBounds = true
        imageNode.clipsToBounds = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        let imageSize = imageNode.image?.size

        print("imageNode= \(imageNode.bounds), image=\(String(describing: imageSize))")

        var imageRatio: CGFloat = 0.5
        if imageNode.image != nil {
            imageRatio = (imageNode.image?.size.height)! / (imageNode.image?.size.width)!
        }

        let imagePlace = ASRatioLayoutSpec(ratio: imageRatio, child: imageNode)

        let stackLayout = ASStackLayoutSpec.horizontal()
        stackLayout.justifyContent = .start
        stackLayout.alignItems = .start
        stackLayout.style.flexShrink = 1.0
        stackLayout.children = [imagePlace]

        return  ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: stackLayout)
    }
    
}
