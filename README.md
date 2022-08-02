# MiHeAuthorize



Add this to your podfile and run pod install to install:

```objective-c
pod 'MiheAuth'
```

**Manual installation**

Drag the folder into your project.

In the dialog that appears, uncheck "Copy items into destination group's folder" and select "Create groups for any folders".

**Usage**

Import the header file and declare an ivar property:

```objective-c
#import "AuthorizeManager.h"
#import "WebViewJavascriptBridge.h"
#import "MiheUserModel.h"
```


Instantiate MiHeAuth with a WKWebView:

```objective-c
[AuthorizeManger init:self.webView];
```

Get  datas to verify html webpage :

```objective-c
NSString* s = [AuthorizeManger getAuthorizeDataFromH5];//获取校验数据，可选
```

Passed  User  Info  to html webpage  :

```objective-c
  [AuthorizeManger setUpBridgeFromData: ^(id data, WVJBResponseCallback responseCallback) {
 	NSLog(@"ObjC ------ called with: %@", data);
    //get the specified user with data passed from h5 page
 	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  dict[@"uid"] = @"666uiud";//用户id 必填
  dict[@"cert"] = @"888";//用户登录凭证
  dict[@"mobile"] = @"111";//手机号
  dict[@"name"] = @"222";//用户姓名
  dict[@"nickName"] = @"999nick";//用户昵称
  dict[@"img"] = @"000img";//用户头
    NSString *str = [ ViewController convertToJsonData:dict];
    [NSThread sleepForTimeInterval:10];
    responseCallback(str);
}];


```





