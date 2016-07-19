//
//  ChandanParser.m
//  FlickerPhotoList
//
//  Created by chandan gupta on 19/07/16.
//  Copyright © 2016 intellinet. All rights reserved.
//

#import "ChandanParser.h"

@implementation ChandanParser

-(void)connectionRequestForJsonWithURL:(NSString *)urlString withJsonDictionary:(NSDictionary *)jsonDict withSuccessCompletionHandler:(SuccessDataFromServer)completionBlock withFailedCompletionHandler:(FailedDataFromServer)failCompletionBlock {
    NSError *jsonError;
    _SuccessDataFromServer = completionBlock;
    _FailedDataFromServer = failCompletionBlock;
    NSData *requestData = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSUTF8StringEncoding error:&jsonError];
    
    //    NSLog(@"jsonRequest is %@", requestData);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]];
    apiMethod = urlString;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    
    
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    request.timeoutInterval = 60.0f;
    
    if ([NSURLConnection canHandleRequest:request]) {
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        [connection start];
    }
    else{
        NSLog(@"Request Not Possible");
    }
    
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    
    if (_SuccessDataFromServer != nil) {
        _SuccessDataFromServer(_responseData, apiMethod);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    if (_FailedDataFromServer != nil) {
        _FailedDataFromServer(error,apiMethod);
    }
}

@end
