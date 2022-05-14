//
//  RunnerTests.m
//  RunnerTests
//
//  Created by Nicholas Meinhold on 14/5/2022.
//

#import <XCTest/XCTest.h>
#import "box2d_glue.h"

@interface RunnerTests : XCTestCase

@end

@implementation RunnerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}


- (void)testExample {
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    b2Vec2* vec = dart_bind_b2Vec2_b2Vec2_2(10, 11);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
