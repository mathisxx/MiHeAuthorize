//
//  AuthorizeManager.m
//  authorize
//
//

#import <Foundation/Foundation.h>
#import "AuthorizeManager.h"
#import "MiheUserModel.h"
#import "WebViewJavascriptBridge.h"


@implementation AuthorizeManger

WebViewJavascriptBridge* bridge;
id passedData;



+(void) init:(id)webView {
    bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
}


//get user model with data passed from  then set the handler
+(void) setUpBridgeFromData:(id)userHandler{
    [bridge registerHandler:@"getUserIdwithParams" handler:userHandler];
}


+(id) getAuthorizeDataFromH5{
    __weak typeof(self) weakSelf = self;
    [bridge registerHandler:@"setParams" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC Echo called with: %@", data);
        passedData = data;
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"status"] = @"200";//接受成功
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            NSString *str = [strongSelf convertToJsonData:dict];
            responseCallback(str);
        }
        
    }];
    return passedData;
}



+(void) setUpBridge:(MiheUserModel*)shareUserModel{
    __weak typeof(self) weakSelf = self;
    [bridge registerHandler:@"getUserId" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC Echo called with: %@", data);
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"uid"] = shareUserModel.uid;//用户id 必填
        dict[@"cert"] = shareUserModel.cert;//用户登录凭证
        dict[@"mobile"] = shareUserModel.mobile;//手机号
        dict[@"name"] = shareUserModel.name;//用户姓名
        dict[@"nickName"] = shareUserModel.nickName;//用户昵称
        dict[@"img"] = shareUserModel.img;//用户头
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            NSString *str = [strongSelf convertToJsonData:dict];
            responseCallback(str);
        
        }
    }];
}


+(NSString *)convertToJsonData:(NSMutableDictionary *)dict{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

@end
