# mysql

## 環境準備メモ

### イメージ取得

```bash
# docker image pull mysql:latest
docker pull mysql:8.0.40
```

### 課題の準備

```bash
cd 番号/
docker run --rm --name mysql -v `pwd`:`pwd` -w `pwd` -it -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:8.0.40
docker exec -it mysql mysql -u root
source init.sql
```

### 課題の回答のSQLを実行する

```bash
source answer.sql
```

### 利用終了後

```bash
docker stop mysql
```
