```sh
for ref [https://gist.github.com/mannnish/4d8ffaa97001ca3ac5f4b611153b4398]

firebase init
select Hosting wihout Github deploy action
select project from firebase
? What do you want to use as your public directory? build/web
? Configure as a single-page app (rewrite all urls to /index.html)? Yes
? Set up automatic builds and deploys with GitHub? No


flutter build web
firebase deploy --only hosting

```