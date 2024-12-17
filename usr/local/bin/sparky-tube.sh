#!/bin/bash
#
# Created by Elton 2019/01/24
# Contributors: Elton, pavroo, Sajmon, Fernando Souza
#
# Last update 2024/12/03 by Fernando Souza - https://www.youtube.com/@fernandosuporte
# Last update 2024/07/30 by pavroo
#
# License: GNU GPL 3 


# Sparky Tube

# 2019/01/29 por pavroo

# O que é Sparky Tube?

# Sparky Tube baixa um arquivo de vídeo de um site e o converte em um arquivo de saída de áudio ou vídeo.

# Recursos:
# – baixa um vídeo de um site
# – converte para um formato de áudio: acc, flac, mp3, m4a, opus, ogg vorbis, wav; ou
# – converte para um formato de vídeo: avi, mkv, mp4
# – armazena o arquivo de áudio ou vídeo convertido em seu disco local
# – permite que você reproduza o arquivo convertido usando seu reprodutor de áudio ou vídeo padrão
# – pequeno e leve – usa Yad como sua GUI

# O repositório git do Sparky Tube: github.com/sparkylinux/sparky-tube
# O aplicativo foi criado pelo membro da nossa comunidade Elton Fabricio Ferreira.


# Script internacionalizado (Português do Brasil, Inglês, Espanhol...)

# Criar arquivos de tradução (pot e mo).

# https://sparkylinux.org/sparky-tube/



# Testar https://www.youtube.com/watch?v=ndQr-rXGbdo


# Certifique-se de testar a parte de reprodução de vídeos e áudio em diferentes condições 
# e garanta que os reprodutores configurados em PLAYER existam no sistema.


# Esse script melhorado facilita o processo de baixar vídeos ou áudios de plataformas como o YouTube, com uma interface gráfica amigável para interagir com o usuário. Certifique-se de ter as dependências necessárias e de personalizar os caminhos e configurações conforme suas necessidades.



# https://github.com/tuxslack/sparky-tube/blob/master/7/bin/sparky-tube

# https://wiki.sparkylinux.org/doku.php/start


# ----------------------------------------------------------------------------------------

# Definindo as variáveis:


# Verificando se as pastas existe

pasta_logo="/usr/share/pixmaps"


# Uso de variáveis de caminho absoluto: Em vez de repetir caminhos absolutos 
# como /usr/share/locale/..., é mais eficaz usar variáveis para os caminhos base, 
# facilitando futuras mudanças.

LANGUAGE_FILES="/usr/share/locale"



# Caminho para o logo e para a pasta


logo="$pasta_logo/sparky-tube.svg"



pasta="/"




TITLETEXT="Sparky Tube"
SIZE="500"
TITLETEXTV="Sparky Tube Video"
TITLETEXTA="Sparky Tube Audio"


# MUSICSAVEPATH=$(xdg-user-dir MUSIC)
MUSICSAVEPATH=`echo $HOME`

# VIDEOSAVEPATH=$(xdg-user-dir VIDEOS)
VIDEOSAVEPATH=`echo $HOME`


URL=""




# ----------------------------------------------------------------------------------------

# Configurar o locale


# Define o diretório onde estão os arquivos .mo

# Define o idioma para a execução do script. Isso indica que o script deve usar as traduções em português (Brasil).

# Definir a localização para português brasileiro


# Para garantir que o gettext funcione corretamente, você precisa garantir que o sistema 
# saiba qual idioma usar. Defina as variáveis de ambiente para o idioma correto.

# export LANG=$LANG
# export LC_MESSAGES=$LANG

# ----------------------------------------------------------------------------------------

# Para testar outros idiomas

# export LANG=pt_BR
# export LANG=pt_PT
# export LANG=en_US
# export LANG=de_DE
# export LANG=es_ES
# export LANG=el_GR
# export LANG=fi_FI
# export LANG=fr_FR
# export LANG=hu_HU
# export LANG=it_IT
# export LANG=ja_JP
# export LANG=pl_PL
# export LANG=ru_RU
# export LANG=uk_UA

# ----------------------------------------------------------------------------------------


# Função para exibir mensagens de erro

# Função show_error: Centraliza as mensagens de erro, evitando duplicação de código.


show_error() {

    local title="$1"
    local message="$2"

    yad \
        --center \
        --window-icon "$logo" \
        --image=dialog-error \
        --title="$title" \
        --text="$message" \
        --buttons-layout=center \
        --button="$(gettext 'OK'):0" \
        --width="700" --height="100" \
        2>/dev/null

}


# ----------------------------------------------------------------------------------------


# export TEXTDOMAIN=sparky-tube: Especifica que o domínio de tradução é "sparky-tube", que corresponde ao arquivo .mo (sem a extensão .mo).
export TEXTDOMAIN="sparky-tube"



# Verifica se a pasta existe

if [ ! -d "$LANGUAGE_FILES" ]; then

    # Traduzir a string formatada com gettext

    message_pasta=$(gettext "Folder %s not found. Check the path.")


    # Formatar a mensagem com a variável $logo substituindo o %s

    message_pasta=$(printf "$message_pasta" "$LANGUAGE_FILES")


    show_error "$TITLETEXT" "$message_pasta"


    exit 1

else

# export TEXTDOMAINDIR=./locales: Define o diretório onde o gettext procurará os arquivos de tradução (diretório locales).
export TEXTDOMAINDIR="$LANGUAGE_FILES"

fi


# ----------------------------------------------------------------------------------------


clear

# Obter arquivo de localidade padrão

  cd "$pasta"




check_language() {

    local lang_file="$1"
    local title="$2"
    local error_msg="$3"

    # Adicionar uma verificação para garantir que o arquivo de idioma existe.

    if [ -f "$lang_file" ]; then

        # Carregar configurações do arquivo
        # source "$lang_file"

        echo "$(gettext 'Language'): $LANG..."

    else

        echo -e "$error_msg"

        yad --center --window-icon "$logo" --image=dialog-error --title="$title" --text="$error_msg" --buttons-layout=center --button="$(gettext 'OK'):0" # 2>/dev/null

        exit 1

    fi

}


# Verificar idioma

