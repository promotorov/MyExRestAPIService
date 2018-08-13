#import "SettingsDTOResponse.h"

@implementation SettingsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = [dictionary objectForKey:@"data"];
        self.presets = [dictionary objectForKey:@"presets"];
        NSDictionary *favoriteMarkets = [dictionary objectForKey:@"favoriteMarkets"];
        self.favoriteMarkets = [[NSMutableArray alloc] initWithArray:[favoriteMarkets allKeys]];
    }
    return self;
}

@end
