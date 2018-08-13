#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface SettingsDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *presets;
@property (nonatomic) NSMutableArray *favoriteMarkets;

@end
