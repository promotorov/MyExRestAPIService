#import "KeyDTOResponse.h"

@implementation KeyDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = (NSString*) dictionary[@"name"];
        self.isWithdraw = (NSString*) dictionary[@"isWithdraw"];
        self.isTrade = (NSString*) dictionary[@"isTrade"];
        self.isInfo = (NSString*) dictionary[@"isInfo"];
        self.publicKey = (NSString*) dictionary[@"publicKey"];
        self.privateKey = (NSString*) dictionary[@"privateKey"];
        self.ipWhiteList = [[NSMutableArray<NSString*> alloc] initWithArray:dictionary[@"ipWhiteList"]];
    }
    return self;
}

@end
