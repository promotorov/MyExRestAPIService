#import "AllCountriesDTOResponse.h"

@implementation AllCountriesDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.paging = [[Paging alloc] initFromDictionary:dictionary[@"paging"]];
        NSArray *countries = dictionary[@"data"];
        NSLog(@"%@", countries);
        self.countries = [[NSMutableArray<Country*> alloc] initWithCapacity:[countries count]];
        self.filters = [[Filters alloc] initFromDictionary:dictionary[@"filters"]];
        for (NSDictionary *subdict in countries)
            [self.countries addObject:[[Country alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