case "$LANG" in


    pt_BR*) check_language "usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube.mo" "Aviso"        "\n\nArquivo de idioma não encontrado para $LANG em $LANGUAGE_FILES/pt_BR/LC_MESSAGES/ \n\n" ;;    # Português do Brasil
    pt_PT*) check_language "usr/share/locale/pt_PT/LC_MESSAGES/sparky-tube.mo" "Aviso"        "\n\nFicheiro de idioma não encontrado para $LANG em $LANGUAGE_FILES/pt_PT/LC_MESSAGES/ \n\n" ;;   # Português (Portugal)
    en_US*) check_language "usr/share/locale/en_US/LC_MESSAGES/sparky-tube.mo" "Notice"       "\n\nLanguage file not found for $LANG in $LANGUAGE_FILES/en_US/LC_MESSAGES/ \n\n" ;;              # Inglês dos Estados Unidos
    de_DE*) check_language "usr/share/locale/de/LC_MESSAGES/sparky-tube.mo"    "Beachten"     "\n\nSprachdatei für $LANG in $LANGUAGE_FILES/de/LC_MESSAGES/ nicht gefunden \n\n" ;;              # Alemão da Alemanha
    es_ES*) check_language "usr/share/locale/es_ES/LC_MESSAGES/sparky-tube.mo" "Aviso"        "\n\nNo se encontró el archivo de idioma para $LANG en $LANGUAGE_FILES/es_ES/LC_MESSAGES/ \n\n" ;; # Espanhol da Espanha
    el_GR*) check_language "usr/share/locale/el/LC_MESSAGES/sparky-tube.mo"    "Ανακοίνωση"   "\n\nΔεν βρέθηκε το αρχείο γλώσσας για $LANG στο $LANGUAGE_FILES/el/LC_MESSAGES/ \n\n" ;;          # Grego como falado na Grécia.
    fi_FI*) check_language "usr/share/locale/fi/LC_MESSAGES/sparky-tube.mo"    "Huomaa"       "\n\nKielitiedostoa ei löydy $LANG:lle hakemistosta $LANGUAGE_FILES/fi/LC_MESSAGES/ \n\n" ;;       # Finlandês
    fr_FR*) check_language "usr/share/locale/fr/LC_MESSAGES/sparky-tube.mo"    "Avis"         "\n\nFichier de langue introuvable pour $LANG dans $LANGUAGE_FILES/fr/LC_MESSAGES/ \n\n" ;;        # Francês da França
    hu_HU*) check_language "usr/share/locale/hu/LC_MESSAGES/sparky-tube.mo"    "Értesítés"    "\n\nA $LANG nyelvi fájl nem található a $LANGUAGE_FILES/hu/LC_MESSAGES/  könyvtárban\n\n" ;;      # Húngaro
    it_IT*) check_language "usr/share/locale/it/LC_MESSAGES/sparky-tube.mo"    "Avviso"       "\n\nFile di lingua non trovato per $LANG in $LANGUAGE_FILES/it/LC_MESSAGES/ \n\n" ;;              # Italiano
    ja_JP*) check_language "usr/share/locale/ja/LC_MESSAGES/sparky-tube.mo"    "知らせ"         "\n\n$LANGUAGE_FILES/ja/LC_MESSAGES/ に $LANG の言語ファイルが見つかりません \n\n" ;;                     # Japonês
    pl_PL*) check_language "usr/share/locale/pl/LC_MESSAGES/sparky-tube.mo"    "Ogłoszenie"   "\n\nNie znaleziono pliku językowego dla $LANG w $LANGUAGE_FILES/pl/LC_MESSAGES/ \n\n" ;;          # Polonês
    ru_RU*) check_language "usr/share/locale/ru/LC_MESSAGES/sparky-tube.mo"    "Уведомление"  "\n\nЯзыковой файл для $LANG не найден в $LANGUAGE_FILES/ru/LC_MESSAGES/ .\n\n" ;;                 # Russo
    uk_UA*) check_language "usr/share/locale/uk/LC_MESSAGES/sparky-tube.mo"    "Повідомлення" "\n\nМовний файл для $LANG не знайдено в $LANGUAGE_FILES/uk/LC_MESSAGES/ \n\n" ;;                  # Ucraniano



    *) 
        clear

        # Inglês dos Estados Unidos (padrão)

        # source "usr/share/locale/en_US/LC_MESSAGES/sparky-tube"

       echo "$(gettext 'Unidentified language... returned'): $LANG"

       echo "$(gettext 'Using language'): en_US"


       export LANG=en_US.UTF8

       # export LANG=es_ES.UTF8


       # Para altera o idioma no Void Linux:

       # xdg-open /etc/default/libc-locales 

       # xdg-open /etc/locale.conf

       # xbps-reconfigure -f glibc-locales

# Exemplo:

# xbps-reconfigure -f glibc-locales
# glibc-locales: configuring ...
# Generating GNU libc locales...
#   en_US.UTF-8... done.
#   es_ES.UTF-8... done.
#   pt_BR.UTF-8... done.
# glibc-locales: configured successfully.


       # locale -a

      ;;

esac

# ----------------------------------------------------------------------------------------


cd "$HOME"


# ----------------------------------------------------------------------------------------



# Verificando se a pasta existe


if [ ! -d "$pasta_logo" ]; then


# Traduzir a string formatada com gettext
message_pasta=$(gettext "Folder %s not found. Check the path.")

# Formatar a mensagem com a variável $logo substituindo o %s

message_pasta=$(printf "$message_pasta" "$pasta_logo")

show_error "$TITLETEXT" "$message_pasta"

    exit 1
fi





# Verifica se o logo existe

if [ ! -f "$logo" ]; then


# Formatar a string com a variável $logo e traduzir

# Traduz a mensagem e substitui %s pelo valor de $logo 

# Traduz a string e substitui o %s pela variável $logo


# O problema que você está enfrentando ocorre porque o comando gettext não consegue lidar diretamente com variáveis dentro da string. Quando você passa a variável $logo diretamente para o gettext na forma que você escreveu, ele não vai substituí-la como você espera.

