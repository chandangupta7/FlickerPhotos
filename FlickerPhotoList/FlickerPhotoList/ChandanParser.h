//
//  ChandanParser.h
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessDataFromServer)(NSData *objectNotation, NSString *urlString);
typedef void (^FailedDataFromServer)(NSError *error, NSString *urlString);

@interface ChandanParser : NSObject
{
    NSMutableData *_responseData;
    NSString *apiMethod;
    id objAnyObject;
}

@property (nonatomic, copy) void (^SuccessDataFromServer)(NSData *successData, NSString *urlString);
@property (nonatomic, copy) void (^FailedDataFromServer)(NSError *FailedData, NSString *urlString);


-(void)createConnectionRequestForJsonWithURL:(NSString *)urlString WithJsonDictionary:(NSDictionary *)jsonDict anyObject:(id)anyObject;

-(void)connectionRequestForJsonWithURL:(NSString *)urlString withJsonDictionary:(NSDictionary *)jsonDict withSuccessCompletionHandler:(SuccessDataFromServer)completionBlock withFailedCompletionHandler:(FailedDataFromServer)failCompletionBlock;

@end
