#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface AssetInfoDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *assetId;
@property (nonatomic) NSString *can_deposit;
@property (nonatomic) NSString *can_withdraw;
@property (nonatomic) NSString *image_url;
@property (nonatomic) NSString *asset_name;
@property (nonatomic) NSString *withdrawal_fee;
@property (nonatomic) NSString *price_scale;
@property (nonatomic) NSString *amount_scale;

@end

@interface AssetsInfoDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<AssetInfoDTOResponse*> *assets;

@end
