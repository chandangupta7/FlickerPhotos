//
//  PhotoAlbumCell.h
//  FlickerGallery
//
//  Created by chandan gupta on 18/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoAlbumCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;

@end
