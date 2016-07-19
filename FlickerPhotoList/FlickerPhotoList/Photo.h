//
//  Photo.h
//
//  Created by   on 19/07/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Photo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *photoIdentifier;
@property (nonatomic, assign) double isfamily;
@property (nonatomic, assign) double ispublic;
@property (nonatomic, assign) double farm;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *urlO;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isfriend;
@property (nonatomic, strong) NSString *heightO;
@property (nonatomic, strong) NSString *widthO;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
