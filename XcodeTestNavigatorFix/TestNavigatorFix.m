#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface Observer : NSObject <XCTestObservation>

@property (nonatomic) BOOL isDummyInjected;

@end

@interface TestNavigatorFix : XCTestCase

@end

@implementation Observer

- (void)testSuiteWillStart:(XCTestSuite *)testSuite {
    if (!self.isDummyInjected) {
        XCTestSuite *suite = [self findLastSuiteToBeExecuted:testSuite];
        [self injectDummyToTestSuite:suite];
        self.isDummyInjected = true;
    }
}

- (XCTestSuite *)findLastSuiteToBeExecuted:(XCTestSuite *)testSuite {
    Class XCTestCaseSuite = NSClassFromString(@"XCTestCaseSuite");
    
    if ([testSuite isKindOfClass:XCTestCaseSuite]) {
        return testSuite;
    } else {
        return [self findLastSuiteToBeExecuted:testSuite.tests.lastObject];
    }
}

- (void)injectDummyToTestSuite:(XCTestSuite *)testSuite {
    XCTestCase *dummyCase = [TestNavigatorFix testCaseWithSelector:NSSelectorFromString(@"dummyTestCase")];
    [testSuite addTest:dummyCase];
}

@end

static Observer *observer = nil;

@implementation TestNavigatorFix

+ (void)load {
    if (!observer) {
        observer = [Observer new];
        [[XCTestObservationCenter sharedTestObservationCenter] addTestObserver:observer];
    }
}

- (void)dummyTestCase {
    // Do nothing
}

@end