# O comando gettext faz a tradução da string exata que você passar para ele, sem processar as variáveis. 



# Substitua %s pela variável $logo na string

# A mensagem com a variável $logo


message_logo=$(gettext "Logo not found at %s. Check path.")

# Formatar a mensagem com a variável $logo substituindo o %s

message_logo=$(printf "$message_logo" "$logo")


# Exibir a janela com yad
# Exibir a mensagem traduzida


    show_error "$TITLETEXT" "$message_logo"

    # Finaliza o script

    exit 1
fi


# ----------------------------------------------------------------------------------------


infor(){


# Informações gerais sobre o sistema


# echo -e "\n       ############################################################"

# echo -e "\e[31;1m\n                                 $TITLETEXT\n\e[m"

# echo -e "\e[32;1m                Sistema: \e[31;1m$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | sed 's/"//g') \e[m"

# echo -e "\e[32;1m                Versão do kernel: \e[31;1m$(uname -r) \e[m"

# echo -e "\e[32;1m                Arquitetura do processador: \e[31;1m$(uname -m) \e[m"

# echo -e "\e[32;1m                Versão do yt-dlp: \e[31;1m$(yt-dlp --version) \e[m"



# echo -e "\n       ############################################################ \n"



echo -e "\n       ############################################################"

echo -e "\n                                 $TITLETEXT\n"

echo -e "                $(gettext 'System'): $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | sed 's/"//g') "

echo -e "                $(gettext 'Kernel version'): $(uname -r) "

echo -e "                $(gettext 'Processor Architecture'): $(uname -m) "

echo -e "                $(gettext 'YT-DLP Version'): $(yt-dlp --version) "

echo -e "

                $(gettext 'The languages ​​currently supported by the program are'):

                en_GB,$(find $LANGUAGE_FILES/ -iname sparky-tube.mo | cut -d/ -f5 | paste -d, -s - - | fold -s -w 80)

"

echo -e "\n       ############################################################ \n"


}


# ----------------------------------------------------------------------------------------

# Verificação de dependências: 


# Função check_command: Verifica de maneira simplificada se os comandos essenciais estão instalados.


# A verificação do programa deve sugerir ao usuário a instalação de programas ausentes em vez de simplesmente fechar o programa.


# you-get é uma ferramenta de linha de comando escrita em Python, usada para baixar vídeos 
# e áudios de sites como YouTube, Vimeo, Dailymotion e muitos outros. Ele permite que você 
# baixe conteúdos multimídia de forma simples e eficaz diretamente do terminal.

# O que o you-get faz:

#     Baixar vídeos e áudios de uma grande variedade de sites, principalmente plataformas de vídeo.
#     Extrair o conteúdo em diferentes formatos, como MP4, FLV, WebM, MP3, etc.
#     Baixar playlists do YouTube e de outros sites compatíveis.
#     Não requer navegador, tudo é feito via linha de comando, com base na URL do vídeo.



# Melhor uso de testes de comando: Em vez de testar os programas com which ou pgrep 
# diretamente, podemos criar uma função para isso, simplificando o código.


# Verifica se o comando está instalado

check_command() {

    local cmd="$1"
    local msg="$2"

    which "$cmd" 1>/dev/null 2>/dev/null || {
        yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons \
            --title "$(gettext 'Notice')" --text "$msg" --width="450" --height="100" 2>/dev/null
        exit
    }

}



# Verificando se os comandos necessários estão instalados

# check_command "you-get"     "$(gettext 'You-get program is not installed.')"
check_command "yt-dlp"      "$(gettext 'yt-dlp program is not installed.')"
check_command "ffplay"      "$(gettext 'ffplay program is not installed.')"
check_command "curl"        "$(gettext 'Curl program is not installed.')"
check_command "notify-send" "$(gettext 'Notify-send program is not installed.')"
check_command "sed"         "$(gettext 'Sed program is not installed.')"
check_command "ping"        "$(gettext 'Ping program is not installed.')"
check_command "find"        "$(gettext 'find program is not installed.')"


# ----------------------------------------------------------------------------------------

# Verificação de processos antes de matar:

# O uso de 1>/dev/null 2>/dev/null pode ser melhorado, dependendo do seu objetivo e do 
# contexto em que você está utilizando. O redirecionamento 1>/dev/null 2>/dev/null 
# basicamente silencia tanto a saída padrão (stdout) quanto a saída de erro (stderr), o 
# que pode ser útil em muitos casos, mas também pode ser otimizado para fins de depuração, 
# monitoramento ou controle de logs.

# 1>/dev/null 2>/dev/null:

# Esse comando redireciona tanto a saída padrão (stdout) quanto a saída de erro (stderr) para o /dev/null, ou seja, silencia ambos os tipos de saída.

# Explicando:

#     1>/dev/null redireciona a saída padrão (stdout) para /dev/null, que é um "buraco negro" para dados — ou seja, ele descarta qualquer saída que seja direcionada para lá.
#     2>/dev/null redireciona a saída de erro (stderr) para /dev/null, também descartando qualquer mensagem de erro gerada pelo comando.


# Aqui, &>/dev/null faz o redirecionamento de ambas as saídas (stdout e stderr) para /dev/null de maneira compacta.

#   Equivalente a:

#   command 1>/dev/null 2>/dev/null



# Função kill_if_running: Matar processos yt-dlp ou you-get de forma modular.


# Verifica se o yt-dlp ou you-get está rodando e mata o processo se necessário

kill_if_running() {

    local process="$1"

    if pgrep -x "$process" > /dev/null; then

        killall "$process" &>/dev/null

    else

        echo -e "\n$(gettext 'No '$process' processes found.')" 1>&2

    fi

}

kill_if_running "yt-dlp"
kill_if_running "you-get"


# ----------------------------------------------------------------------------------------

# you-get


# instalacao(){

# Instalação no Void Linux do you-get

# source  /opt/python/bin/activate

# (python) root@Void:# pip install you-get


# }



# Versão do you-get

# versao_youget(){


# you-get --version

# you-get: version 0.4.1650, a tiny downloader that scrapes the web.


# ou

# /opt/python/bin/you-get --version
# you-get: version 0.4.1730, a tiny downloader that scrapes the web.


