#import "AllCountriesDTORequest.h"

@implementation AllCountriesDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.search = @"";
        self.page = 1000000000;
        self.perPage = 100000000;
    }
    return self;
}

@end

