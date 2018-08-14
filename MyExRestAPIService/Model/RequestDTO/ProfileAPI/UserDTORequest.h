#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface UserDTORequest : NSObject<DTORequest>

@property(nonatomic) NSString *email;
@property(nonatomic) NSString *nickname;
@property(nonatomic) NSString *firstName;
@property(nonatomic) NSString *lastName;
@property(nonatomic) NSString *middleName;
@property(nonatomic) NSString *countryId;
@property(nonatomic) NSString *imageUrl;
@property(nonatomic) NSMutableArray *documentsUrls;

@end
