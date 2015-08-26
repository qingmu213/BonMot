//
//  BONChainLinkTestCase.m
//  BonMot
//
//  Created by Michael Skiba on 8/25/15.
//  Copyright © 2015 Zev Eisenberg. All rights reserved.
//

#import "BONBaseTestCase.h"

#import <BonMot/BonMot.h>

@interface BONChainLinkTestCase : XCTestCase

@end

@implementation BONChainLinkTestCase

- (void)testMultiStepComposition {
    // Attempting multi-step composition fails
    BONChain *chain = BONChain.new.string(@"Hello, testing world.");

    XCTAssert([chain.attributedString.string isEqualToString:@"Hello, testing world."]);

    chain.appendWithSeparator(@" ", BONChain.new.string(@"Goodbye."));
    if (true){
        chain.appendWithSeparator(@" ", BONChain.new.string(@"Really."));
    }

    XCTAssert([chain.attributedString.string isEqualToString:@"Hello, testing world. Really."]);
}

- (void)testReassigningChains{
    // Attempting to reassign the chain really fails
    BONChain *chain = BONChain.new.string(@"Hello, testing world.");

    XCTAssert([chain.attributedString.string isEqualToString:@"Hello, testing world."]);

    chain = chain.appendWithSeparator(@" ", BONChain.new.string(@"Goodbye."));
    if (true){
        chain = chain.appendWithSeparator(@" ", BONChain.new.string(@"Really."));
    }

    XCTAssert([chain.attributedString.string isEqualToString:@"Really."]);
}

- (void)testLinkingChains{
    //Linking works
    BONChain *chain = BONChain.new.string(@"Hello, testing world.");
    [chain linkWithChain:BONChain.new.string(@"Goodbye.") usingSeparator:@" "];
    if (true){
        [chain linkWithChain:BONChain.new.string(@"..Really!")];
    }
    XCTAssert([chain.attributedString.string isEqualToString: @"Hello, testing world. Goodbye...Really!"]);
}

@end
