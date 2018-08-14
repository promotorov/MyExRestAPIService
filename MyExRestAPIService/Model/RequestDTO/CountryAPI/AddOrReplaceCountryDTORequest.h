#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface AddOrReplaceCountryDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *countryId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *kyc;
@property (nonatomic) NSString *code;

@end

