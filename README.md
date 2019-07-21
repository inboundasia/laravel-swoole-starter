docker build . -t kurorido/laravel-swoole

docker run -d -p 1215:1215 kurorido/laravel-swoole
