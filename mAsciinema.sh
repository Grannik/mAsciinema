#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 31);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=31;fi
 if [[ $aa -gt 31 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=31;fi
 if [[ $j1 -gt 31 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 31 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=44; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** asciinema ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m  Запись терминальной сессии, воспроизведение в терминале и в веб-браузере\e[0m";
 echo -en "\e[6;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[15;3H\033[36m Available options:\e[90m                                         Доступные опции:\e[0m";
 echo -en "\e[34;3H\033[36m Available options:\e[90m                                         Доступные опции:\e[0m";
 echo -en "\e[40;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[45;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[7;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[8;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[9;3H Окружающая среда                                               \e[32m ENVIRONMENT \e[0m";}
  E3(){ echo -en "\e[10;3H Ошибки                                                                \e[32m BUGS \e[0m";}
  E4(){ echo -en "\e[11;3H Автор                                                               \e[32m AUTHOR \e[0m";}
  E5(){ echo -en "\e[12;3H Версия                                                           \e[32m --version \e[0m";}
  E6(){ echo -en "\e[13;3H Команды                                                           \e[32m COMMANDS \e[0m";}
  E7(){ echo -en "\e[14;3H Запись терминальной сессии                                             \e[32m rec \e[0m";}
  E8(){ echo -en "\e[16;3H Включить stdin (keyboard) запись (см. ниже)                        \e[32m --stdin \e[0m";}
  E9(){ echo -en "\e[17;3H Приходите к существующей записи                                   \e[32m --append \e[0m";}
 E10(){ echo -en "\e[18;3H Сохраните выход сырья STDOUT, без информации о сроках или метаданных \e[32m --raw \e[0m";}
 E11(){ echo -en "\e[19;3H Переписать запись, если она уже существует                     \e[32m --overwrite \e[0m";}
 E12(){ echo -en "\e[20;3H Укажите команду для записи, по умолчанию до  \$SHELL \e[32m -c --command=<command> \e[0m";}
 E13(){ echo -en "\e[21;3H Список переменных среды для захвата                   \e[32m -e --env=<var-names> \e[0m";}
 E14(){ echo -en "\e[22;3H Укажите название ансикаста                              \e[32m -t --title=<title> \e[0m";}
 E15(){ echo -en "\e[23;3H Ограничение неактивности терминала к максимуму  \e[32m -i --idle-time-limit=<sec> \e[0m";}
 E16(){ echo -en "\e[24;3H Ответ «да» на все подсказки (например, загрузите подтверждение)    \e[32m-y --yes \e[0m";}
 E17(){ echo -en "\e[25;3H Подавляйте все уведомления/предупреждения (как раз -y)           \e[32m-q --quiet \e[0m";}
 E18(){ echo -en "\e[26;3H Воспроизведение записанного ассикаста в терминале                     \e[32m play \e[0m";}
 E19(){ echo -en "\e[27;3H Доступны следующие клавиши:                                                 ";}
 E20(){ echo -en "\e[28;3H Игра из локального файла:                                                   ";}
 E21(){ echo -en "\e[29;3H Игра с URL HTTP(S):                                                         ";}
 E22(){ echo -en "\e[30;3H Игра с сайта asciicast URL                                                  ";}
 E23(){ echo -en "\e[31;3H Игра от stdin:                                                              ";}
 E24(){ echo -en "\e[32;3H Игра от IPFS:                                                               ";}
 E25(){ echo -en "\e[33;3H Распечатать полный выход записанного аскциаста               \e[32mcat <filename> \e[0m";}
 E26(){ echo -en "\e[35;3H Ограничение повторного использования терминала   \e[32m-i --idle-time-limit=<sec> \e[0m";}
 E27(){ echo -en "\e[36;3H Скорость воспроизведения (может быть дробной)           \e[32m-s --speed=<factor> \e[0m";}
 E28(){ echo -en "\e[37;3H Загрузка                                                            \e[32m upload \e[0m";}
 E29(){ echo -en "\e[38;3H Связать свой идентификатор установки с учетной записью пользователя   \e[32m auth \e[0m";}
 E30(){ echo -en "\e[39;3H                                                                        \e[32m Git \e[0m";}
 E31(){ echo -en "\e[41;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Официальный представитель предоставил N методов установки, соответствующих
 различным дистрибутивам Linux, но здесь по-прежнему рекомендуется использовать
 для установки pip3. Необходимо пояснить, что для установки таким образом
 требуется Python 3. Похоже, что сейчас проектов Python становится все больше и
 больше. 2.7 был заброшен, и это действительно общая тенденция. Команда установки
 очень проста, а именно:\e[32m
 sudo apt install python3-pip
 sudo pip3 install asciinema\e[0m
#
\e[32m sudo apt-add-repository ppa:zanchey/asciinema
 && sudo apt-get update && sudo apt-get install asciinema\e[0m
#
\e[32m sudo snap install asciinema --classic\e[0m
#
\e[32m git clone https://github.com/asciinema/asciinema.git
 cd asciinema
 sudo python3 -m asciinema --version\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m asciinema command [options] [args]\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m ASCIINEMA_API_URL\e[0m
 Эта переменная позволяет пересчитать URL-адрес asciinema-server который по
 умолчанию на:\e[36m https://asciinema.org\e[0m
 в случае, если вы управляете своим собственным: asciinema-server в‐ stance

\e[32m ASCIINEMA_CONFIG_HOME\e[0m
 Эта переменная позволяет переопределять положение каталога config. По умолчанию
 месторасположение\e[32m \\XDG_CONFIG_HOME/asciinema\e[0m (когда\e[32m \\XDG_CONFIG_HOME\e[0m установлен)
 или\e[32m \\HOME/.config/asciinema\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Смотрите проблемы на GitHub:
\e[36m https://github.com/asciinema/asciinema/issues\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Ведущий разработчик asciinema — Марцин Кулик.
 Список всех участников смотрите здесь:
\e[36m https://github.com/asciinema/asciinema/contributors\e[0m
 Эта страница руководства была написана Марцином Куликом с помощью Курта Пфайфле.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m asciinema --version\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m asciinema\e[0m состоит из нескольких команд, подобных\e[32m git\e[0m,\e[32m apt-get\e[0m или\e[32m brew\e[0m.
 Когда вы запускаете asciinema без аргументов, отображается сообщение справки,
 в котором перечислены все доступные команды с их параметрами.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m asciinema rec first.cast\e[0m
 вы начнете новый сеанс записи. Записываемая команда (процесс) может быть указана
 с опцией -c (см. ниже), и по умолчанию
 \$SHELL, что вам нужно в большинстве случаев.
 Запись заканчивается, когда вы выходите из оболочки (нажмите Ctrl+D или введите
 exit). Если записываемый процесс не является оболочкой, то запись завершается,
 когда процесс завершается это.
 Если аргумент имени файла опущен, то (после запроса подтверждения)
 результирующий asciicast загружается на asciinema-сервер:
 https://github.com/asciinema/asciinema-server
 (по умолчанию asciinema.org), где его можно посмотреть и поделиться им.
 Если указан аргумент имени файла, результирующая запись (называемая asciicast
 (doc/asciicast-v2.md)) сохраняется в локальном файле. Позже его можно будет
 воспроизвести с asciinema play <имя файла> и/или загруженным на сервер asciinema
 с asciinema upload <имя файла>.
 ASCIINEMA_REC=1 добавляется к записанным переменным среды процесса.
 Это может использоваться файлом конфигурации вашей оболочки (.bashrc, .zshrc)
 для изменения подсказки или воспроизводить звук при записи оболочки.
 Запись стандартного ввода позволяет записывать все символы, введенные
 пользователем в текущей записанной оболочке. Это может быть использовано
 игроком. Hапример, asciinema-player:
 https://github.com/asciinema/asciinema-player,
 для отображения нажатых клавиш. Потому что это, по сути, ведение журнала ключей
 (применительно к одной оболочке в пределах одной оболочки stance, по умолчанию
 он отключен, и его необходимо явно включить с помощью параметра –stdin.
 ---------------------------------------------------------------------------
 Вы можете записывать и загружать за один шаг, опуская имя файла:
 asciinema rec
 Когда запись будет завершена, вас попросят подтвердить загрузку, поэтому без
 вашего согласия ничего никуда не отправляется.
 ----------------------------------------------------------------------------
 Обратите внимание, что после выполнения этой команды весь ваш следующий ввод и
 вывод будет записан в указанный файл, а эффект записи синхронизируется с временем
 ввода и вывода в это время. Когда запись закончится, нажмите сочетание клавиш
 Ctrl + D или введите exit
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[47;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта команда воспроизводит данное asciicast (как записан rec команда)
 непосредственно в вашем терминале:
\e[32m asciinema play first.cast\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[47;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m Space - toggle pause\e[0m - шаг за записью кадра в то время (при отмене),
\e[32m Ctrl+C              \e[0m - выход.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[47;30m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m asciinema play /path/to/asciicast.cast\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[47;30m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 asciinema play https://asciinema.org/a/22124.cast
 asciinema play http://example.com/demo.cast
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[47;30m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 (requires <link rel=\"alternate\" type=\"application/x-asciicast\"
 href=\"/my/ascii.cast\"> in page's HTML):
 asciinema play https://asciinema.org/a/22124
 asciinema play http://example.com/blog/post.html
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[47;30m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 cat /path/to/asciicast.cast | asciinema play -
 ssh user@host cat asciicast.cast | asciinema play -
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[47;30m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 asciinema play dweb:
/ipfs/QmNe7FsYaHc9SaDEAEXbaagAzNw9cH7YbzN4xV7jV1MCzK/ascii.cast
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[47;30m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 В то время как asciinema играет воспроизводит записанную сессию с использованием
 информации о сроках, сохраненной в аскициате, асинема cat сваливает полный выход
 (включая все escape последовательности) к терминалу немедленно:
 asciinema cat existing.cast >output.txt
 дает такой же результат, как запись через asciinema rec -raw вывода. Ткст
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[47;30m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Или с нормальной скоростью, но с простое время ограничено 2 секунды:
 asciinema play -i 2 first.cast
 Вы можете пройти -i 2 to asciinema rec также, установить его навсегда на запись.
 Ограничение времени Idle делает записи гораздо интереснее смотреть, попробуйте.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[47;30m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 повторите его с двойной скоростью:
\e[32m asciinema play -s 2 first.cast\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[47;30m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Загрузите записанные аскциасты на сайт asciinema.org.
 Эта команда загружает данное asciicast (записано rec команд) на asciinema.org,
 где его можно смотреть и делиться.
 asciinema rec demo.cast + asciinema играть demo.cast + asciinema загрузить демо.
 cast - это хороший комбо, если вы хотите просмотреть аскиз, прежде чем публиковать
 asciinema.org
 Приведенное выше загружает его на: https://asciinema.org, который является
 экземпляром asciinema-server по умолчанию:
 https://github.com/asciinema/asciinema-server
 и печатает секретная ссылка, которую вы можете использовать для просмотра записи
 в веб-браузере.
 Если вы хотите посмотреть и поделиться им в Интернете, загрузите его:
\e[32m asciinema upload first.cast\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[47;30m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Связать свой идентификатор установки с учетной записью пользователя asciinema.org.
 Если вы хотите управлять своими записями (изменить название / тема, удалить) на
 asciinema.org вам нужно связать свой «установить ID» с учетной записью
 пользователя asciinema.org. Эта команда отображает URL, чтобы открыть в
 веб-браузере, чтобы сделать это. Возможно, вам придется сначала войти в систему.
 Установить ID является случайным ID
 (UUID v4 (https://ru.wikipedia.org/wiki/Universally_unique_identifier)
 генерируется локально, когда вы запускаете asciinema для первого время, и
 сохраненный на \$HOME/.config/asciinema/install-id Это цель состоит в том, чтобы
 подключить местную машину с загруженными записями, так что они могут позже быть
 связаны с аккаунтом asciinema.org. Таким образом, мы отключаем загрузку с
 создания учетной записи, позволяя им случиться в любом порядке.
 Примечание: Новый идентификатор установки генерируется на каждом аккаунте
 пользователя машины и системы, на котором вы используете asciinema, чтобы
 сохранить все записи под одним asciinema.org учетная запись вам нужно запустить
 asciinema auth на всех этих машинах.
 Примечание: версии asciinema до 2.0 запутанно называют установить ID как
 “API token”.
\e[32m asciinema auth first.cast\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 30)D;echo -en "\e[47;30m";(E30);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mAsciinema Описание утилиты asciinema.
 Запись терминальной сессии, воспроизведение в терминале и в веб-браузере
 asciinema:  \e[36m https://asciinema.org/a/651030/\e[0m
 codeberg:   \e[36m https://codeberg.org/Grannik/mAsciinema\e[0m
 github:     \e[36m \e[0m
 gitlab:     \e[36m \e[0m
 sourceforge:\e[36m \e[0m
 notabug:    \e[36m \e[0m
 bitbucket:  \e[36m \e[0m
 gitea:      \e[36m \e[0m
 gogs:       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 31)D;echo -en "\e[47;30m";(E31);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
# https://www.youtube.com/watch?v=EL_vCCki4d4
