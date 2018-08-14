#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface CountryDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *countryId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *kyc;
@property (nonatomic) NSString *code;

@end
