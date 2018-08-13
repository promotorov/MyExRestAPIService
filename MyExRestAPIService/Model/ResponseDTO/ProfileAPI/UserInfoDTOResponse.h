#import <Foundation/Foundation.h>
#import "AssetDTOResponse.h"
#import "DTOResponse.h"

@interface UserInfoDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray *assets;
@property (nonatomic) NSString *avatar_url;
@property (nonatomic) NSString *userId;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *role;
@property (nonatomic) NSString *is_active;
@property (nonatomic) NSString *is_verified;
@property (nonatomic) NSString *nickname;
@property (nonatomic) NSString *first_name;
@property (nonatomic) NSString *last_name;
@property (nonatomic) NSString *middle_name;
@property (nonatomic) NSString *date_created;
@property (nonatomic) NSString *last_login;
@property (nonatomic) NSString *referral_id;
@property (nonatomic) NSString *affiliate_id;

@end
