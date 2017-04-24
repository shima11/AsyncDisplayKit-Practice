//
//  CollectionViewLayoutInspector.swift
//  AsyncDisplayKit-Practice
//
//  Created by 島仁誠 on 2017/04/24.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit

class CollectionViewLayoutInspector: NSObject, ASCollectionViewLayoutInspecting {

    func collectionView(_ collectionView: ASCollectionView, constrainedSizeForNodeAt indexPath: IndexPath) -> ASSizeRange {
        let layout = collectionView.collectionViewLayout as! CollectionViewLayout
        return ASSizeRangeMake(CGSize.zero, layout._itemSizeAtIndexPath(indexPath: indexPath))
    }

    func collectionView(_ collectionView: ASCollectionView, constrainedSizeForSupplementaryNodeOfKind: String, at atIndexPath: IndexPath) -> ASSizeRange
    {
        let layout = collectionView.collectionViewLayout as! CollectionViewLayout
        return ASSizeRange.init(min: CGSize.zero, max: layout._headerSizeForSection(section: atIndexPath.section))
    }

    func collectionView(_ collectionView: ASCollectionView, numberOfSectionsForSupplementaryNodeOfKind kind: String) -> UInt {
        if (kind == UICollectionElementKindSectionHeader) {
            return UInt((collectionView.dataSource?.numberOfSections!(in: collectionView))!)
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: ASCollectionView, supplementaryNodesOfKind kind: String, inSection section: UInt) -> UInt {
        if (kind == UICollectionElementKindSectionHeader) {
            return 1
        } else {
            return 0
        }
    }

    func scrollableDirections() -> ASScrollDirection {
        return ASScrollDirectionVerticalDirections;
    }
}
