#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface ReferralDetailsDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *user_name;
@property (nonatomic) NSString *affiliate_id;

@end
