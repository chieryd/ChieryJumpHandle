//
//  ChieryJumpHandlePrt.h
//  ChieryJumpHandle
//
//  Created by chiery on 2018/1/8.
//  Copyright © 2018年 com.chiery.com. All rights reserved.
//

#import "ChieryJumpHandleResponsePrt.h"

/**
 *  JumpHandlePrt跳转协议
 *
 *  每个业务模块实现的URL跳转逻辑处理类需要实现的协议，只有实现了该协议才会被调用
 */
@protocol ChieryJumpHandlePrt <NSObject>

@required

+ (BOOL)jumpHandleOpenURL:(NSURL *)url
              withUrlData:(NSDictionary *)urlData
             responseDelg:(id<ChieryJumpHandleResponsePrt>)responseDelg
                 userInfo:(id)userInfo;

@end
