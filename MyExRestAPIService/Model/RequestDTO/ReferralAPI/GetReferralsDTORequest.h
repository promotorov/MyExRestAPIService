#import <Foundation/Foundation.h>

@interface GetReferralsDTORequest : NSObject

@property(nonatomic) NSString* search;
@property(nonatomic) int page;
@property(nonatomic) int perPage;

@end
