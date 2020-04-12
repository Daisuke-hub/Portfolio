// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery 
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

// ブラウザバック時の強制リロード
history.pushState(null, null, location.href);
$(window).on("popstate", function () {
  history.go(1);
  location.reload();
});

// ページ上部に推移
$(function() {
    $('#page_top').on('click',function(){
        $('body, html').animate({
        scrollTop:0
        }, 800);
        return false;
    });
});

// プッシュ通知の許可申請
$(function(){
    $('#push').on('click',function(){
        if (!('Notification' in window)) {
            alert('お使いのブラウザは通知機能非対応です');
            }else{
            alert("ブラウザの通知設定を有効にすることで、チャットメッセージを受信した時に、プッシュ通知を受け取ることができます。(ブラウザによっては通知を受け取れない場合があります。)");
            // 許可を求める
            Notification.requestPermission()
                .then((permission) => {
                if (permission == 'granted') {
                    var notification = new Notification('通知が許可されました');
                } else if (permission == 'denied') {
                    var notification = new Notification('通知を拒否しました');
                } else if (permission == 'default') {
                }
            });
        };
    });
});