# }



# Baixando conteúdo com o you-get

# baixar_usando_you-get(){


# you-get https://www.youtube.com/watch?v=ndQr-rXGbdo


# Baixar uma playlist do YouTube:

# Você também pode baixar playlists inteiras. Para isso, passe o link da playlist:

# you-get https://www.youtube.com/playlist?list=PLAYLIST_ID


# Especificar a qualidade:

# Você pode selecionar qual qualidade de vídeo ou áudio deseja baixar. Para isso, use a opção -i para ver todas as resoluções disponíveis.

# you-get -i https://www.youtube.com/watch?v=VIDEO_ID



#     Isso mostrará todas as opções de qualidade. Para baixar uma resolução específica, utilize a opção -o (output) e o número correspondente à qualidade desejada.

# Baixar apenas o áudio:

#     Para baixar apenas o áudio de um vídeo, você pode usar a opção -t:

#         you-get -t https://www.youtube.com/watch?v=VIDEO_ID

# Passo 3: Opções avançadas

# O you-get também oferece outras opções úteis, como:

#     Baixar para um diretório específico: Para salvar o conteúdo em um diretório específico, use a opção -o seguida do caminho da pasta:

# you-get -o /caminho/para/pasta https://www.youtube.com/watch?v=VIDEO_ID


# Baixar conteúdo sem interação (modo silencioso): Para baixar sem mostrar informações adicionais durante o processo, utilize a opção -q (quiet):

# you-get -q https://www.youtube.com/watch?v=VIDEO_ID

# Ver detalhes de um vídeo sem fazer o download: Se você quiser apenas ver detalhes sobre o vídeo, como tamanho e qualidade, sem fazer o download, use a opção -i:

#     you-get -i https://www.youtube.com/watch?v=VIDEO_ID

# Exemplos de uso

#     Baixar vídeo:

# you-get https://www.youtube.com/watch?v=abcd1234

# Baixar áudio de um vídeo:

# you-get -t https://www.youtube.com/watch?v=abcd1234

# Baixar vídeo em uma qualidade específica:

# you-get -i https://www.youtube.com/watch?v=abcd1234

# Baixar uma playlist inteira:

#     you-get https://www.youtube.com/playlist?list=PL1234567890abcdef

# Considerações finais

# O you-get é uma ferramenta poderosa e simples para baixar conteúdo da web, especialmente útil para quem deseja obter vídeos e músicas de várias plataformas sem precisar de programas complexos. Lembre-se de que o uso de ferramentas de download deve estar em conformidade com as leis de direitos autorais e os termos de serviço dos sites de onde o conteúdo é retirado.



# }



# ----------------------------------------------------------------------------------------

# Função para verificar se o usuário está conectado à internet


check_internet() {

    # clear

    echo -e "\n$(gettext 'Checking if user is connected to the internet...') \n"


    # Usando o comando "ping" para verificar a conectividade com o Google DNS (8.8.8.8)


    # if ping -c 1 8.8.8.8 &> /dev/null; then

    #    echo "$(gettext 'Connected to the Internet')"
    #    return 0
    #  else

    #    echo "$(gettext 'No Internet Access')"
    #    return 1

    # fi


# O comando ping -c 1 8.8.8.8 irá funcionar, mesmo que o servidor DNS não esteja configurado no sistema.
# 
# Explicação do comando:
# 
#     ping: O comando ping é usado para testar a conectividade de rede entre o seu sistema e um destino (neste caso, o IP 8.8.8.8).
#     -c 1: A opção -c limita o número de pacotes enviados. No caso, ele enviará apenas 1 pacote de solicitação ICMP (ping).
#     8.8.8.8: Este é o endereço IP de um servidor DNS público do Google. O comando está tentando fazer um teste de conectividade com esse IP.
# 
# ping -c 1 8.8.8.8 &> /dev/null
# 
# 
# O ideal é verificar se o servidor DNS esta configurado no sistema.



    if ! ping -c 1 www.google.com &> /dev/null; then

        echo "$(gettext 'No Internet Access')"

        return 1 # Retorna 1 se não tiver acesso à internet

    else

        return 0 # Retorna 0 se tiver acesso à internet

    fi


}



# Verifica a conexão com a internet e armazena o resultado

# if check_internet; then

#    Quando estiver com internet

#    yad --center --info  --title="Status da Internet" --text="Você está conectado à Internet!"      --buttons-layout=center  --button="$(gettext 'OK')" --width="$SIZE"  2>/dev/null

# else

#     yad --center --error --title="Status da Internet" --text="$(gettext 'You are not connected to the Internet!')"  --buttons-layout=center  --button="$(gettext 'OK')" --width="$SIZE"  2>/dev/null

#     exit 

# fi



# Verifica a conectividade e exibe a mensagem com yad, caso o acesso à Internet esteja ausente

# Verificar se o usuário está sem acesso à Internet

if ! check_internet; then

    # Exibir o yad se estiver sem acesso

    yad --center --error --title="$(gettext 'No Internet Access')" --window-icon="$logo" --image="dialog-error"  --text="$(gettext 'You are not connected to the Internet!')" --buttons-layout=center --button="$(gettext 'OK')" --width="$SIZE"  2>/dev/null

    clear

    exit 1  # Sai com código de erro para indicar sem internet

fi

# ----------------------------------------------------------------------------------------


# Função de Ajuda

# A função ajuda está apenas exibindo uma janela de informação.


ajuda(){

# Com problema no Yad abaixo:

# Copyright (C) 2019-2024 Elton Fabricio Ferreira & Pawex Pijanowski Colaboradores: Elton, Pawex, Sajmon

# Não adicionar o botão Cancelar


# ----------------------------------------------------------------------------------------


# Traduzir o texto longo com gettext por partes (esta funcionando)


message_text=$(gettext "Sparky Tube downloads a video file from a website and converts it into an audio or video output file.")

message_text+="\n\n$(gettext "This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License.")"

message_text+="\n\n$(gettext "as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.")"

message_text+="\n\n$(gettext "This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty")"

message_text+="\n\n$(gettext "of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.")"

message_text+="\n\n$(gettext "You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.")"


# Usar gettext para traduzir o texto grande


# O gettext não esta reconhecendo o uso de \n (quebra de linha) dentro da string de tradução.

# Gettext is not recognizing the use of \n (line break) within the translation string.


# ----------------------------------------------------------------------------------------


# echo -e "$message_text"




yad \
--center \
--info \
--window-icon="$logo" \
--title="$(gettext 'Help')" \
--text="$message_text" \
--buttons-layout=center \
--button="$(gettext 'OK'):0" \
--fixed \
--height="300" \
--width="500"  \
2>/dev/null




# Verifica qual botão foi pressionado

if [ $? -eq 252 ]; then

    clear

    exit

fi



}


