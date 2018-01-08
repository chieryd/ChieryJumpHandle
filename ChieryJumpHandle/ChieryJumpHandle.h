//
//  ChieryJumpHandle.h
//  ChieryJumpHandle
//
//  Created by chiery on 2018/1/8.
//  Copyright © 2018年 com.chiery.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChieryJumpHandleResponsePrt.h"

@interface ChieryJumpHandle : NSObject

/**
 *  @name URL处理模块
 */

/**
 *  通过URL来调用界面
 *
 *  @param url 跳转到的URL，通常为 qunariphone://hotel/xxx 的形式
 *
 *  @return 返回是否有模块接受该URL并进行处理，处理URL可能是异步的，不能保证线程安全
 */
+ (BOOL)jumpHandleOpenURL:(NSURL *)url;

/**
 *  通过URL和urlData来调用界面
 *
 *  @param url          跳转到的URL，通常为 qunariphone://hotel/xxx 的形式
 *  @param urldata      处理URL所需使用的数据
 *  @param responseDelg 回调对象
 *  @param userInfo     自定义对象
 *
 *  @return 返回是否有模块接受该URL并进行处理，处理URL可能是异步的，不能保证线程安全
 */
+ (BOOL)jumpHandleOpenURL:(NSURL *)url
              withUrlData:(NSDictionary *)urldata
             responseDelg:(id<ChieryJumpHandleResponsePrt>)responseDelg
                 userInfo:(id)userInfo;

/**
 *  URL调用界面的数据回传方法
 *
 *  @param responseDelg 回调的代理对象
 *  @param responseData 回调数据
 *  @param url          所处理的URL
 *  @param urlData      调用URL时的数据
 *  @param userInfo     自定义对象
 */
+ (void)jumpHandleResponse:(__weak id<ChieryJumpHandleResponsePrt>)responseDelg
              responseData:(NSDictionary *)responseData
               withOpenURL:(NSURL *)url
                   urlData:(NSDictionary *)urlData
                  userInfo:(id)userInfo;

@end
