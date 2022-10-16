# Inception_of_things

PART1

https://zalinux.ru/?p=2215 (небольшой туториал по vagrant c установкой)
В 2022 в РФ для установки и работы vagrant и плагинов потребуется впн.
Установка Vagrant: 
sudo apt install --fix-missing vagrant

проверить что установился:
vagrant --version

    Vagrant собирает виртуальные машины исходя из конфигурационного файла Vagrantfile. Вы можете создавать
    и использовать для быстрого развёртывания свои варианты, либо устанавливать различные операционные 
    системы подготовленные другими. Большой сборник содержится в Vagrant Cloud, там вы можете выбрать 
    заинтересовавшую вас коробку и собрать, а затем запустить с помощью команд:
    vagrant init <нужный образ>
    vagrant up

Установка необходимых плагинов для работы с гостевыми системами:
sudo apt-get install virtualbox-guest-additions-iso
vagrant plugin install vagrant-vbguest

Пишем Vagrantfile, он будет описывать 2 виртуалки - по сабжу Server и ServerWorker
Мини-туториал по Vagrantfile https://help.ubuntu.ru/wiki/vagrant

В своем Vagrantfile прокомментировала все шаги (почти).
Когда Vagrantfile готов и лежит в корне каталога р1 приступаем к сборке, если все ок, это займет минут 10:

vagrant up

Если все собралось без ошибок, подключаемся по ssh к нашему серверу:

vagrant ssh <server_name>

kubectl get nodes 
покажет информацию об узлах кластера, или более полная информация:
kubectl get nodes -o wide

Проблемы, с которыми я столкнулась к этому этапу:
Сentos8 уже не поддерживается, поэтому нужно указать зеркала в Vagrntfile. Также, с этим образом не будут
работать расшаренные папки и придется городить костыли, чтобы настроить доступ агентской машины к серверу.
Последние версии Vbox не дают менять ip виртуалки, это лечится либо откатом версии Vbox, либо редактированием (или созданием) /etc/vbox/networks.conf >> "* 0.0.0.0/0 ::/0", без кавычек.
