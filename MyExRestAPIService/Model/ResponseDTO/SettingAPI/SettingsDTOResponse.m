#import "SettingsDTOResponse.h"

@implementation SettingsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.presets = dictionary[@"presets"];
        self.favoriteMarkets = [[NSMutableArray<NSString*> alloc] initWithArray:dictionary[@"favoriteMarkets"]];
    }
    return self;
}

@end
