//
//  main.m
//  VirusVsAntiVirus


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *hexAndBinary = @"74 7d 4a 58 4c 44 90 | 1110001 1010101 1110011 1011001 111100 1111100 1110010 1100100";
        NSArray *pipeSeperatedComponents = [hexAndBinary componentsSeparatedByString:@" | "];
        NSArray *seperatedBinaryStringArray = [[pipeSeperatedComponents objectAtIndex:1] componentsSeparatedByString:@" "];
        NSArray *seperatedHexStringArray = [[pipeSeperatedComponents objectAtIndex:0] componentsSeparatedByString:@" "];
        NSArray *objectsArray = [NSArray arrayWithObjects: @"0", @"1", @"2", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", nil];
        NSArray *keysArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"4", @"5", @"6", @"7", @"8", @"9", @"a", @"b", @"c", @"d", @"e", @"f", nil];
        
        NSDictionary *hexValuesDict = [[NSDictionary alloc] initWithObjects: objectsArray forKeys: keysArray];
        
        NSInteger finalBinaryInt = 0;
        NSInteger finalHexInt = 0;
        
        // add binary numbers right side of the pipe
        for (NSString *binaryString in seperatedBinaryStringArray) {
            // un-binary the string
            NSInteger i = 0;
            
            for (i = 0; i < binaryString.length; i++) {
                
                // build power of 2
                NSString *string = [NSString stringWithFormat:@"%c", [binaryString characterAtIndex:i]];
                NSInteger binaryInt = [string integerValue];
                
                NSInteger k = 0;
                for (k = 0; k < binaryString.length - 1 - i; k++) {
                    binaryInt = binaryInt * 2;
                }
                finalBinaryInt += binaryInt;
//                NSLog(@"\nbinaryInt:%ld\n\n", binaryInt);
            }
//            NSLog(@"\nfinalBinaryInt:%ld\n\n", finalBinaryInt);
        }
        
        // add hexidecimal numbers from left side of the pipe
        for (NSString *hexString in seperatedHexStringArray) {
            // un-binary the string
            NSInteger j = 0;
            
            for (j = 0; j < hexString.length; j++) {
                
                // build power of 2
                NSString *keyString = [NSString stringWithFormat:@"%c", [hexString characterAtIndex:j]];
                NSString *valueString = [hexValuesDict objectForKey:keyString];
                NSInteger hexInt = [valueString integerValue];
                
                NSInteger m = 0;
                for (m = 0; m < hexString.length - 1 - j; m++) {
                    hexInt = hexInt * 16;
                }
                
                finalHexInt += hexInt;
//                NSLog(@"hexInt: %ld", hexInt);
            }
            
//            NSLog(@"\nfinalHexInt:%ld\n\n", finalHexInt);
        }
        
        if (finalBinaryInt >= finalHexInt) {
            NSLog(@"true");
        }
        else {
            NSLog(@"false");
        }
    
    }
    return 0;
}
