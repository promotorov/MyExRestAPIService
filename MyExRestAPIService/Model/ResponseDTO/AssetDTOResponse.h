#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface AssetDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *asset;
@property (nonatomic) NSString *balance;

@end
