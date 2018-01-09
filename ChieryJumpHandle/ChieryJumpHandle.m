//
//  ChieryJumpHandle.m
//  ChieryJumpHandle
//
//  Created by chiery on 2018/1/8.
//  Copyright © 2018年 com.chiery.com. All rights reserved.
//

#import "ChieryJumpHandle.h"
#import "ChieryJumpHandlePrt.h"

@implementation ChieryJumpHandle

+ (BOOL)jumpHandleOpenURL:(NSURL *)url {
    return [self jumpHandleOpenURL:url
                       withUrlData:nil
                      responseDelg:nil
                          userInfo:nil];
}

+ (BOOL)jumpHandleOpenURL:(NSURL *)url
              withUrlData:(NSDictionary *)urldata
             responseDelg:(id<ChieryJumpHandleResponsePrt>)responseDelg
                 userInfo:(id)userInfo {
    
    if (!url) {
        return NO;
    }
    
    if (!url.scheme || !url.host) {
        return NO;
    }
    
    NSString *urlScheme = url.scheme;
    NSString *urlHost = url.host;
    
    //读取plist
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"jumpMap" ofType:@"plist"];
    if (!plistPath) {
        return NO;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    if (!dict) {
        return NO;
    }
    
    if (!dict[urlScheme]) {
        return NO;
    }
    
    NSDictionary *schemeData = dict[urlScheme];
    if (!schemeData[urlHost]) {
        return NO;
    }
    
    NSString *responseClassString = schemeData[urlHost];
    if (!responseClassString) {
        return NO;
    }
    
    if ([NSClassFromString(responseClassString) respondsToSelector:@selector(jumpHandleOpenURL:withUrlData:responseDelg:userInfo:)]
        && [NSClassFromString(responseClassString) conformsToProtocol:@protocol(ChieryJumpHandlePrt)]) {
        return [NSClassFromString(responseClassString) jumpHandleOpenURL:url withUrlData:urldata responseDelg:responseDelg userInfo:userInfo];
    }
    
    return NO;
}

+ (void)jumpHandleResponse:(__weak id<ChieryJumpHandleResponsePrt>)responseDelg
              responseData:(NSDictionary *)responseData
               withOpenURL:(NSURL *)url
                   urlData:(NSDictionary *)urlData
                  userInfo:(id)userInfo {
    if ([responseDelg respondsToSelector:@selector(jumpHandleResponseData:withOpenURL:urlData:userInfo:)]
        && [responseDelg conformsToProtocol:@protocol(ChieryJumpHandleResponsePrt)]) {
        [responseDelg jumpHandleResponseData:responseData withOpenURL:url urlData:urlData userInfo:userInfo];
    }
}

@end
