#!/bin/bash

# Diretório onde os backups serão armazenados
BACKUP_DIR="/workspaces/db_backups"

# Cria o diretório de backup se não existir
mkdir -p $BACKUP_DIR

# Exporta todas as bases de dados
docker exec db mysqldump -u root -pmariadb --all-databases > $BACKUP_DIR/all_databases.sql

# Adiciona o backup ao repositório git
git add $BACKUP_DIR/all_databases.sql
git commit -m "Backup automático das bases de dados"
