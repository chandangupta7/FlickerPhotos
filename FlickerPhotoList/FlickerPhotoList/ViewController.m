//
//  ViewController.m
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import "ViewController.h"
#import "ImageFullViewController.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dictCache=[[NSMutableDictionary alloc]init];
    
    
    ChandanParser *parser = [[ChandanParser alloc]init];
    // parser.delegate = self;
    
    NSDictionary *inputData = [[NSDictionary alloc] init];
    
    NSString *strUrl = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=74b811596c3440d72c226eb4292674be&format=json&nojsoncallback=1&text=cats&extras=url_o";
    
    [parser connectionRequestForJsonWithURL:strUrl withJsonDictionary:inputData withSuccessCompletionHandler:^(NSData *objectNotation, NSString *urlString) {
        NSError* error;
        NSLog(@"Pass gate 2");
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:objectNotation
                                                             options:NSUTF8StringEncoding
                                                               error:&error];
        
        
        if (error) {
            NSLog(@"ERROR= %@",error);
            NSLog(@"ERROR= %@",error.localizedDescription);
        }
        else{
            
            self.objFlickers = [getFlicker modelObjectWithDictionary:json];
            
            self.photoCollectionView.dataSource=self;
            self.photoCollectionView.delegate=self;
        }
        
    } withFailedCompletionHandler:^(NSError *error, NSString *urlString) {
        if (error) {
            NSLog(@"ERROR= %@",error);
            NSLog(@"ERROR= %@",error.localizedDescription);
        }
    }];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return _objFlickers.photos.photo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoAlbumCell *photoCell =
    [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellIdentifier
                                              forIndexPath:indexPath];
    
    Photo *photo = [_objFlickers.photos.photo objectAtIndex:indexPath.row];
    
    //NSString *photoFilename = [NSString stringWithFormat:@"thumbnail.jpg",photoIndex % 25];
    
    [photoCell.imageView sd_setImageWithURL:[NSURL URLWithString:photo.urlO]
                           placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    photoCell.lblTitle.text = photo.title;

    
    return photoCell;
}

#pragma mark UICollectionViewFlowLayoutDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    Photo *photo = [_objFlickers.photos.photo objectAtIndex:indexPath.row];
//    Photo *photoNext;
//    float width, height;
//    
//    if (indexPath.row+1 < _objFlickers.photos.photo.count) {
//       photoNext  = [_objFlickers.photos.photo objectAtIndex:indexPath.row+1];
//        
//        width = [photo.widthO floatValue];
//        height = [photo.heightO floatValue];
//        
//        while (width>self.photoCollectionView.bounds.size.width/2) {
//            width = width/2;
//            height = height/2;
//        }
//    } else {
//        width = [photo.widthO floatValue];
//        height = [photo.heightO floatValue];
//        
//        while (width>self.photoCollectionView.bounds.size.width/2) {
//            width = width/2;
//            height = height/2;
//        }
//    }
//   
//    
//    
//    return CGSizeMake(width, height+25);
    return CGSizeMake(self.photoCollectionView.bounds.size.width/2, (self.photoCollectionView.bounds.size.width/2)+25);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    Photo *photo = [_objFlickers.photos.photo objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"SegueFullImage" sender:indexPath];
//    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
//    datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if ([segue.identifier isEqualToString:@"SegueFullImage"]) {
         
         NSIndexPath *indexPath = (NSIndexPath*)sender;
         Photo *photo = [_objFlickers.photos.photo objectAtIndex:indexPath.row];
         ImageFullViewController *fullView = [segue destinationViewController];
         fullView.photo=photo;
     }
 }
 

@end
