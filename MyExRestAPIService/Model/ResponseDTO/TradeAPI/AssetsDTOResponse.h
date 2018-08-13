#import <Foundation/Foundation.h>
#import "AssetDTOResponse.h"
#import "DTOResponse.h"

@interface AssetsDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray *assets;

@end
