#Habit Tracker App

##Guia de Preparação do ambiente

1. Dê permissão de execução para o script *build.sh*

2. Execute o script, atentando-se às saídas disponibilizadas no terminal: Elas possuem as informações sobre os
diretórios onde os repositórios das dependências foram clonados, assim como o diretório para onde os JARs destas
dependências foram  movidos após o processo de compilação com o Maven

3. Importe o projeto Android baixado pelo scrip (encontra-se por padrão em **/home/${USER}/Projetos/HabitTracking/habitTracking_app**):
Abra o Android Studio, clique em "*Open an existing Android Studio project*" e navegue até o caminho onde o script baixou o projeto 
(apontado acima).

4. Após a finalização da importação, vá até a opção **Project Structure**: Use o atalho *Ctrl+Shift+Alt+S* ou navegue através do menu 
*File>Project Structure* e navegue até *Modules>app*, indo depois até a aba *Dependencies*. Clique no botão para adicionar uma nova dependência
(ou use o atalho *Alt+Insert*) e selecione a opção **Jar dependency**; adicione as dependências presentes no diretório **libs**.