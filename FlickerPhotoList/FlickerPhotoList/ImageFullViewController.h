//
//  ImageFullViewController.h
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface ImageFullViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgViewPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lblPhotoTitle;
@property (strong,nonatomic) IBOutlet Photo *photo;
@end
