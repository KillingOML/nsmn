
# 有房插件化说明文档

![nsmn logo](http://img4.duitang.com/uploads/item/201311/29/20131129153909_AnrjX.thumb.600_0.jpeg)

## route_list（对外ROUTE）


### 1,（url） eroom/eroomHome
描述：有房主页面入口

### 2，(url) eroom/eroomOrderList
描述：有房订单入口

### 3，(url) eroom/eroomOrderDetail
描述：有房订单详情页面入口

入参：  key：   nr_order_id
value： 订单ID

[eLongRoutes routeURL:[NSURL URLWithString:@"eroom/eroomOrderDetail"] withParameters:@{@"orderId":@"0123456"}];

## service_list （对外SERVICE）

### 1，(name) : ERoomLogin
描述： 有房登录
使用场景：主app登录成功之后 调用此服务 静默登录 没有弹出页面 不会阻塞主线程及UI （入参：nil 返回：nil）

### 2，(name): ERoomLogout
描述：有房注销
使用场景：主app注销登录之后 调用此服务 静默注销 没有弹出页面 不会阻塞主线程及UI（入参：nil 返回：nil）

### 3，(name)：ERoomRedirectMain
描述： 跳转到有房主页面
使用场景：程序被彻底杀掉时候 接收到推送通知type＝8，点开通知，调用此服务跳转到有房主页面（入参：nil，返回：nil）

### 4，(name)：ERoomRedirectMessage
描述：跳转到有房消息列表
使用场景：程序在运行过程中 接收到推送通知type＝8 ，调用此服务，会抛出一个alert提示框，告知用户“您有你条新消息，是否查看”，点击 打开 跳转到有房消息列表；点击关闭 逻辑结束

### 5，(name): ERoomFavorite
描述：获取有房收藏的ViewController
使用场景：在收藏模块 新增一个有房收藏板块 调用此服务 获取收藏模块的VC （入参：nil 返回：UIViewController）
示例代码：

```
**.h
UIViewController * eroomFavoriteControl ；
```

```
**.m
if (!eroomFavoriteControl) {
[eLongServices     callService:@"ERoomFavorite",^(UIViewController *vc){
eroomFavoriteControl = vc;
[self.view addSubview:eroomFavoriteControl.view];
eroomFavoriteControl.view.frame = CGRectMake(0, 45, SCREEN_WIDTH, MAINCONTENTHEIGHT - 45);
},nil];
```

### 6，(name):ERoomEditFavorite 描述：有房收藏模块的删除

使用场景：在收藏模块 点击右上角编辑按钮 调用此服务 （入参：eroomFavoriteControl/收藏的ViewController 编辑状态：NS类型的值 返 回：nil）

示例代码：

```
[eLongServices callService:@"ERoomEditFavorite", eroomFavoriteControl, [NSNumber numberWithBool:editStatus], nil];
```

### 7,(name):ERoomFavoriteNumber 描述：有房收藏模块的收藏房间数量
使用场景：在收藏模块初始化‘特色房源’ViewController之后，调用此服务（入参：eroomFavoriteControl/收藏的ViewController 返回：NSNumber类型的数量）

示例代码：

```
[eLongServices callService:@"ERoomFavoriteNumber",eroomFavoriteViewController,^(NSNumber *houseNum){
},nil];



