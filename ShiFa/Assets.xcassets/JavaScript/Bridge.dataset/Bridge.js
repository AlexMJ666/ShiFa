function Bridge () {

    this.userId = '0';
    this.device = 'iPhone';
    this.deviceId = '';
    this.system = 'iOS';
    this.version = '2.7';
    this.siteId = '0';
    this.hasLogin = 0;
    this.userType = '2';
    this.carId = 0;
    this.chosenCarId = 0;
    this.chosenCarName = '';
    this.accountId = '0';
    
    this.test = function() {
        return 'It works!';
    }
    
    this.getUserId = function() {
        return this.userId;
    }
    
    this.getAccountId = function() {
        return this.accountId;
    }
    
    this.setAccountId = function(accountId) {
        this.accountId = accountId;
    }
    
    this.setUserId = function(userId) {
        this.userId = userId;
    }
    
    this.getDevice =  function() {
        return this.device;
    }
    
    this.setDevice = function(device) {
        this.device = device;
    }
    
    this.getDeviceId = function() {
        return this.deviceId;
    }
    
    this.setDeviceId = function(deviceId) {
        this.deviceId = deviceId;
    }
    
    this.getSystem = function() {
        return this.system;
    }
    
    this.setSystem = function(system) {
        this.system = system;
    }
    
    this.getVersion = function() {
        return this.version;
    }
    
    this.setVersion = function(version) {
        this.version = version;
    }
    
    this.getSiteId = function() {
        return this.siteId;
    }
    
    this.setSiteId = function(siteId) {
        this.siteId = siteId;
    }
    
    this.hasLogin = function() {
        return this.hasLogin;
    }
    
    this.setHasLogin = function(hasLogin) {
        this.hasLogin = hasLogin;
    }
    
    this.getUserType = function() {
        return this.userType;
    }
    
    this.setUserType = function(userType) {
        this.userType = userType;
    }
    
    this.getCarId = function() {
        return this.carId;
    }
    
    this.setCarId = function(carId) {
        this.carId = carId;
    }
    
    this.getChosenCarId = function() {
        return this.chosenCarId;
    }
    
    this.setChosenCarId = function(chosenCarId) {
        this.chosenCarId = chosenCarId;
    }
    
    this.getChosenCarName = function() {
        return this.chosenCarName;
    }
    
    this.setChosenCarName = function(chosenCarName) {
        this.chosenCarName = chosenCarName;
    }
    
    this.print = function(data) {
        
    }

    // 错误提示
    this.showToast = function(errorMsg) {
        window.open('?tqmall_target_action=show_error_message' + '&&errorMsg=' + errorMsg.toString(), '_self');
    }

    // 消息弹窗
    this.showDialog = function(message) {
        window.open('?tqmall_target_action=show_message' + '&&message=' + message.toString(), '_self');
    }

    // 显示菊花
    this.showProgressHUD = function(message) {
        window.open('?tqmall_target_action=show_progress_hud' + '&&message=' + message.toString(), '_self');
    }

    // 隐藏菊花
    this.hideProgressHUD = function() {
        window.open('?tqmall_target_action=hide_progress_hud', '_self');
    }
    
    // 跳转至会员中心
    this.pushToProfileCenter = function() {
        window.open('?tqmall_target_action=push_profile_vc', '_self');
    }

    // 给出一个提示，确定后跳转至会员中心
    this.pushToProfileCenterWithStr = function(message) {
        window.open('?tqmall_target_action=show_message_then_push_profile_vc' + '&&message=' + message.toString(), '_self');
    }

    // 跳转至我的订单
    this.pushToMyOrderList = function() {
        window.open('?tqmall_target_action=push_orders_vc', '_self');
    }

    // 跳转至主页
    this.pushToMainView = function() {
        window.open('?tqmall_target_action=pop_to_root_vc', '_self');
    }

    // 关闭当前页面
    this.finishCurrentView = function() {
        window.open('?tqmall_target_action=pop_to_previous_vc', '_self');
    }

    // 查看商品详情
    this.viewProductDetail = function(productID) {
    	window.open('?tqmall_target_action=push_product_detail_vc' + '&&productID=' + productID.toString(), '_self');
    }

    // 购买商品套装
    this.purse = function(cartList) {
    	window.open('?tqmall_target_action=buy_now' + '&&cartList=' + cartList.toString(), '_self');
    }
    
    // 跳转到购物车
    this.pushToCartList = function() {
        window.open('?tqmall_target_action=push_cart_vc', '_self');
    }
    
    // 设置购物车角标数值
    this.setBadgeCartCount = function(count) {
        window.open('?tqmall_target_action=set_cart_badge_number' + '&&count=' + count.toString(), '_self');
    }
    
    // 设置页面标题
    this.setTitle = function(title) {
        window.open('?tqmall_target_action=set_title' + '&&title=' + title.toString(), '_self');
    }
    
    // 跳转到登录页面
    this.login = function() {
        window.open('?tqmall_target_action=push_login_vc', '_self');
    }
    
    // 分享
    this.share = function(title, text, image, url) {
        window.open('?tqmall_target_action=share_to_sns' + '&&title=' + title.toString() + '&&text=' + text.toString() + '&&image=' + image.toString() + '&&url=' + url.toString(), '_self');
    }
    
    // 分享，带平台
    this.sharePlatform = function(title, text, image, url, platform) {
        window.open('?tqmall_target_action=share_to_sns_platform' + '&&platform=' + platform.toString() + '&&title=' + title.toString() + '&&text=' + text.toString() + '&&image=' + image.toString() + '&&url=' + url.toString(), '_self');
    }
    
    // 直接分享，不用选择
    this.shareDirectly = function(title, text, image, url, platform) {
        window.open('?tqmall_target_action=share_directly_to_sns' + '&&platform=' + platform.toString() + '&&title=' + title.toString() + '&&text=' + text.toString() + '&&image=' + image.toString() + '&&url=' + url.toString(), '_self');
    }
    
    // 查看大图
    this.viewBigPicture = function(imgURLs) {
        window.open('?tqmall_target_action=view_big_images' + '&&imgURLs=' + imgURLs.toString(), '_self');
    }
    
    // 跳转到轮胎频道
    this.showTyrePortal = function() {
        window.open('?tqmall_target_action=push_tyre_portal', '_self');
    }
    
    // 跳转到车型选择页面
    this.pushToChooseCarView = function() {
        window.open('?tqmall_target_action=push_select_car_view','_self');
    }
//    this.selectCar = function() {
//        window.open('?tqmall_target_action=push_select_car_view', '_self');
//    }
    
    // 滚动到页面顶部
    this.scrollsToTop = function() {
        window.open('?tqmall_target_action=scrolls_to_top', '_self');
    }
    
    // 到萝卜丝平台
    this.pushToRobles = function() {
        window.open('?tqmall_target_action=push_to_robles', '_self');
    }
    
    // 到商铺
    this.pushToSeller = function(sellerId) {
        window.open('?tqmall_target_action=push_to_seller'+ '&&sellerId=' + sellerId.toString(), '_self');
    }
    
    this.pushToMerchantVerify = function(){
        window.open('?tqmall_target_action=push_to_merchant_verify', '_self');
    }
    
    // 拍照or选择照片
    this.attachImage = function() {
        window.open('?tqmall_target_action=attachImage','_self');
    }
    
    this.attachImage = function(type) {
        window.open('?tqmall_target_action=attachImage'+ '&&type=' + type.toString() ,'_self')
    }
    
}

var Tqmall = new Bridge();

