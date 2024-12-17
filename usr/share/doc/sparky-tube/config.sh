#!/bin/bash

# Por   Fernando Souza <https://github.com/tuxslack/sparky-tube>
# Data: 12/12/2024 as 11:03:01
#
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA


# https://github.com/sparkylinux/sparky-tube

# https://wiki.sparkylinux.org/doku.php/sparky_tube


# Caminho para o logo

logo="/usr/share/pixmaps/sparky-tube.svg"


# ----------------------------------------------------------------------------------------

clear


# Verifica se o yad está instalado


# O comando command -v yad &> /dev/null verifica se o yad está instalado. Caso não esteja, 
# ele retorna um erro e o script exibe a mensagem 
# "Erro: o 'yad' não está instalado. Por favor, instale-o para continuar." e termina 
# com exit 1.


if ! command -v yad &> /dev/null; then

    echo "Erro: o 'yad' não está instalado. Por favor, instale-o para continuar."

    exit 1
fi

# ----------------------------------------------------------------------------------------

verifica_root(){

# Verifica se o script está sendo executado como Root


# Verificação de root: O comando id -u retorna o ID do usuário atual. Se o ID não for 0 
# (que é o ID do root), significa que o script não está sendo executado como administrador.

if [ "$(id -u)" -ne 0 ]; then

    # Exibe uma mensagem usando yad se não for Root

    yad --center --title="Atenção" --window-icon "$logo" --text="Este script deve ser executado como Root!" --button="OK:0" --width="300" --height="100"  2> /dev/null

    exit 1
fi

# Código principal do script (para quando for Root)

# echo -e "\nVocê está executando o script como Root! \n"

}

# ----------------------------------------------------------------------------------------

# Função para instalar o programa manualmente

install_program() {


verifica_root

    echo -e "\n\nInstalando o Sparky Tube...\n\n"

#	cp bin/* /usr/bin/
#	cp share/* /usr/share/applications/

#	if [ ! -d /usr/share/sparky/sparky-tube ]; then
#		mkdir -p /usr/share/sparky/sparky-tube
#	fi

#	cp lang/* /usr/share/sparky/sparky-tube/
#	cp pixmaps/* /usr/share/pixmaps/


cp usr /

echo "Programa instalado com sucesso!"

echo "
Problemas:

- No OpenBox foi necessário remove a pasta ~/.cache/ e reiniciar o sistema para que o 
ícone do 'Sparky Tube' aparece no menu inicial => multimidia => Sparky Tube"

}

# ----------------------------------------------------------------------------------------


# Função para remover o programa manualmente

remove_program() {


verifica_root


    echo "Removendo o programa..."

    echo -e "\n\nExcluir arquivos manualmente\n\n"

    # Para isso, use o comando find para localizar arquivos relacionados ao pacote. 

    # sudo find / -iname 'sparky-tube*' -exec ls {} \;

    # find / -iname *sparky-tube*

    # sudo find / -iname 'sparky-tube*' -exec rm -rf {} \;


#   rm -f /usr/bin/sparky-tube
#	rm -f /usr/bin/sparky-tube.sh
#	rm -rf /usr/share/sparky/sparky-tube
#	rm -f /usr/share/pixmaps/sparky-tube.png


#	rm -f /usr/local/bin/sparky-tube.sh
#	rm -f /usr/share/applications/sparky-tube.desktop
#	rm -f /usr/share/pixmaps/sparky-tube.svg
#	rm -Rf /usr/share/doc/sparky-tube/
#	rm -f /usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube.mo

    echo "Programa removido com sucesso!"

}

# ----------------------------------------------------------------------------------------


# Menu interativo

echo -e "Escolha uma opção: \n"
echo "1. Instalar o programa [root]"
echo "2. Remover o programa [root]"
echo "3. Ajuda"
echo "4. Corrigir tradução [root]"
echo "5. Gerar os arquivos .mo com base nos arquivos .po [root]"
echo "0. Sair"
echo ""
read -p "Digite o número da opção desejada: " option

