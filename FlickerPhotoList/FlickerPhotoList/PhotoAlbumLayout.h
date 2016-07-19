//
//  PhotoAlbumLayout.h
//  FlickerGallery
//
//  Created by chandan gupta on 18/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString * const PhotoAlbumLayoutAlbumTitleKind;

@interface PhotoAlbumLayout : UICollectionViewLayout

@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;
@property (nonatomic) CGFloat titleHeight;

@end
