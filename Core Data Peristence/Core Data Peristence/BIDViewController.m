//
//  BIDViewController.m
//  Core Data Peristence
//

#import "BIDViewController.h"
#import "BIDStringsManager.h"
#import "StoreController.h"

@interface BIDViewController ()
@property (nonatomic, strong) BIDStringsManager *dataManager;
@end

@implementation BIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataManager = [[BIDStringsManager alloc] init];
    NSArray *objects = [self.dataManager managedObjects];
    for (NSManagedObject *oneObject in objects) {
        int lineNum = [[oneObject valueForKey:kLineNumberKey] intValue];
        NSString *lineText = [oneObject valueForKey:kLineTextKey];
        
        UITextField *theField = self.lineFields[lineNum];
        theField.text = lineText;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:app];
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    NSArray *strings = [self.lineFields valueForKey:@"text"];
    [self.dataManager saveStrings:strings];
}

@end
