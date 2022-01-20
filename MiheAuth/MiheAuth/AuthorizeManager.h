//
//  AuthorizeManager.h
//  authorize
//
//
#import "MiheUserModel.h"

#ifndef AuthorizeManager_h
#define AuthorizeManager_h


@interface AuthorizeManger : NSObject

+(void) init:(id)webView;

+(void) setUpBridge:(MiheUserModel*)shareUserModel;

+(id) getAuthorizeDataFromH5;

+(void) setUpBridgeFromData:(id)getUserIdHandler;



@end

#endif /* AuthorizeManager_h */
