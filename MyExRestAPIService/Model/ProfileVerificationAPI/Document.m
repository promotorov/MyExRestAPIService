#import <ARKit/ARKit.h>
#import "Document.h"

@implementation Document

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.documentType = (NSString *) dictionary[@"documentType"];
        self.fileUploadUid = (NSString *) dictionary[@"fileUploadUid"];
        self.pageIndex = (NSString *) dictionary[@"pageIndex"];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    return @{
         @"documentType":self.documentType,
         @"fileUploadUid":self.fileUploadUid,
         @"pageIndex":self.pageIndex
    };
}

@end
