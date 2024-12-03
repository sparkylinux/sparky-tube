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



# Certifique-se de testar a parte de reprodução de vídeos e áudio em diferentes condições 
# e garanta que os reprodutores configurados em PLAYER existam no sistema.


# ----------------------------------------------------------------------------------------

# Definindo variáveis:


# Caminho para o logo e a pasta


logo="/usr/share/pixmaps/sparky-tube.svg"


# /usr/share/sparky/sparky-tube/

pasta="/"


TITLETEXT="Sparky Tube"
SIZE="500"
TITLETEXTV="Sparky Tube Video"
TITLETEXTA="Sparky Tube Audio"


# MUSICSAVEPATH=$(xdg-user-dir MUSIC)
MUSICSAVEPATH=`echo $HOME`

# VIDEOSAVEPATH=$(xdg-user-dir VIDEOS)
VIDEOSAVEPATH=`echo $HOME`


clear


# ----------------------------------------------------------------------------------------

# Verificando se o arquivo de logo existe

if [ ! -f "$logo" ]; then
    echo "Logo não encontrado em $logo. Verifique o caminho." 
    exit 1
fi


# Verificando se a pasta existe

if [ ! -d "$pasta" ]; then
    echo "Pasta não encontrada em $pasta. Verifique o caminho."
    exit 1
fi

# ----------------------------------------------------------------------------------------


# Obter arquivo de localidade padrão

  cd "$pasta"




# Português do Brasil


if [[ "$LANG" == "pt_BR"* ]]
then

# Adicionar uma verificação para garantir que o arquivo de idioma existe.

