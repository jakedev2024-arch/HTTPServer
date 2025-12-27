
#import "TCHTTPConnection.h"

@implementation TCHTTPConnection

#pragma mark - get & post
 
- (BOOL)supportsMethod:(NSString *)method atPath:(NSString *)path
{
    // Add support for POST
    if ([method isEqualToString:@"POST"])
    {
        if ([path isEqualToString:@"/calculate"])
        {
            // Let's be extra cautious, and make sure the upload isn't 5 gigs
            return YES;
        }
    }
    
    return [super supportsMethod:method atPath:path];
}
 
- (BOOL)expectsRequestBodyFromMethod:(NSString *)method atPath:(NSString *)path
{

    if([method isEqualToString:@"POST"]) return YES;
    
    return [super expectsRequestBodyFromMethod:method atPath:path];
}
 

- (void)prepareForBodyWithSize:(UInt64)contentLength
{
    
    // If we supported large uploads,
    // we might use this method to create/open files, allocate memory, etc.
}
 

 
#pragma mark - 私有方法
 
//获取上行参数
- (NSDictionary *)getRequestParam:(NSData *)rawData
{
    if (!rawData) return nil;
    
    NSString *raw = [[NSString alloc] initWithData:rawData encoding:NSUTF8StringEncoding];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    NSArray *array = [raw componentsSeparatedByString:@"&"];
    for (NSString *string in array) {
        NSArray *arr = [string componentsSeparatedByString:@"="];
        NSString *value = [arr.lastObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [paramDic setValue:value forKey:arr.firstObject];
    }
    return [paramDic copy];
}
@end