# ----------------------------------------------------------------------------------------

# Inicializa a lista com o player ffplay


# Inicialização de PLAYERSLIST:

# A variável PLAYERSLIST é inicializada com o valor "ffplay".

PLAYERSLIST="ffplay"



# Lista os players instalados


# Loop de players instalados:

# O loop percorre uma lista de players e verifica, com o comando which, se o player está instalado. Se o player estiver disponível, ele é adicionado à variável PLAYERSLIST.


for i in celluloid gmplayer kmplayer mpv QMPlay2 rage smplayer mplayer totem vlc xine qmmp-1 parole; do

    if which "$i" &>/dev/null; then

        PLAYERSLIST+=",${i}"

    fi

done




# null

# Em muitas linguagens, isso é utilizado de forma similar a null para indicar a ausência 
# de um valor. É comumente utilizado em tipos de dados opcionais ou para indicar que um 
# valor é esperado, mas não foi fornecido.


# A palavra $(gettext 'None') é adicionada ao final da variável PLAYERSLIST.

PLAYERSLIST+=",$(gettext 'None')"



# Remoção da vírgula inicial:

# Remover a vírgula inicial, se houver

# Se houver uma vírgula no início da lista, ela será removida com a expressão 

PLAYERSLIST="${PLAYERSLIST#,}"



# Para organizar o conteúdo do array PLAYERSLIST em ordem alfabética, você pode usar o 
# comando sort no Bash. Isso garante que a lista de players seja ordenada antes de ser 
# usada.


# Organizar a lista PLAYERSLIST em ordem alfabética

PLAYERSLIST=$(echo "$PLAYERSLIST" | tr ',' '\n' | sort | tr '\n' ',' | sed 's/,$//')

# Exibe a lista final

# echo "$PLAYERSLIST"



# ----------------------------------------------------------------------------------------


#### Essa parte não recebeu tradução para outros idiomas ####


# Função para obter o nome do arquivo


# O problema pode ocorrer se a variável FILE contiver caracteres especiais, como espaços, 
# acentos ou outros símbolos não alfanuméricos, que precisam ser tratados adequadamente.


# _getFileName() {

    # Usando a opção '--no-playlist' e '--output' do yt-dlp para pegar o nome do arquivo sem a playlist

#     FILE=$(yt-dlp --no-playlist -o '%(title)s.%(ext)s' -es "$URL" 2>/dev/null)

    # Substituir os caracteres '&' e '?' com segurança
#     PLAYLISTITLE=$(echo "$FILE" | sed 's/&/\&amp;/g; s/?//g')
# }



_getFileName() {

    # Usando a opção '--no-playlist' e '--output' do yt-dlp para pegar o nome do arquivo sem a playlist

    FILE=$(yt-dlp --no-playlist -o '%(title)s.%(ext)s' -es "$URL" 2>/dev/null)


    # Verificar se o yt-dlp retornou um nome de arquivo válido

    if [ -z "$FILE" ]; then

        echo "Erro: Nome do arquivo não encontrado!"

        return 1

    fi

    # Substituir os caracteres '&' por '&amp;' e remover o caractere '?'

    PLAYLISTITLE=$(echo "$FILE" | sed 's/&/\&amp;/g; s/?//g')


    # Garantir que o nome do arquivo gerado seja seguro para uso

    PLAYLISTITLE=$(echo "$PLAYLISTITLE" | sed 's/[^a-zA-Z0-9._-]/_/g')


    # Exibir o nome final do arquivo (opcional para debug)

    echo "Nome final do arquivo: $PLAYLISTITLE"
}


# ----------------------------------------------------------------------------------------


# Função para mostrar informações do sistema

# Informações sobre o sistema


show_info() {


    clear

   # Chama a função infor

   infor > /tmp/infor.log

   yad --center --title="$(gettext 'System') - $TITLETEXT" --window-icon="$logo" --text-info --filename="/tmp/infor.log" --buttons-layout=center --button=$(gettext 'OK'):0 --width="700" --height="400" 2>/dev/null 

   rm -Rf /tmp/infor.log

    # exit

    # echo -e "\n############################################################"
    # echo -e "\n                                 $TITLETEXT\n"
    # echo -e "                $(gettext 'System'): $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | sed 's/"//g')"
    # echo -e "                $(gettext 'Kernel version'): $(uname -r)"
    # echo -e "                $(gettext 'Processor Architecture'): $(uname -m)"
    # echo -e "                $(gettext 'YT-DLP Version'): $(yt-dlp --version)"
    # echo -e "\n############################################################\n"


}


# ----------------------------------------------------------------------------------------





# Função para processar o URL


