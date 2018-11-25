#!/bin/bash

PURPLE='\033[0;35m'
NC='\033[0m'

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

echo -e "${BOLD}[${PURPLE}INFO${NC}] Clonando repositórios...\n\n"
git clone https://github.com/antonieti/habit-tracking-entities.git $PROJ_ROOT/entities

echo -e "${BOLD}[${PURPLE}INFO${NC}] Gerando JARs das bibliotecas e dependências...\n\n"
cd $PROJ_ROOT/entities
mvn clean install && cp ./target/habittrackingentities-1.0-SNAPSHOT.jar /home/${USER}/.m2/local_repo