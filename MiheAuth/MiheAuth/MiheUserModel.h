//
//  MiheUserModel.h
//  authorize
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MiheUserModel : NSObject


@property(nonatomic,strong)NSString * uid;//用户id 必填
@property(nonatomic,strong)NSString * cert;//用户登录凭证
@property(nonatomic,strong)NSString * mobile;//手机号
@property(nonatomic,strong)NSString * name;//用户姓名
@property(nonatomic,strong)NSString * nickName;//用户昵称
@property(nonatomic,strong)NSString * img;//用户头像

@end

NS_ASSUME_NONNULL_END
