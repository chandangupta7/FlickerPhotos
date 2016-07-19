//
//  getFlicker.m
//
//  Created by   on 19/07/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "getFlicker.h"
#import "Photos.h"


NSString *const kgetFlickerStat = @"stat";
NSString *const kgetFlickerPhotos = @"photos";


@interface getFlicker ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation getFlicker

@synthesize stat = _stat;
@synthesize photos = _photos;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.stat = [self objectOrNilForKey:kgetFlickerStat fromDictionary:dict];
            self.photos = [Photos modelObjectWithDictionary:[dict objectForKey:kgetFlickerPhotos]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kgetFlickerStat];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kgetFlickerPhotos];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.stat = [aDecoder decodeObjectForKey:kgetFlickerStat];
    self.photos = [aDecoder decodeObjectForKey:kgetFlickerPhotos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kgetFlickerStat];
    [aCoder encodeObject:_photos forKey:kgetFlickerPhotos];
}

- (id)copyWithZone:(NSZone *)zone
{
    getFlicker *copy = [[getFlicker alloc] init];
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.photos = [self.photos copyWithZone:zone];
    }
    
    return copy;
}


@end
