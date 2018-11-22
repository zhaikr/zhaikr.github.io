
#!/usr/bin/env sh
hexo clean
git add .
git commit -"blog"
git push
hexo d
hexo g  -d
hexo s

