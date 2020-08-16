# jbuilderファイルでは基本的にjson.KEY VALUEという形で書くことができる
json.text  @comment.text
  json.user_id  @comment.user.id
  json.user_name  @comment.user.nickname