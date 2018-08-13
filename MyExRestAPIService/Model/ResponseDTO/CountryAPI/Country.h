#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface Country : NSObject<DTOResponse>

@property (nonatomic) NSString *countryId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *kyc;
@property (nonatomic) NSString *code;

@end
