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

echo -e "${BOLD}[${PURPLE}INFO${NC}] CLONANDO REPOSITÓRIOS...\n\n"

echo -e "${BOLD}[${PURPLE}INFO${NC}] Clonando repositório de ENTIDADES...\n"
git clone https://github.com/antonieti/habit-tracking-entities.git $PROJ_ROOT/entities
echo -e "\n\n${BOLD}[${PURPLE}INFO${NC}] Clonando repositório de REPOSITÓRIOS...\n"
git clone https://github.com/antonieti/habit-tracking-repository.git $PROJ_ROOT/repository

echo -e "\n\n${BOLD}[${PURPLE}INFO${NC}] Gerando JARs das bibliotecas e dependências...\n\n"
cd $PROJ_ROOT/entities
mvn clean install && cp ./target/habittrackingentities-1.0-SNAPSHOT.jar /home/${USER}/.m2/local_repo

cd $PROJ_ROOT/repository
mvn clean install && cp ./target/habittrackingentities-1.0-SNAPSHOT.jar /home/${USER}/.m2/local_repo