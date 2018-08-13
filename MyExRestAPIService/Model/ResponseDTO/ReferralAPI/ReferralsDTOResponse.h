#import <Foundation/Foundation.h>
#import "Paging.h"
#import "Filters.h"
#import "DTOResponse.h"

@interface Referral : NSObject<DTOResponse>

@property (nonatomic) NSString *user_name;
@property (nonatomic) NSString *affiliate_id;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *user_id;
@property (nonatomic) NSString *registration_date;

@end

@interface ReferralsDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray *referrals;
@property (nonatomic) Paging *paging;
@property (nonatomic) Filters *filters;

@end
