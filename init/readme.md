# Git 
```shell
git config credential.helper store --global
```
```shell
git config --global --list
```



# Deploy
외부 properties 넣어서 빌드
```
java -jar myApp.jar --spring.config.additional-location=optional:classpath:test.yml
```