process_url() {


# ----------------------------------------------------------------------------------------

# Separando as variáveis com base na entrada do usuário


# Formatação de strings e uso do cut

# O uso do cut para separar valores pode ser arriscado se os dados contiverem caracteres inesperados. Em alguns casos, você pode usar um método mais seguro para extrair as variáveis.
# Correção:

# Usar a formatação de strings com o awk para maior clareza.

# URL=$(echo "$YOUDOWN" | awk -F'|' '{print $1}')
# PLAYER=$(echo "$YOUDOWN" | awk -F'|' '{print $3}')



# ----------------------------------------------------------------------------------------

# Mostra os campos sem a extração

# Ex: https://www.youtube.com/watch?v=xxxxxxxxxxx&|audio:mp3|FALSE|TRUE|ffplay|


# echo "$YOUDOWN"

# ----------------------------------------------------------------------------------------

# Extração dos campos

URL=$(echo "$YOUDOWN" | cut -d'|' -f1)                          # URL
PLAYFORMAT=$(echo "$YOUDOWN" | cut -d'|' -f2 | cut -d: -f2)     # Escolha um formato de áudio ou de vídeo

#av players
PLAYER=$(echo $YOUDOWN | cut -d'|' -f3)                         # Reproduzir depois que baixar   
 
PLAY=$(echo "$YOUDOWN" | cut -d'|' -f4)                         # Baixar Playlist               
PLAYLST=$(echo "$YOUDOWN" | cut -d'|' -f5)                      # Reprodutor de mídia


# AVFORMAT=$(echo "$YOUDOWN" | cut -d'|' -f3 | cut -d: -f1)  

#audio / video
AVFORMAT=$(echo "$YOUDOWN" | cut -d'|' -f2 | cut -d: -f1)


# ----------------------------------------------------------------------------------------

# Formatação para a notificação


if [ "$PLAYER" == "TRUE" ]; then

    PLAYER_STATUS="$(gettext 'Yes')"

else

    PLAYER_STATUS="$(gettext 'No')"

    # Se "Reproduzir depois que baixar" for falso limpa a variavel $PLAYLST que corresponde ao "Reprodutor de mídia"

    # PLAYLIST=""


    # unset PLAYLIST # Se você quiser remover completamente a variável do ambiente (torná-la indefinida), pode usar o comando unset.

    # Após executar unset, a variável $PLAYLIST não existirá mais no seu ambiente de 
    # shell. Se você tentar acessá-la depois de removê-la com unset, ela não terá valor 
    # e pode causar um erro ou retornar vazio, dependendo de como você a utiliza.


fi


if [ "$PLAY" == "TRUE" ]; then

    PLAY_STATUS="$(gettext 'Yes')"

else

    PLAY_STATUS="$(gettext 'No')"

fi


if [ "$AVFORMAT" == "TRUE" ]; then

    AVFORMAT_STATUS="$(gettext 'Yes')"

else

    AVFORMAT_STATUS="$(gettext 'No')"

fi

# ----------------------------------------------------------------------------------------

# Mostra as informações escolhecidas pelo usuário no terminal

echo "
# URL:                                                                 $URL
# $(gettext 'Choose an audio or video format'):                        $PLAYFORMAT                                      
# $(gettext 'Play after downloading'):                                 $PLAYER_STATUS 
# $(gettext 'Download Playlist'):                                      $PLAY_STATUS                 
# $(gettext 'Media Player'):                                           $PLAYLST 
"

# ----------------------------------------------------------------------------------------

# Verificando se a URL foi fornecida - Tradução não funcionando

if [ -z "$URL" ]; then

yad \
--center \
--image-on-top \
--title="$TITLETEXT" \
--window-icon="$logo" \
--image="$logo"  \
--info \
--text="\n$(gettext 'You have not entered any URL!   Exiting...')\n\n" --buttons-layout=center  --button=$(gettext 'OK'):0 \
--width="$SIZE" \
2>/dev/null 


# O gettext não esta reconhecendo o uso de \n (quebra de linha) dentro da string de tradução.

# Gettext is not recognizing the use of \n (line break) within the translation string.


	exit

fi



# ----------------------------------------------------------------------------------------

# Não usar o http:// ou https:// na $URL
# tem alguns link do youtube que nao pega url


# corrigi URL

# Verifica se o URL começa com http:// ou https://, caso contrário, adiciona https://

# if [[ ! "$URL" =~ ^http?:// ]]; then
#  URL="https://$URL"
# fi


# Executa o curl com o URL corrigido

# ----------------------------------------------------------------------------------------


# Enviando a notificação

notify-send -t 100000 -i "$logo" "$TITLETEXT..." "\n\n\
URL:                             $URL \n\
$(gettext 'Choose an audio or video format'):                        $PLAYFORMAT \n\
$(gettext 'Play after downloading'):                                 $PLAYER_STATUS \n\
$(gettext 'Download Playlist'):                                      $PLAY_STATUS  \n\
$(gettext 'Media Player'):                                           $PLAYLST   \n\
"

                                   
# ----------------------------------------------------------------------------------------

# Verificação de URL

# A verificação do status HTTP com curl 


# Isso retornará apenas o código de status HTTP (como 200, 404, etc.).

CHECKURL=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$CHECKURL" -ne 200 ]; then

    yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"   --info --text="$(gettext '\nThe URL you entered is invalid!\nPlease check and try again!\n\nExiting...')" --buttons-layout=center --button=$(gettext 'OK'):0 --width="$SIZE" 2>/dev/null

    exit 1

fi


# ----------------------------------------------------------------------------------------

# Obtendo o nome do arquivo

_getFileName



# Verificação de playlist

# Tratando URLs de listas

if echo "$URL" | grep -Eqs '&list' ; then
    FILE="$LOCAL24 $PLAYLISTITLE"

    # Ajuste do PLAYLISTITLE para tratar caracteres especiais

    if [ "$PLAYLST" != "playlist" ]; then
        PLAYLISTITLE=$(echo "$PLAYLISTITLE" | sed "s/\&/\'&amp;\'/g")
    fi
fi





# Verificação de sucesso do comando anterior

if [ $? -ne 0 ]; then

	yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="\n$(gettext 'ERROR'): $(gettext 'Unknown error.')" --button=$(gettext 'OK'):0 --width="$SIZE" 2>/dev/null

	exit 1
fi



# ----------------------------------------------------------------------------------------

# Para Verificar os Codecs com yt-dlp

# Para filtrar e exibir apenas os formatos de áudio e vídeo com yt-dlp, você pode usar o 
# comando yt-dlp -F "$URL" combinado com grep para filtrar as informações dos codecs de 
# áudio e vídeo.

# A melhor qualidade de áudio seria a opção 258 m4a com uma taxa de bits de 387k.



message_text=$(gettext "Audio quality is usually determined by the bit rate (the higher the bit rate, the better the quality).")

message_text+="\n\n$(gettext "For video quality, the main criteria are resolution and codec.")"


echo -e "\n\n$message_text\n\n"


yt-dlp -F "$URL" | grep -E 'video|audio'


# ----------------------------------------------------------------------------------------

# Definindo o formato do vídeo conforme a escolha do usuário

case "$PLAYFORMAT" in

    "avi") VIDEOFORM="bestvideo+bestaudio/best --recode-video avi" ;;
    "flv") VIDEOFORM="bestvideo+bestaudio/best --recode-video flv" ;;
    "mkv") VIDEOFORM="bestvideo+bestaudio/best --merge-output-format mkv" ;;
    "mp4") VIDEOFORM="bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best --merge-output-format mp4" ;;
    "ogg") VIDEOFORM="bestvideo+bestaudio/best --recode-video ogg" ;;

