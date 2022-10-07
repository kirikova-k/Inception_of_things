# Inception_of_things

PART1

https://zalinux.ru/?p=2215(небольшой туториал по vagrant c установкой)
В 2022 в РФ для установки vagrant потребуется впн.
Установка: 
sudo apt install --fix-missing vagrant

проверить что установился:
vagrant --version

    Vagrant собирает виртуальные машины исходя из конфигурационного файла Vagrantfile. Вы можете создавать
    и использовать для быстрого развёртывания свои варианты, либо устанавливать различные операционные 
    системы подготовленные другими. Большой сборник содержится в Vagrant Cloud, там вы можете выбрать 
    заинтересовавшую вас коробку и собрать, а затем запустить с помощью команд:
    vagrant init <нужный образ>
    vagrant up

Пишем Vagrantfile, он будет описывать 2 виртуалки - по сабжу Server и ServerWorker
Мини-туториал по Vagrantfile https://help.ubuntu.ru/wiki/vagrant

В своем Vagrantfile прокомментировала все шаги (почти).
Vagrantfile готов и лежит в корне каталога р1. Приступаем к сборке, если все ок, это займет минут 10:

vagrant up

Подключаемся по ssh к нашему серверу:

vagrant ssh <server_name>

cubectl get nodes 
покажет информацию об узлах кластера, или более полная информация:
cubectl -o wide

Проблемы, с которыми я столкнулась к этому этапу:
Сentos8 уже не поддерживается, поэтому нужно указать зеркала в Vagrntfile.
На данном этапе не надо ставить никакие плагины в vagrant(как пишут в гайдах по установке), это может
привести к непредвиденным ошибкам по причине, указанной выше. Также, с этим образом не будут
работать расшаренные папки и придется городить костыли, чтобы настроить доступ агентской машины к серверу.
С этим как раз мог бы помочь плагин vbguest, но не на Centos8. 
Последние версии Vbox не дают менять ip виртуалки, это лечится либо откатом версии Vbox, либо
редактированием (или созданием) /etc/vbox/networks.conf >> "* 0.0.0.0/0 ::/0", без кавычек.