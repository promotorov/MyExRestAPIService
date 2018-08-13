#import <Foundation/Foundation.h>
#import "Country.h"
#import "DTOResponse.h"

@interface GetCountryDTOResponse : NSObject<DTOResponse>

@property (nonatomic) Country *country;

@end