case $option in

    1)
        install_program

        ;;

    2)
        remove_program

        ;;
    3)
        clear



yad \
    --center \
    --window-icon "$logo" \
    --title="Informações sobre o yt-dlp" \
    --text="O yt-dlp é uma ferramenta poderosa de linha de comando para baixar vídeos e áudios de sites como 
YouTube, Vimeo, Dailymotion, e muitos outros.

Principais características:

- Suporte a múltiplos sites
- Download de playlists inteiras
- Download de vídeos em diferentes qualidades e formatos
- Suporte a proxy e autenticação

Exemplo de uso básico:

yt-dlp [URL]

Onde [URL] é o link do vídeo ou playlist que você deseja baixar.


Para testar outros idiomas por exemplo:

$ export LANG=en_GB
$ sparky-tube.sh

Os idiomas suportados pelo Sparky Tube atualmente são:

en_GB, $(find /usr/share/locale/ -iname sparky-tube.mo | cut -d/ -f5 | paste -d, -s - - | fold -s -w 80)
" \
--buttons-layout=center \
--fixed \
--width="900" --height="200" \
--button="Fechar:0"


# Explicação detalhada:
# 
#     find /usr/share/locale/ -iname sparky-tube.mo: Encontra os arquivos com o nome sparky-tube.mo.
# 
#     cut -d/ -f5: Extrai a quinta parte do caminho do arquivo.
# 
#     paste -d, -s - -: O paste junta as linhas da saída em uma única linha, separando-as 
#     por vírgula. A opção -s significa "serial", que junta tudo em uma linha. O -d, define 
#     que o separador entre os campos será uma vírgula.
# 
#     fold -s -w 80: O comando fold quebra a linha a cada 80 caracteres, mas preserva 
#     palavras inteiras. O -w define a largura da linha e -s evita quebrar palavras no 
#     meio. O número 80 pode ser ajustado conforme sua preferência para que a linha não 
#     fique muito longa.
# 
# 
#     sed 's/, $//': Remove a vírgula e o espaço extras no final da saída.


# $ cat sparky-tube_ja.po | grep ^msgid | sed 's/"//g' | sed 's/msgid //g'


# find /usr/share/locale/ -iname sparky-tube.mo | wc -l


# tree usr  > /usr/share/doc/sparky-tube/sparky-tube.log


        ;;

    4)  
        clear


verifica_root


        echo "Corrigindo tradução..."


