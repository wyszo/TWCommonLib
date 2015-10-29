//
//  TWCommonLib
//

#import "TWGradientView.h"

@implementation TWGradientView

#pragma mark - Initialization

+ (Class)layerClass
{
  return [CAGradientLayer class];
}

- (void)awakeFromNib
{
  [super awakeFromNib];
  
  self.gradientLayer.shouldRasterize = YES;
  self.gradientLayer.rasterizationScale = [UIScreen mainScreen].scale;
  
  if (self.gradientColors) {
    self.gradientLayer.colors = self.gradientColors;
  }
  else {
    [self setDefaultGradientColors];
  }
}

- (void)setDefaultGradientColors
{
  UIColor *whiteTransparent = [UIColor colorWithWhite:1.0 alpha:0];
  UIColor *black = [UIColor blackColor];
  [self setGradientColors:@[whiteTransparent, black]];
}

#pragma mark - Public

- (void)setGradientColors:(NSArray *)gradientColors
{
  if (gradientColors && gradientColors != _gradientColors) {
    NSMutableArray *cgColorsArray = [NSMutableArray new];
    
    for (UIColor *color in gradientColors) {
      [cgColorsArray addObject:(id)[color CGColor]];
    }
    _gradientColors = [cgColorsArray copy];
    self.gradientLayer.colors = _gradientColors;
  }
}

#pragma mark - Accessors

- (CAGradientLayer *)gradientLayer
{
  return (CAGradientLayer *)self.layer;
}

@end
