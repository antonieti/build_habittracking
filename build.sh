#!/bin/bash

PURPLE='\033[0;35m'
GREEN='\033[1;92m'
NC='\033[0m'
LINEBREAK='\n\n'

echo -e "[${PURPLE}INFO${NC}] Criando estrutura de diretórios para o projeto...\n\n"
PROJ_ROOT=/home/${USER}/Projetos/HabitTracking
REPO=/home/${USER}/.m2/local_repo

if [ -d "$PROJ_ROOT" ]; then
  rm -rf $PROJ_ROOT;
fi

if [ -d "$REPO" ]; then
  rm -rf $REPO;
fi

mkdir -p $PROJ_ROOT;
mkdir -p $REPO;

echo -e "${BOLD}[${PURPLE}INFO${NC}] CLONANDO REPOSITÓRIOS..."

echo -e "${LINEBREAK}${BOLD}[${PURPLE}INFO${NC}] Clonando repositório principal do projeto em ${GREEN}$PROJ_ROOT/habitTracking_app${NC}...\n"
git clone https://github.com/antonieti/android-semestral-proj.git $PROJ_ROOT/habitTracking_app

echo -e "${LINEBREAK}${BOLD}[${PURPLE}INFO${NC}] Clonando repositório de ENTIDADES em ${GREEN}$PROJ_ROOT/entities${NC}...\n"
git clone https://github.com/antonieti/habit-tracking-entities.git $PROJ_ROOT/entities

echo -e "${LINEBREAK}${BOLD}[${PURPLE}INFO${NC}] Clonando repositório de REPOSITÓRIOS em ${GREEN}$PROJ_ROOT/repository${NC}...\n"
git clone https://github.com/antonieti/habit-tracking-repository.git $PROJ_ROOT/repository

echo -e "${LINEBREAK}${BOLD}[${PURPLE}INFO${NC}] Iniciando processo de compilação com Maven (gerando JARs das bibliotecas e dependências) -----> Verifique o diretório ${GREEN}/home/${USER}/.m2/local_repo${NC}...\n\n"
cd $PROJ_ROOT/entities
mvn clean install && cp ./target/habittrackingentities-1.0-SNAPSHOT.jar /home/${USER}/.m2/local_repo

cd $PROJ_ROOT/repository
mvn clean install && cp ./target/habittrackingrepository-1.0-SNAPSHOT.jar /home/${USER}/.m2/local_repo

echo -e "${LINEBREAK}Copiando dependências geradas para o diretório de libs do projeto: Verificar o diretório${LINEBREAK}\t${GREEN}$PROJ_ROOT/habitTracking_app/app/libs${NC}${LINEBREAK}após finalização do processo${LINEBREAK}\t\t\t\e[3;96mMay the Force be with you!\e[0m"
mkdir -p $PROJ_ROOT/habitTracking_app/app/libs/ && cp -r /home/${USER}/.m2/local_repo/* $PROJ_ROOT/habitTracking_app/app/libs/