json.id                 @comment.id
json.text               @comment.text
json.user_id            @comment.user.id
json.user_nickname      @comment.user.name
json.created_at         @comment.created_at.strftime("%Y/%m/%d %H:%M")
json.tweet_id           @comment.tweet.id
json.image              @comment.image.url
