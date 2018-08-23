#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface LoginDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *secondFactorRequired;
@property (nonatomic) NSString *provider;
@property (nonatomic) NSString *verificationLevel;
//@property (nonatomic) Account *account;

@end

