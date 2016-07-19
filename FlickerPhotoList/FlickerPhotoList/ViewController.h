//
//  ViewController.h
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChandanParser.h"
#import "DataModels.h"
#import "PhotoAlbumCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property(strong,nonatomic) getFlicker *objFlickers;
@property(strong, nonatomic) NSMutableDictionary *dictCache;

@end