if [ -f "usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube"
    exit 1
fi




# Inglês dos Estados Unidos

elif [[ "$LANG" == "en_US"* ]]
then


if [ -f "usr/share/locale/en_US/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/en_US/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em usr/share/locale/en_US/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Alemão da Alemanha

elif [[ "$LANG" == "de_DE"* ]]
then


if [ -f "usr/share/locale/de/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/de/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/de/LC_MESSAGES/sparky-tube"
    exit 1
fi



# Espanhol (Espanha)

elif [[ "$LANG" == "el_GR"* ]]
then


if [ -f "usr/share/locale/el/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/el/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/el/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Espanhol da Espanha

elif [[ "$LANG" == "es_ES"* ]]
then


if [ -f "usr/share/locale/es/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/es/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/es/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Finlandês

elif [[ "$LANG" == "fi_FI"* ]]
then


if [ -f "usr/share/locale/fi/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/fi/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/fi/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Francês da França

elif [[ "$LANG" == "fr_FR"* ]]
then


if [ -f "usr/share/locale/fr/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/fr/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/fr/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Húngaro

elif [[ "$LANG" == "hu_HU"* ]]
then




if [ -f "usr/share/locale/hu/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/hu/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/hu/LC_MESSAGES/sparky-tube"
    exit 1
fi

# Italiano

elif [[ "$LANG" == "it_IT"* ]]
then


if [ -f "usr/share/locale/it/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/it/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/it/LC_MESSAGES/sparky-tube"
    exit 1
fi


# Japonês

elif [[ "$LANG" == "ja_JP"* ]]
then


if [ -f "usr/share/locale/ja/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/ja/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/ja/LC_MESSAGES/sparky-tube"
    exit 1
fi



# Polonês

elif [[ "$LANG" == "pl_PL"* ]]
then


if [ -f "usr/share/locale/pl/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/pl/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/pl/LC_MESSAGES/sparky-tube"
    exit 1
fi



# Russo

elif [[ "$LANG" == "ru_RU"* ]]
then


if [ -f "usr/share/locale/ru/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/ru/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/ru/LC_MESSAGES/sparky-tube"
    exit 1
fi



# Ucraniano

elif [[ "$LANG" == "uk_UA"* ]]
then


if [ -f "usr/share/locale/uk/LC_MESSAGES/sparky-tube" ]; then

    # Carregar configurações do arquivo

    source usr/share/locale/uk/LC_MESSAGES/sparky-tube

    echo "$LOCAL33 $LANG..."
else
    echo "Arquivo de idioma não encontrado para $LANG em /usr/share/locale/uk/LC_MESSAGES/sparky-tube"
    exit 1
fi



else

  clear


# Inglês dos Estados Unidos (padrão)

  source usr/share/locale/en_US/LC_MESSAGES/sparky-tube

  echo "$LOCAL26 $LANG"

  echo "Using language: en_US"

  # exit

fi



cd ~/

# ----------------------------------------------------------------------------------------

# Verificação de dependências: 


# A verificação do programa deve sugerir ao usuário a instalação de programas ausentes em vez de simplesmente fechar o programa.

which yt-dlp   1>/dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "$LOCAL27" --text "$LOCAL28"   --width 450 --height 100  2>/dev/null   ; exit ; }
which ffplay   1>/dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "$LOCAL27" --text "$LOCAL29"   --width 450 --height 100  2>/dev/null   ; exit ; }
which curl     1>/dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "$LOCAL27" --text "$LOCAL30"   --width 450 --height 100  2>/dev/null   ; exit ; }

which notify-send         1> /dev/null 2> /dev/null || { echo "Programa notify-send não esta instalado."   ; exit ; }

which sed                 1> /dev/null 2> /dev/null || { echo "Programa sed não esta instalado."   ; exit ; }


# ----------------------------------------------------------------------------------------


# Função de Ajuda

# A função ajuda está apenas exibindo uma janela de informação.

ajuda(){

# Com problema no Yad abaixo:

# Copyright (C) 2019-2024 Elton Fabricio Ferreira & Pawex Pijanowski Colaboradores: Elton, Pawex, Sajmon

# Não adicionar o botão Cancelar

yad \
--center \
--info \
--title="$LOCAL31" \
--text="$LOCAL32" --button="Ok:0" \
2>/dev/null

}



# ----------------------------------------------------------------------------------------


PLAYERSLIST="ffplay"

# ----------------------------------------------------------------------------------------

# Para lista os playeres de vídeo instalados

for i in celluloid gmplayer kmplayer mpv QMPlay2 rage smplayer mplayer totem vlc xine parole ; do
	if [ ! -z $(which $i 2>/dev/null) ]; then
		PLAYERSLIST="$PLAYERSLIST,$i"
	fi
done

# ----------------------------------------------------------------------------------------

# Função para obter o nome do arquivo

_getFileName() {

    FILE=$(yt-dlp --no-playlist -o '%(title)s.%(ext)s' -es "$URL" | sed "s/\&/\'&amp;\'/;s/?//")

    PLAYLISTITLE=$FILE
}

# ----------------------------------------------------------------------------------------


## old opts
## --no-playlist                        Download only the video, if the URL
## -o, --output TEMPLATE                Output filename template, see the
# -e, --get-title                      Simulate, quiet but print title
## -s, --simulate                       Do not download the video and do not
##  --rm-cache-dir                       Delete all filesystem cache files
## -x, --extract-audio                  Convert video files to audio-only files
## --audio-format                       Audio format code
## --newline                            Output progress bar as new lines
## -f, --format FORMAT                  Video format code


# Exibindo a interface gráfica e capturando a saída

YOUDOWN=$(yad \
--center \
--image-on-top \
--title="$TITLETEXT" \
--text="$LOCAL2" \
--window-icon="$logo" --image="$logo" --form --item-separator="," \
--field="<b>URL</b>:" \
--field="$LOCAL14":CBE \
--field="$LOCAL15":CBE \
--field="$LOCAL18":CHK \
--field="$LOCAL25":CHK \
--field="Player":CBE \
"https://www.youtube.com/watch?v=ndQr-rXGbdo" "audio:mp3,audio:aac,audio:flac,audio:m4a,audio:opus,audio:ogg,audio:wav"  "video:mp4,video:avi,video:flv,video:mkv,video:ogg" "" "" "$PLAYERSLIST" \
--button="$LOCAL31":2 \
--button="OK":0 \
--width="$SIZE" \
2>/dev/null)





# Não usar o http:// ou https:// na $URL
# tem alguns link do youtube que nao pega url

# ----------------------------------------------------------------------------------------




# Verifica qual botão foi pressionado
if [ $? -eq 2 ]; then

    # Quando o botão "Ajuda" for pressionado, chama a função ajuda
    ajuda && exit

fi



# ----------------------------------------------------------------------------------------

# Separando as variáveis com base na entrada do usuário


# Formatação de strings e uso do cut

# O uso do cut para separar valores pode ser arriscado se os dados contiverem caracteres inesperados. Em alguns casos, você pode usar um método mais seguro para extrair as variáveis.
# Correção:

# Usar a formatação de strings com o awk para maior clareza.

# URL=$(echo "$YOUDOWN" | awk -F'|' '{print $1}')
# PLAYER=$(echo "$YOUDOWN" | awk -F'|' '{print $3}')


# URL
URL=$(echo "$YOUDOWN" | cut -d'|' -f1)

PLAYER=$(echo "$YOUDOWN" | cut -d'|' -f3)

# formato de vídeo
AVFORMAT=$(echo "$YOUDOWN" | cut -d'|' -f3 | cut -d: -f2)


# formato de áudio
PLAYFORMAT=$(echo "$YOUDOWN" | cut -d'|' -f2 | cut -d: -f2)


# Reproduzir depois que baixar

# reproduzir caixa de seleção verdadeiro/falso

PLAY=$(echo "$YOUDOWN" | cut -d'|' -f4)


# Baixar Playlist

PLAYLST=$(echo "$YOUDOWN" | cut -d'|' -f5)

# Reprodutor de áudio e vídeo

PLAYER=$(echo "$YOUDOWN" | cut -d'|' -f6 | cut -d: -f1)

# ----------------------------------------------------------------------------------------

# Verificando se a URL foi fornecida

if [ -z "$URL" ]; then

yad \
--center \
--image-on-top \
--title="$TITLETEXT" \
--window-icon="$logo" \
--image="$logo"  \
--info \
--text="\n$LOCAL16" --button=OK:0 \
--width="$SIZE" \
2>/dev/null 

	exit 1
fi


# ----------------------------------------------------------------------------------------

# corrigi URL

# Verifica se o URL começa com http:// ou https://, caso contrário, adiciona https://

# if [[ ! "$URL" =~ ^http?:// ]]; then
#  URL="https://$URL"
# fi


# Executa o curl com o URL corrigido

# ----------------------------------------------------------------------------------------

notify-send -t 100000 -i "$logo" \
"$TITLETEXT..."  "
# URL:                          $URL
# $LOCAL14  $PLAYFORMAT
# $LOCAL15  $AVFORMAT
# $LOCAL18: $PLAY
# $LOCAL25:              $PLAYLST
# Player:                       $PLAYER

"


# Idioma pt_BR.UTF-8...

# URL:                          https://www.youtube.com/watch?v=ndQr-rXGbdo
# Escolha um formato de áudio:  aac
# Escolha um formato de vídeo:  flv
# Reproduzir depois que baixar: TRUE
# Baixar Playlist:              TRUE
# Player:                       parole

# ----------------------------------------------------------------------------------------

# Verificação de URL

# A verificação do status HTTP com curl 


# Isso retornará apenas o código de status HTTP (como 200, 404, etc.).

CHECKURL=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$CHECKURL" -ne 200 ]; then
    yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"   --info --text="$LOCAL4" --button=OK:0 --width="$SIZE" 2>/dev/null
    exit 1
fi



# ----------------------------------------------------------------------------------------

# Obtendo o nome do arquivo

_getFileName


# Tratando URLs de listas

if echo "$URL" | grep -Eqs '&list' ; then
    FILE="$LOCAL24 \n$PLAYLISTITLE"
    if [ "$PLAYLST" = "TRUE" ]; then
        PLAYLISTOPT="-i -c --yes-playlist"
    else
        PLAYLISTOPT="--no-playlist"
    fi
fi


# Verificação de sucesso do comando anterior

if [ $? -ne 0 ]; then

	yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="\n$LOCAL19: $LOCAL22" --button=OK:0 --width="$SIZE" 2>/dev/null

	exit 1
fi




# Definindo o formato do vídeo conforme a escolha

case "$PLAYFORMAT" in
    "avi") VIDEOFORM="bestvideo+bestaudio/best --recode-video avi" ;;
    "flv") VIDEOFORM="bestvideo+bestaudio/best --recode-video flv" ;;
    "mkv") VIDEOFORM="bestvideo+bestaudio/best --merge-output-format mkv" ;;
    "mp4") VIDEOFORM="bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best --merge-output-format mp4" ;;
    "ogg") VIDEOFORM="bestvideo+bestaudio/best --recode-video ogg" ;;
    *) VIDEOFORM="best" ;;
esac



# Baixando áudio

if [ "$AVFORMAT" = "audio" ]; then
	cd "$MUSICSAVEPATH"
	yt-dlp --rm-cache-dir $PLAYLISTOPT -o '%(title)s.%(ext)s' -x --audio-format $PLAYFORMAT --newline "$URL" | BAR=$(yad --center --image-on-top --title="$TITLETEXTA" --window-icon="$logo" --image="$logo" --width="$SIZE" \
--progress --pulsate --auto-close --no-buttons --auto-kill --text="\n$LOCAL5 audio:$PLAYFORMAT\n$MUSICSAVEPATH\n\n$LOCAL23\n$FILE\n" --progress-text="$LOCAL17")
fi



# Baixando vídeo

if [ "$AVFORMAT" = "video" ]; then
	cd "$VIDEOSAVEPATH"
	yt-dlp --rm-cache-dir $PLAYLISTOPT --newline -f $VIDEOFORM -o '%(title)s.%(ext)s' "$URL" | BAR=$(yad --center --image-on-top --title="$TITLETEXTV" --window-icon="$logo" --image="$logo"  --width="$SIZE" --progress --pulsate --auto-close --no-buttons --auto-kill --text="\n$LOCAL5 video:$PLAYFORMAT\n$VIDEOSAVEPATH\n\n$LOCAL23\n$FILE\n" --progress-text="$LOCAL17")
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






# O usuário escolheu reproduzir depois de baixar

# Reproduzindo o arquivo corretamente



# Reprodução do Vídeo/Aúdio

# A parte de reprodução parece não funcionar como esperado. O código está tentando usar o PLAYER para reproduzir o arquivo, mas a execução dessa parte pode não ser ideal se a variável PLAYER não for configurada corretamente.
# Correção:

# Adicionar uma verificação para garantir que o player está correto.

if [ "$PLAY" = "TRUE" ]; then

    if [ -z "$PLAYER" ]; then
        echo "Nenhum player configurado"
        exit 1
    fi

    # $PLAYER "${FILE%.*}.$PLAYFORMAT"


# Mas se o PLAYER não estiver configurado corretamente ou se o arquivo não for encontrado, 
# isso causará um erro. O ideal é garantir que PLAYER esteja configurado para um reprodutor 
# válido, ou outro reprodutor que você tenha no sistema.

    $PLAYER "$FILE"


fi



# ----------------------------------------------------------------------------------------

# O usuário escolheu não reproduzir o vídeo depois de baixar

# Mensagem de erro se o arquivo não for reproduzido

if [ "$PLAY" = "FALSE" ]; then

	if [ "$AVFORMAT" = "audio" ]; then

		yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="${FILE%.*}.$PLAYFORMAT\n$LOCAL11" --button=OK:0 --width="$SIZE" 2>/dev/null

	else

		yad --center --image-on-top --title="$TITLETEXT" --window-icon="$logo" --image="$logo"  --info --text="${FILE%.*}.$PLAYFORMAT\n$LOCAL6" --button=OK:0 --width="$SIZE" 2>/dev/null

	fi

fi


# ----------------------------------------------------------------------------------------

# Removendo arquivos temporários

rm -f *.part

# ----------------------------------------------------------------------------------------


exit 0