# Melhor áudio e vídeo em formatos separados: yt-dlp -f bestvideo+bestaudio "$URL"
# Melhor áudio e vídeo em um único arquivo:   yt-dlp -f best "$URL"

    *) VIDEOFORM="best" ;;

esac

# ----------------------------------------------------------------------------------------


# Baixando áudio


if [ "$AVFORMAT" = "audio" ]; then

    cd "$MUSICSAVEPATH"

    echo -e "\n$(gettext 'Downloading audio...')\n"

    notify-send "$(gettext 'Downloading audio...')" -t 40000 -i "$logo" "$(gettext 'Please wait while the audio is downloading.')" 



# Explicação:
# 
# -t 10000:   Define o tempo de exibição da notificação em milissegundos (40 segundos neste caso).
# 
# -i "$logo": Adiciona a imagem ou ícone à notificação. A variável $logo deve conter o caminho para o arquivo de imagem.



    # Variável para armazenar o último progresso

    last_progress=-1

    # Executa yt-dlp e verifica se ocorreu erro

    yt-dlp --rm-cache-dir $PLAYLISTOPT \
        -o '%(title)s.%(ext)s' \
        -x --audio-format $PLAYFORMAT \
        --newline --progress "$URL" 2>/dev/null | while read -r line; do
        
        # Captura o progresso em % da saída

        progress=$(echo "$line" | grep -oP '\d+(?=%)')

        # Atualiza a barra de progresso no yad se houver progresso válido e se houver mudança no progresso

        if [[ $progress =~ ^[0-9]+$ ]]; then
            if [ "$progress" -ne "$last_progress" ]; then
                last_progress=$progress
                yad --center --title="$TITLETEXTV" --window-icon="$logo" --image="$logo" \
                    --progress --pulsate --auto-close --no-buttons --auto-kill \
                    --text="\n$(gettext 'Downloading and Converting to:') audio:$PLAYFORMAT\n\n$(gettext 'Saving to'): $MUSICSAVEPATH\n\n$(gettext 'File name'):\n$FILE\n" \
                    --progress-text="$(gettext 'Please wait until complite...')" --percentage=$progress --width="$SIZE"
            fi
        fi
    done

    # Verificar o código de saída do yt-dlp para saber se houve erro

    if [ $? -ne 0 ]; then

        # Se o comando falhou, exibe uma mensagem de erro

        yad --center --window-icon="$logo" --image=dialog-error --timeout="10" --no-buttons \
            --title="$(gettext 'Notice')" --text="$LOCAL38" --width="450" --height="100"
    fi
fi



# ----------------------------------------------------------------------------------------

# Baixando vídeo





if [ "$AVFORMAT" = "video" ]; then

	cd "$VIDEOSAVEPATH"

    echo -e "\n$(gettext 'Downloading video...')\n"

    notify-send "$(gettext 'Downloading video...')" -t 40000 -i "$logo" "$(gettext 'Please wait while the video is downloading.')"


# Executa o comando yt-dlp e captura o código de saída

yt-dlp --rm-cache-dir $PLAYLISTOPT --newline -f $VIDEOFORM -o '%(title)s.%(ext)s' "$URL" | while read -r line; do

    # Verifica se a linha contém progresso e extrai o valor percentual

    if progress=$(echo "$line" | grep -oP '\d+(?=%)'); then

        # Se o progresso for válido, atualiza a barra de progresso no yad

        if [[ $progress =~ ^[0-9]+$ ]]; then

            yad --center --progress --pulsate --auto-close --no-buttons --auto-kill \
                --title="$TITLETEXTV" --window-icon="$logo" --image="$logo" \
                --width="$SIZE" \
                --text="\n$(gettext 'Downloading and Converting to:') video:$VIDEOFORM\n\n$(gettext 'Saving to'): $VIDEOSAVEPATH\n\n$(gettext 'File name'):\n$FILE\n" \
                --progress-text="$(gettext 'Please wait until complite...')" --percentage=$progress
        fi

    fi

done

# Verifica o código de saída de yt-dlp

if [[ $? -ne 0 ]]; then

    # Caso o yt-dlp tenha retornado erro, exibe uma mensagem de erro

    yad --center --window-icon="$logo"  --image=dialog-error --timeout="10" --no-buttons \
        --title="$(gettext 'ERROR')" --text="$(gettext 'Failed to download video. Please try again later.')" \
        --width="450" --height="100"

    exit
fi






fi


# ----------------------------------------------------------------------------------------


# Reproduzindo o arquivo, se necessário

# Problemas ao chamar o reprodutor de mídia


# if [ "$PLAY" = "TRUE" -a "$PLAYLST" = "TRUE" ]; then
#	FILE=$(yad --center --image-on-top --title="$TITLETEXT" $IMAGEV $SIZEDIR --form --text="$LOCAL8\n" --file-selection --file-filter='*.aac *.flac *.mp3 *.m4a *.opus *.ogg *.wav *.avi *.flv *.mkv *.mp4 *.ogg' | cut -d "|" -f1)
# [ -z $FILE ] && PLAY="FALSE"
# fi


# você tenta reproduzir o arquivo após o download, a variável PLAYER é definida, mas a chamada para reproduzir o arquivo (no final do script) não está funcionando corretamente.


# obter o arquivo selecionado pelo usuário precisa garantir que FILE está sendo tratado corretamente:

[ -z "$FILE" ] && PLAY="FALSE"

# Isso evita que o script tente reproduzir um arquivo inexistente.




