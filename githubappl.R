library(httr)
library(httpuv)
oauth_endpoints("github")
myapp <- oauth_app("github", "bcc856e74de8c13b2751", "a15744ae19217df77374f1153bc45143b5939c1b")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
json1=content(req)

for (i in 1:length(json1)){
  if (json1[[i]]$name=='datasharing'){
    print (json1[[i]]$created_at)
  }
}