echo "
Total de arquivos .po atualmente na pasta /usr/share/doc/sparky-tube/po/: $(ls /usr/share/doc/sparky-tube/po/*.po | wc -l)
"

ls -1 /usr/share/doc/sparky-tube/po/*.po | xargs -n 1 basename

# O que está acontecendo aqui:

#    ls -1 /usr/share/doc/sparky-tube/po/*.po lista todos os arquivos .po no diretório especificado.
#    O comando xargs -n 1 basename pega cada caminho de arquivo gerado pelo ls e executa o comando basename para extrair somente o nome do arquivo, sem o caminho.

# Isso irá exibir apenas os nomes dos arquivos .po.



echo -e "\n\nQual arquivo .po deseja abrir?"
read arquivo_po


# Verificar se o arquivo .po existe

if [[ ! -f /usr/share/doc/sparky-tube/po/"$arquivo_po" ]]; then

    echo "Erro: O arquivo $arquivo_po não existe."

    exit 1
fi


xdg-open /usr/share/doc/sparky-tube/po/"$arquivo_po" 2> /dev/null


# Extrair o valor depois do "_" e antes do ponto "."

locale=$(echo "$arquivo_po" | sed 's/.*_\([^\.]*\)\.po/\1/')


# Explicação:
# 
#     O comando sed 's/.*_\([^\.]*\)\.po/\1/' usa uma expressão regular para:
#         Capturar tudo após o último _ e antes do ponto .po no nome do arquivo.
#         A parte \([^\.]*\) extrai o texto entre o _ e o ponto.
#         A expressão .*_ descarta tudo antes do último _.
#     O valor extraído (it no exemplo) é então armazenado na variável $idioma.


# Gera problema com pt_BR, es_ES


# sparky-tube_es_ES.po
# sparky-tube_pt_BR.po
# sparky-tube_ru.po
# sparky-tube_uk.po

# /usr/share/locale/es_ES/LC_MESSAGES/sparky-tube.mo

# /usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube.mo




# echo -e "\n\nQual o destino para $arquivo_po? Ex: /usr/share/locale/$(echo $LANG| cut -d. -f1)/LC_MESSAGES/sparky-tube.mo"
# read arquivo_mo

echo -e "\n\nQual o destino para $arquivo_po? Ex: /usr/share/locale/$locale/LC_MESSAGES/sparky-tube.mo"
read arquivo_mo



echo -e "\n\nDepois de alterar o arquivo... Enter"
read pausa


sleep 2



# Para verificar se a sintaxe de um arquivo .po está correta antes de usar o comando msgfmt 
# para compilar o arquivo em um arquivo .mo, você pode usar o comando msgfmt diretamente 
# com a opção --check ou verificar se o arquivo está bem formatado com a ajuda do comando 
# msgmerge ou msgcat


# Usando msgfmt com a opção --check

# O comando msgfmt --check verifica a sintaxe do arquivo .po e reporta erros de sintaxe, 
# mas não gera o arquivo .mo. Ele é ideal para validações rápidas.


# Rodar o comando msgfmt --check para verificar a sintaxe

# msgfmt --check --verbose /usr/share/doc/sparky-tube/po/"$arquivo_po"


# Se você quiser que o arquivo .mo seja gerado em um diretório diferente, você pode usar a opção -o para definir o caminho do arquivo de saída.

msgfmt --check --verbose /usr/share/doc/sparky-tube/po/"$arquivo_po"  -o "$arquivo_mo"


# Verificar o código de saída do msgfmt

if [[ $? -ne 0 ]]; then

    # Se o msgfmt encontrou erros, notificar o usuário usando yad ou notify-send

    if command -v yad &>/dev/null; then

        # Usando yad (se disponível)

        yad --center \
            --window-icon "$logo" \
            --title="Erro de Sintaxe no Arquivo .po" \
            --text="O arquivo $arquivo_po contém erros de sintaxe.\nPor favor, corrija os erros e tente novamente." \
            --buttons-layout=center \
            --button="Fechar" \
            --width="300" \
            --height="150"

    elif command -v notify-send &>/dev/null; then

        # Usando notify-send (se yad não estiver disponível)

        notify-send "Erro de Sintaxe no Arquivo .po" \
            "O arquivo $arquivo_po contém erros de sintaxe.\nPor favor, corrija os erros e tente novamente."

    else
        echo "Erro: Nenhuma ferramenta de notificação encontrada (yad ou notify-send)."
    fi

    exit 1  # Sair sem gerar o arquivo .mo

fi

# Se não houver erros, você pode gerar o arquivo .mo, caso necessário (não entra nesse fluxo no caso de erro)
# msgfmt -o "/usr/share/locale/$idioma/LC_MESSAGES/sparky-tube.mo" "$arquivo_po"


echo "

"



# rm: não foi possível remover 'messages.mo': Arquivo ou diretório inexistente

rm messages.mo 2> /dev/null



# Se você tem um arquivo mensagens.po com traduções, basta executar:

# msgfmt /usr/share/doc/sparky-tube/po/"$arquivo_po"  -o "$arquivo_mo"


ls -l "$arquivo_mo"


# msgfmt /usr/share/doc/sparky-tube/sparky-tube_es_ES.po  -o /usr/share/locale/es_ES/LC_MESSAGES/sparky-tube.mo



# Quando se cria um arquovo .mo em /usr/share/locale/ existe a necessidade de atualizar

# Sim, após a criação ou atualização de um arquivo .mo em /usr/share/locale/, é necessário 
# atualizar o cache de localização para que o sistema reconheça e utilize corretamente o 
# novo arquivo de tradução. O processo de atualização do cache garante que as alterações 
# feitas nos arquivos .mo sejam aplicadas nas interfaces de aplicativos e no sistema como 
# um todo.

# Os arquivos .mo são arquivos binários que contêm as traduções de strings de texto para 
# a interface do usuário, gerados a partir dos arquivos .po (arquivos de tradução de 
# texto). O sistema usa esses arquivos .mo para apresentar as traduções apropriadas ao 
# idioma e região configurados.


# reiniciar a sessão ou reiniciar o sistema.

echo "
Para trocar o idioma para testar o arquivo .mo


No Void Linux:

Para habilitar uma determinada localidade, descomente ou adicione as linhas relevantes em 
/etc/default/libc-locales e force a reconfiguração do pacote glibc-locales.

# xdg-open /etc/default/libc-locales 


# grep -v '^#' /etc/default/libc-locales
en_US.UTF-8 UTF-8  
pt_BR.UTF-8 UTF-8 


Definindo a localidade do sistema

Defina LANG=xxxx em /etc/locale.conf.

# xdg-open /etc/locale.conf

# grep -v '^#' /etc/locale.conf 
LANG=pt_BR.UTF-8
LC_COLLATE=C


Execute o comando abaixo para atualizar os locales do sistema:

# xbps-reconfigure -f glibc-locales
glibc-locales: configuring ...
Generating GNU libc locales...
  en_US.UTF-8... done.
  pt_BR.UTF-8... done.
glibc-locales: configured successfully.




# locale -a
C
C.utf8
POSIX
en_US.utf8
pt_BR.utf8


# reboot ou fecha e abra novamente a sessão do usuário.

"



        exit 3

        ;;

    5)  
        clear

        verifica_root

        echo "

        Gerando os arquivos .mo com base nos arquivos .po...
"

#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_pt_BR.po  -o /usr/share/locale/pt_BR/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_de.po     -o /usr/share/locale/de/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_el.po     -o /usr/share/locale/el/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_en.po     -o /usr/share/locale/en/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_es_ES.po  -o /usr/share/locale/es_ES/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_fi.po     -o /usr/share/locale/fi/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_fr.po     -o /usr/share/locale/fr/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_hu.po     -o /usr/share/locale/hu/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_it.po     -o /usr/share/locale/it/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_ja.po     -o /usr/share/locale/ja/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_pl.po     -o /usr/share/locale/pl/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_ru.po     -o /usr/share/locale/ru/LC_MESSAGES/sparky-tube.mo
#         msgfmt --check --verbose  /usr/share/doc/sparky-tube/po/sparky-tube_uk.po     -o /usr/share/locale/uk/LC_MESSAGES/sparky-tube.mo


# Pode otimizar esse código usando um loop para iterar sobre os arquivos .po de forma mais compacta e eficiente, sem precisar repetir o comando msgfmt para cada idioma.


for lang in pt_BR de el en es_ES fi fr hu it ja pl ru uk; do

        echo -e "Gerando o arquivo /usr/share/locale/${lang}/LC_MESSAGES/sparky-tube.mo \n"

    if msgfmt --check --verbose /usr/share/doc/sparky-tube/po/sparky-tube_${lang}.po -o /usr/share/locale/${lang}/LC_MESSAGES/sparky-tube.mo; then

        echo -e "\033[0;32mCompilação bem-sucedida para o idioma ${lang}.\n\033[0m"

    else

        echo -e "\033[0;31mErro ao compilar o arquivo .po para o idioma ${lang}.\n\033[0m"

        echo -e "\n\n/usr/share/doc/sparky-tube/po/sparky-tube_${lang}.po"

    fi

done


        ;;


    0)  
        clear

        echo "Saindo..."

        exit 2

        ;;

    *)
        echo "Opção inválida!"

        exit 1

        ;;
esac

# ----------------------------------------------------------------------------------------


exit 0

