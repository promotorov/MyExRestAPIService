#import "SettingsDTOResponse.h"

@implementation SettingsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = [dictionary objectForKey:@"data"];
        self.presets = [dictionary objectForKey:@"presets"];
        self.favoriteMarkets = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"favoriteMarkets"]];
    }
    return self;
}

@end
