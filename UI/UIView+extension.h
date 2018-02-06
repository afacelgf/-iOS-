

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZJViewBorder) {
    ZJViewBorderTop = 1<<1,
    ZJViewBorderLeft = 1<<2,
    ZJViewBorderBottom = 1<<3,
    ZJViewBorderRight = 1<<4,
};
@interface UIView (extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


@property (nonatomic, assign) ZJViewBorder borderWhich;//边框
@end
