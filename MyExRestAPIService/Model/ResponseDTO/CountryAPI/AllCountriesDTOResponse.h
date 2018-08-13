#import <Foundation/Foundation.h>
#import "Country.h"
#import "Paging.h"
#import "Filters.h"
#import "DTOResponse.h"

@interface AllCountriesDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray *countries;
@property (nonatomic) Paging *paging;
@property (nonatomic) Filters *filters;

@end
