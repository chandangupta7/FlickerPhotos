//
//  ImageFullViewController.m
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import "ImageFullViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ImageFullViewController ()

@end

@implementation ImageFullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.imgViewPhoto sd_setImageWithURL:[NSURL URLWithString:self.photo.urlO]
                           placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.lblPhotoTitle.text = self.photo.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
