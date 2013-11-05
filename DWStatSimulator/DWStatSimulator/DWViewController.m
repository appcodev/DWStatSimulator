//
//  DWViewController.m
//  DWStatSimulator
//
//  Created by Guest User on 11/5/56 BE.
//  Copyright (c) 2556 TOATE. All rights reserved.
//

#import "DWViewController.h"
#import "DWHero.h"

@interface DWViewController (){
    
    //select character
    IBOutlet UILabel *characterNameLabel;
    
    //primary stat
    
    IBOutlet UILabel *powBaseLabel;
    IBOutlet UILabel *agiBaseLabel;
    IBOutlet UILabel *vitBaseLabel;
    
    IBOutlet UILabel *addPow;
    IBOutlet UILabel *addAgi;
    IBOutlet UILabel *addVit;
    
    //second stat
    IBOutlet UILabel *hpBase;
    IBOutlet UILabel *hpAdd;
    IBOutlet UILabel *hpSum;
    
    IBOutlet UILabel *defBase;
    IBOutlet UILabel *defAdd;
    IBOutlet UILabel *defSum;
    
    IBOutlet UILabel *attBase;
    IBOutlet UILabel *attAdd;
    IBOutlet UILabel *attSum;
    
    IBOutlet UILabel *spdBase;
    IBOutlet UILabel *spdAdd;
    IBOutlet UILabel *spdSum;
    
    IBOutlet UILabel *fleeBase;
    IBOutlet UILabel *fleeAdd;
    IBOutlet UILabel *fleeSum;
    
    IBOutlet UILabel *criBase;
    IBOutlet UILabel *criAdd;
    IBOutlet UILabel *criSum;
    
    NSMutableArray *characters;
    int chaIndex;
}

@end

@implementation DWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //read file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"datastat" ofType:@"plist"];
    NSDictionary *dataAll = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    //NSArray *key = @[@"dusit",@"wana",@"kala",@"manoa",@"kanon"];
    NSLog(@"%@",dataAll);
    //DWHero *dusit = [[DWHero alloc] initWithDic:<#(NSDictionary *)#> name:<#(NSString *)#>]
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////////// action ///////////

//// select character
- (IBAction)prevCharacter:(UIButton *)sender {
}
- (IBAction)nextCharacter:(UIButton *)sender {
}

//// adjust stat
- (IBAction)adjustPow:(UIStepper *)sender {
}
- (IBAction)adjustAgi:(UIStepper *)sender {
}
- (IBAction)adjustVit:(UIStepper *)sender {
}

@end
