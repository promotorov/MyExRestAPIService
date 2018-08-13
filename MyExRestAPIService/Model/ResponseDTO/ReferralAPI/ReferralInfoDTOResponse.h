#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface ReferralInfoDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *affiliates_count;
@property (nonatomic) NSString *user_name;
@property (nonatomic) NSString *affiliate_id;

@end

