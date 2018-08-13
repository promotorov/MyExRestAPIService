#import <Foundation/Foundation.h>
#import "Paging.h"
#import "Filters.h"
#import "DTOResponse.h"

@interface Account : NSObject<DTOResponse>

@property (nonatomic) NSString *nickname;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *userId;
@property (nonatomic) NSString *affiliateId;

@end

@interface LoginDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *secondFactorRequired;
@property (nonatomic) NSString *provider;
@property (nonatomic) Account *account;

@end

