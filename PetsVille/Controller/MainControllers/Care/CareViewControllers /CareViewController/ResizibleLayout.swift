//import UIKit
//
//struct ContextCellConstants {
//    static let featuredHeight: CGFloat = 280
//    static let standartHeight: CGFloat = 100
//}
//
//final class ResizibleLayout: UICollectionViewLayout {
//    let dragOffset: CGFloat = ContextCellConstants.featuredHeight - ContextCellConstants.standartHeight
//    
//    var cacheAttributes = [UICollectionViewLayoutAttributes]()
//    
//    var featuredItemIndex: Int {
//        max(0, Int(collectionView!.contentOffset.y / dragOffset))
//    }
//    
//    var percentageOffset: CGFloat {
//        collectionView!.contentOffset.y / dragOffset - CGFloat(featuredItemIndex)
//    }
//    
//    var width: CGFloat {
//        collectionView!.bounds.width
//    }
//    var height: CGFloat {
//        collectionView!.bounds.height
//    }
//    var numberOfItems: Int {
//        collectionView!.numberOfItems(inSection: 0)
//    }
//}
//
//extension ResizibleLayout {
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        true
//    }
//    
//    override var collectionViewContentSize: CGSize {
//        CGSize(
//            width: width,
//            height: CGFloat(numberOfItems) + dragOffset + height - dragOffset
//        )
//    }
//    
//    override func prepare() {
//        cacheAttributes.removeAll()
//        
//        var frame: CGRect = .zero
//        var y: CGFloat = 0
//        
//        for index in 0..<numberOfItems {
//            let path = IndexPath(item: index, section: 0)
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: path)
//            
//            var height = ContextCellConstants.standartHeight
//            
//            if path.item == featuredItemIndex {
//                y = collectionView!.contentOffset.y - ContextCellConstants.standartHeight * percentageOffset
//                height = ContextCellConstants.featuredHeight
//            } else if path.item == (featuredItemIndex + 1) {
//                height = ContextCellConstants.standartHeight + max(0, dragOffset * percentageOffset)
//                
//                let maxY = y + ContextCellConstants.standartHeight
//                y = maxY - height
//            }
//            
//            frame = CGRect(x: 0, y: y, width: width, height: height)
//            
//            attributes.frame = frame
//            
//            attributes.zIndex = index
//            cacheAttributes.append(attributes)
//            y = frame.maxY
//        }
//    }
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        var resultAttributes = [UICollectionViewLayoutAttributes]()
//        
//        for attributes in cacheAttributes {
//            if attributes.frame.intersects(rect) {
//                resultAttributes.append(attributes)
//            }
//        }
//        return resultAttributes
//    }
//    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
//        let index = round(proposedContentOffset.y / dragOffset)
//        let y = index * dragOffset
//        
//        return CGPoint(x: 0, y: y)
//    }
//}
