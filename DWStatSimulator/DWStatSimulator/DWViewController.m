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
    IBOutlet UIImageView *characterImage;
    
    //primary stat
    IBOutlet UILabel *powBaseLabel;
    IBOutlet UILabel *agiBaseLabel;
    IBOutlet UILabel *vitBaseLabel;
    
    IBOutlet UILabel *addPow;
    IBOutlet UILabel *addAgi;
    IBOutlet UILabel *addVit;
    
    IBOutlet UIStepper *powStepper;
    IBOutlet UIStepper *agiStepper;
    IBOutlet UIStepper *vitStepper;
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
    int charIndex;
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
    NSArray *keys = @[@"dusit",@"wana",@"kala",@"manoa",@"kanon"];
    
    int i=0;
    charIndex = 0;
    characters = [NSMutableArray new];
    
    for (NSString *key in keys) {
        NSString *nameKey = keys[i];
        DWHero *dusit = [[DWHero alloc] initWithDic:dataAll[nameKey]
                                               name:nameKey];
        
        [characters addObject:dusit];
        i++;
    }
    
    //ui
    [self selectCharacterIndex:charIndex];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectCharacterIndex:(int)index{
    
    if (index<0) {
        charIndex = 4;
    }else if(index>4){
        charIndex = 0;
    }else{
        charIndex = index;
    }
    //NSLog(@"index %d",charIndex);
    [self updateUI:characters[charIndex]];
}

- (void)updateUI:(DWHero*)hero{
    
    //name label
    characterNameLabel.text = hero.heroName;
    characterImage.image = [UIImage imageNamed:hero.heroName];
    
    //stat
    [powStepper setMaximumValue:MAX_STAT_POINT-hero.basePow.intValue];
    [agiStepper setMaximumValue:MAX_STAT_POINT-hero.baseAgi.intValue];
    [vitStepper setMaximumValue:MAX_STAT_POINT-hero.baseVit.intValue];
    
    hero.bonusPow = [NSNumber numberWithDouble:powStepper.value];
    hero.bonusAgi = [NSNumber numberWithDouble:agiStepper.value];
    hero.bonusVit = [NSNumber numberWithDouble:vitStepper.value];
    [hero updateStat];
    
    powBaseLabel.text = [NSString stringWithFormat:@"%@",hero.basePow];
    agiBaseLabel.text = [NSString stringWithFormat:@"%@",hero.baseAgi];
    vitBaseLabel.text = [NSString stringWithFormat:@"%@",hero.baseVit];
    
    addPow.text = [NSString stringWithFormat:@"%@",hero.bonusPow];
    addAgi.text = [NSString stringWithFormat:@"%@",hero.bonusAgi];
    addVit.text = [NSString stringWithFormat:@"%@",hero.bonusVit];
    
    //2nd stat
    hpBase.text = [NSString stringWithFormat:@"%@",hero.baseHp];
    defBase.text = [NSString stringWithFormat:@"%@",hero.baseDef];
    attBase.text = [NSString stringWithFormat:@"%@",hero.baseAtt];
    spdBase.text = [NSString stringWithFormat:@"%@",hero.baseSpd];
    fleeBase.text = [NSString stringWithFormat:@"%@",hero.baseFlee];
    criBase.text = [NSString stringWithFormat:@"%@",hero.baseCri];
    
    hpAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeHp];
    defAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeDef];
    attAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeAtt];
    spdAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeSpd];
    fleeAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeFlee];
    criAdd.text = [NSString stringWithFormat:@"%@",hero.upgradeCri];
    
    hpSum.text = [NSString stringWithFormat:@"%@",hero.hp];
    defSum.text = [NSString stringWithFormat:@"%@",hero.def];
    attSum.text = [NSString stringWithFormat:@"%@",hero.att];
    spdSum.text = [NSString stringWithFormat:@"%@",hero.spd];
    fleeSum.text = [NSString stringWithFormat:@"%@",hero.flee];
    criSum.text = [NSString stringWithFormat:@"%@",hero.cri];
    
}

/////////// action ///////////

//// select character
- (IBAction)prevCharacter:(UIButton *)sender {
    [self selectCharacterIndex:charIndex-1];
}
- (IBAction)nextCharacter:(UIButton *)sender {
    [self selectCharacterIndex:charIndex+1];
}

//// adjust stat
- (IBAction)adjustPow:(UIStepper *)sender {
    [self updateUI:characters[charIndex]];
}
- (IBAction)adjustAgi:(UIStepper *)sender {
    [self updateUI:characters[charIndex]];
}
- (IBAction)adjustVit:(UIStepper *)sender {
    [self updateUI:characters[charIndex]];
}

@end
