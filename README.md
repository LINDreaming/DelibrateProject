# DelibrateProject
contains some small demo, Objective-C code
简述：NSTimer是iOS系统的计时控件,下面介绍NSTimer的使用，简单详细：
![这里写图片描述](http://img.blog.csdn.net/20170714175504342?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvU3VuRmxvd2VySW5SYWlu/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  1. Timer的开启:
```
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block 
```
创建一个timer对象，并且默认将timer添加Runloop系统中，timer开始计时；

2.  timer的暂停；
```
[_timer setFireDate:[NSDate distantFuture]];
```
'fireDate' 是设置定时器的开启时间，通过将fireDate设置为`distantFuture`（无限远的将来），将timer暂停。
3. 暂停后重启：

```
[_timer setFireDate:[NSDate distantPast]];
```
将fireDate设置为`distantPast`，来将暂停后的timer重启。
4. timer销毁；

```
[_timer invalidate];
```
这一步非常重要，将timer从系统的runloop中移除，避免出现内存泄漏，并将timer的计时数据清零。
4.  格式化时间的样式，将计时时间与展示成00：00的样式；

```
+ (NSString *)stringWithTimeInterval:(NSTimeInterval)interval{
    NSInteger min = interval/60;
    NSInteger sec = (NSInteger)interval%60;
    
    NSString *minStr =min<10? [NSString stringWithFormat:@"0%ld",(long)min]:[NSString stringWithFormat:@"%ld",(long)min];
    NSString *secStr = sec <10 ?[NSString stringWithFormat:@"0%ld",(long)sec]:[NSString stringWithFormat:@"%ld",(long)sec];
    return [NSString stringWithFormat:@"%@:%@",minStr,secStr];
    
}
```
这里写了一个category,方便项目中其它地方的使用，简少代码的耦合；
我把项目上传到我的github上面了，有兴趣的朋友可以看一下,欢迎交流指正；
https://github.com/LINDreaming/DelibrateProject



