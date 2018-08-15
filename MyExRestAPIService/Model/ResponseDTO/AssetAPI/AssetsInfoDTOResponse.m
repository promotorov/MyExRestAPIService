#import "AssetsInfoDTOResponse.h"

@implementation AssetInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.amount_scale = (NSString*) dictionary[@"amount_scale"];
        self.price_scale = (NSString*) dictionary[@"price_scale"];
        self.withdrawal_fee = (NSString*) dictionary[@"withdrawal_fee"];
        self.asset_name = (NSString*) dictionary[@"asset_name"];
        self.image_url = (NSString*) dictionary[@"image_url"];
        self.can_withdraw = (NSString*) dictionary[@"can_withdraw"];
        self.can_deposit = (NSString*) dictionary[@"can_deposit"];
        self.assetId = (NSString*) dictionary[@"id"];
    }
    return self;
}

@end

@implementation AssetsInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        NSDictionary *assets = dictionary[@"data"];
        self.assets = [[NSMutableArray alloc] initWithCapacity:[assets count]];
        for (NSDictionary *asset in assets)
            [self.assets addObject:[[AssetInfoDTOResponse alloc] initFromDictionary:asset]];
    }
    return self;
}

@end

