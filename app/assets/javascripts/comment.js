$(document).on('turbolinks:load', function(){
  function buildHtmlBlue(comment){
    var text = comment.text ? `${ comment.text }` : "";
    var image = comment.image ? `<img src=${comment.image} >` : ""; 
    
    var html = `<div class="tweet-comment">
                  <div class="commtent-user-image">
                  <div class="comment-content">
                    <div class="upper-content">
                    <div class="upper-content__username">
                      ${comment.user_nickname}
                    <div class="upper-content__comment-date">
                    ${comment.created_at}
                  <div class=".main-content">
                    <p class="main-contnet__content">
                    ${text}
                    </p>
                    ${image}
                  </div>
                </div>`
    return html;
  }


  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var comment = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: comment,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHtmlBlue(data);
      $('.tweet-comments').append(html);
      $('#new_comment')[0].reset();
    })
    .fail(function(data){
      alert('コメント送信エラー');
    })
    .always(function(data){
      $('.item-message__container__content__form__submit-btn').prop("disabled", false);
    })
  })
});