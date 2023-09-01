## lab-03
iSCSI, GFS2
otus | iSCSI, multipath and cluster file systems: GFS2

### Домашнее задание
Реализация GFS2 хранилища на виртуалках под виртуалбокс

#### Цель:
развернуть в VirtualBox следующую конфигурацию с помощью terraform

- виртуалка с iscsi
- 1 виртуалка - Nginx - с публичным IP адресом
- 3 виртуальные машины с разделяемой файловой системой GFS2 поверх cLVM
- должен быть настроен fencing для VirtualBox - https://github.com/ClusterLabs/fence-agents/tree/master/agents/vbox 
  для сдачи
- terraform манифесты
- ansible роль
- README file

#### Критерии оценки:
Статус "Принято" ставится при выполнении перечисленных требований.


### Выполнение домашнего задания

#### Создание стенда




