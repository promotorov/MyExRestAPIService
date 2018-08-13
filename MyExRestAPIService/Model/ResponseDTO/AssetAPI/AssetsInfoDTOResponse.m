#import "AssetsInfoDTOResponse.h"

@implementation AssetInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.amount_scale = (NSString*) [dictionary objectForKey:@"amount_scale"];
        self.price_scale = (NSString*) [dictionary objectForKey:@"price_scale"];
        self.withdrawal_fee = (NSString*) [dictionary objectForKey:@"withdrawal_fee"];
        self.asset_name = (NSString*) [dictionary objectForKey:@"asset_name"];
        self.image_url = (NSString*) [dictionary objectForKey:@"image_url"];
        self.can_withdraw = (NSString*) [dictionary objectForKey:@"can_withdraw"];
        self.can_deposit = (NSString*) [dictionary objectForKey:@"can_deposit"];
        self.assetId = (NSString*) [dictionary objectForKey:@"id"];
    }
    return self;
}

@end

@implementation AssetsInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        NSDictionary *assets = [dictionary objectForKey:@"data"];
        self.assets = [[NSMutableArray alloc] initWithCapacity:[assets count]];
        for (NSDictionary *asset in assets)
            [self.assets addObject:[[AssetInfoDTOResponse alloc] initFromDictionary:asset]];
    }
    return self;
}

@end

