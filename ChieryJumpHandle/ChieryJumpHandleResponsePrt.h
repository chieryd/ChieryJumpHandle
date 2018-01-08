//
//  ChieryJumpHandleResponsePrt.h
//  ChieryJumpHandle
//
//  Created by chiery on 2018/1/8.
//  Copyright © 2018年 com.chiery.com. All rights reserved.
//

/**
 *  JumpHandleResponsePrt 跳转回调协议
 *
 *  想接收URL跳转返回数据的对象需要实现的协议，只有实现了该协议才会被调用
 */
@protocol ChieryJumpHandleResponsePrt <NSObject>

@required

- (void)jumpHandleResponseData:(NSDictionary *)responseData
                   withOpenURL:(NSURL *)url
                       urlData:(NSDictionary *)urlData
                      userInfo:(id)userInfo;

@end
