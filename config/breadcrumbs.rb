crumb :root do
  link "トップページ", root_path
end

crumb :user do |user|
  link "ユーザー詳細ページ", user_path(user)
end

crumb :index_tweet do
  link "タイムライン", tweets_path
end

crumb :edit_user do |user|
  link "プロフィール編集", edit_user_path(user)
  parent :user, user
end

crumb :new_tweet do
  link "ツイート", new_tweet_path
end

crumb :show_tweet do |user|
  link "ツイート詳細ページ", tweet_path
  parent :user, user
end

crumb :edit_tweet do |user|
  link "ツイート変更ページ", edit_tweet_path
  parent :show_tweet, user
end

crumb :index_user do
  link "ユーザー一覧", users_path
end

crumb :torainee do
  link "トレーニー一覧", users_path
  parent :index_user
end

crumb :torainer do
  link "トレーナー一覧", users_path
  parent :index_user
end

crumb :search do
  link "検索", search_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
