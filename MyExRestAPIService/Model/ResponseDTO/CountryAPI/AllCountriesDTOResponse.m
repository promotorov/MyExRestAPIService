#import "AllCountriesDTOResponse.h"

@implementation AllCountriesDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.paging = [[Paging alloc] initFromDictionary:[dictionary objectForKey:@"paging"]];
        NSDictionary *countries = [dictionary objectForKey:@"data"];
        self.countries = [[NSMutableArray alloc] initWithCapacity:[countries count]];
        self.filters = [[Filters alloc] initFromDictionary:[dictionary objectForKey:@"filters"]];
        for (NSDictionary *subdict in countries)
            [self.countries addObject:[[Country alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
