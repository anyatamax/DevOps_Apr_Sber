# DevOps_Apr_Sber

### Задание №1  
Реализовать простое веб приложение, у которого обрабатывает запросы на два endpoint’а :   
* GET /time - этот endpoint должен отдавать текущее время  
* GET /statistics - этот endpoint должен отдавать количество обращений к endpoint’у /time в виде одного числа. Соответственно, ваше приложение должно хранить информацию о каждом обращении и отдавать эту информацию по запросу.   
Далее необходимо реализовать скрипт, который будет обращаться к endpoint’у GET /statistics и записывать полученный результат в файл. Этот скрипт должен будет вызываться раз в 5 секунд.  

Все перечисленное выше должно запускаться в Kubernetes. Для этого вам необходимо:   
контейнеризировать ваше приложение и скрипт(docker образы)  
написать манифесты конфигураций для этих двух образов  
bash скрипт для сборки образов и запуска всего внутри Kubernetes  

В readme проекта опишите куда надо сделать запрос, чтобы получить результат  

### Результат  
Для корректной работы необоходимо запустить minikube:  
minikube start   
Запускаем start.sh  
./start.sh  
В соседнем терминале запустить сервис:  
minikube service app-service  
Вывод:  
🏃  Starting tunnel for service app-service.  
|-----------|-------------|-------------|------------------------|  
| NAMESPACE |    NAME     | TARGET PORT |          URL           |  
|-----------|-------------|-------------|------------------------|  
| default   | app-service |             | http://127.0.0.1:50765 |  
|-----------|-------------|-------------|------------------------|  
🎉  Opening service default/app-service in default browser...  
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.   

Для получения времени необходимо выполнить:  
curl http://127.0.0.1:50765/time  (url из кода выше)   
Для получения статистики необходимо выполнить:  
curl http://127.0.0.1:50765/statistics  (url из кода выше)   
Для получения файла statistics.txt необходимо выполнить:  
kubectl cp statistics-client-56c46664bf-r64rl:statistics.txt ./statistics.txt (название пода statistics-client можно взять из команды kubectl get pods -o wide)  

