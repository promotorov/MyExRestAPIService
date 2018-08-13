#import "NSStringHelper.h"

@implementation NSString (Additions)

- (BOOL) isBlank {
    NSString *trimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmed.length < 1;
}

@end