# ----------------------------------------------------------------------------------------

# O usuário escolheu reproduzir depois de baixar


# Adiciona uma verificação para garantir que a variável $PLAYER está configurada corretamente para reproduzir o arquivo.

if [ "$PLAYER" = "TRUE" ]; then


# Verificar se tem o programa para ler o arquivo.

    if [ -z "$PLAYLST" ]; then

yad \
--center \
--image=dialog-error \
--title="$(gettext 'Notice')" \
--text="\n$(gettext 'No player configured.')\n" \
--buttons-layout=center \
--button="$(gettext 'OK'):0" \
2>/dev/null

        exit
    fi





# Verificar se o usuario uso $(gettext 'None') "Nenhum" na parte de reproduzir o arquivo de Vídeo/Aúdio

    if [ "$PLAYLST" == "$(gettext 'None')" ]; then

# yad \
# --center \
# --image=dialog-error \
# --title="$(gettext 'Notice')" \
# --text="\n$(gettext 'No player configured.')\n" \
# --buttons-layout=center \
# --button="$(gettext 'OK'):0" \
# 2>/dev/null



# Aspas Duplas Dentro de Aspas Duplas: Quando você quer incluir aspas duplas dentro de 
# uma string delimitada por aspas duplas, você precisa escapar as aspas internas com uma 
# barra invertida (\), ou seja, \".

echo -e "\n$(gettext "In \"Media Player\" was used: \"$PLAYLIST\"") \n"



else



     echo -e "\n$(gettext 'Playing Video/Audio file...')\n"

     # Mostra algo assim: 

     # qmmp-1 nome_do_arquivo.mp3


     # O PLAYER não esta abrindo arquivo com nome que tem acentos, espaço em branco e caracteres especiais Ex: "Vaso sanitário solto, o que fazer？.mkv"

     # The PLAYER is not opening a file with a name that has accents, white space and special characters

     # https://www.youtube.com/watch?v=boVy0oEqX3o


     echo   "$PLAYLST ${FILE%.*}.$PLAYFORMAT"


     "$PLAYLST" "${FILE%.*}.$PLAYFORMAT" 2>/dev/null &

# Mas se o PLAYER não estiver configurado corretamente ou se o arquivo não for encontrado, 
# isso causará um erro. O ideal é garantir que PLAYER esteja configurado para um reprodutor 
# válido, ou outro reprodutor que você tenha no sistema.


    fi



fi



# ----------------------------------------------------------------------------------------

# O usuário escolheu não reproduzir o vídeo depois de baixar

# Mensagem de erro se o arquivo não for reproduzido

if [ "$PLAY" = "FALSE" ]; then

	if [ "$AVFORMAT" = "audio" ]; then

		yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="${FILE%.*}.$PLAYFORMAT\n$(gettext 'Your audio has been successfully saved to'): $MUSICSAVEPATH" --buttons-layout=center --button=$(gettext 'OK'):0 --width="$SIZE" 2>/dev/null

	else

		yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="${FILE%.*}.$PLAYFORMAT\n$(gettext 'Your video has been successfully saved to'): $VIDEOSAVEPATH"  --buttons-layout=center --button=$(gettext 'OK'):0 --width="$SIZE" 2>/dev/null

	fi

    clear

fi


}

# ----------------------------------------------------------------------------------------




## old opts
## --no-playlist                        Baixar apenas o vídeo, se a URL
## -o, --output TEMPLATE                Modelo do nome do arquivo de saída, consulte a
## -e, --get-title                      Simular, silencioso, mas imprime o título
## -s, --simulate                       Não baixe o vídeo e não faça
##  --rm-cache-dir                      Excluir todos os arquivos de cache do sistema
## -x, --extract-audio                  Converter arquivos de vídeo para arquivos apenas de áudio
## --audio-format                       Código de formato de áudio
## --newline                            Exibir a barra de progresso em novas linhas
## -f, --format FORMAT                  Código de formato de vídeo



# Interface para baixar URL


# Problema (não separa arquivo de video e audio na tela do yad)

# Exibindo a interface gráfica e capturando a saída


FORMATS="audio:mp3,audio:aac,audio:flac,audio:m4a,audio:opus,audio:ogg,audio:wav,video:mp4,video:avi,video:flv,video:mkv,video:ogg"


# Função para exibir o menu principal

main_menu() {

# Construir a interface com yad

YOUDOWN=$(yad \
--center \
--image-on-top \
--title="$TITLETEXT" \
--text="\n$(gettext "Copy and paste the video address below:")\n" \
--window-icon="$logo" --image="$logo" --form --item-separator="," \
--field="<b>URL</b>:" \
--field="$(gettext 'Choose an audio or video format')":CBE \
--field="$(gettext "Play after downloading")":CHK \
--field="$(gettext 'Download Playlist')":CHK \
--field="$(gettext 'Media Player')":CBE \
"$URL" "$FORMATS"  "" "" "$PLAYERSLIST" \
--buttons-layout=center \
--button="$(gettext 'To go out'):1" \
--button="$(gettext 'Help'):2" \
--button="$(gettext 'Infor'):3" \
--button="$(gettext 'OK'):0" \
--width="700" --height="310" \
2>/dev/null)



# Estava abaixo do $(gettext 'Choose an audio or video format')

# --field="$LOCAL15":CBE \


# Estavaa na terceira coluna

# "video:mp4,video:avi,video:flv,video:mkv,video:ogg"


# ----------------------------------------------------------------------------------------

# Capture o status de saída do diálogo yad

RETVAL=$?

# Ações dependendo do botão pressionado


# Verifica qual botão foi pressionado



    case $RETVAL in
        2) ajuda && main_menu ;;      # Retorna ao menu principal após exibir ajuda
        3) show_info && main_menu ;;  # Retorna ao menu principal após exibir as informações
        1) clear && exit ;;           # Sai do programa
        0) process_url "$menu" ;;     # Processa o URL após confirmação do botão OK
    esac
}




# Removendo arquivos temporários

# rm -f *.part *.tmp

# ----------------------------------------------------------------------------------------


# Iniciar o menu principal
main_menu



exit 0

