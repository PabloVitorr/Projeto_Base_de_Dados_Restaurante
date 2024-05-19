# **Projeto base de dados Restaurante**

![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

<br/>

Repositório criado com o intuito de documentar a criação de uma pequena base de dados para treinar os conteúdos abordados no livro [**PostgreSQL Banco de dados para aplicações web modernas**](https://www.google.com.br/books/edition/PostgreSQL/KlFVDgAAQBAJ?hl=pt-BR&gbpv=0&kptab=overview) paralelamente a leitura do mesmo.

O projeto trabalha com um cenário onde é solicitado o desenvolvimento de uma base de dados para atender a demanda dos dados gerados por um **restaurante** onde todas as **operações** e **restrições** são realizadas **diretamente na base de dados**.

<br/>

## **Ferramentas utilizadas**
- **Visual Paradigm Community Edition**
- **VMware**
- **Oracle Linux 9.3**
- **PostgreSQL**
- **pgAdmin4**

### **Preparação do ambiente**

- Aplicação Visual Paradigm, utilizada para desenvolvimento do diagrama ER do projeto disponível na [**página oficial**](https://www.visual-paradigm.com/download/community.jsp) para download

- Aplicação **VMware** utilizada para criação da **VM** disponível na [**página oficial**](https://www.vmware.com/content/vmware/vmware-published-sites/us/products/workstation-player/workstation-player-evaluation.html.html) para download.

- Iso do **S.O** **Oracle Linux 9.3** utilizado no projeto disponivel na [**página oficial**](https://yum.oracle.com/oracle-linux-isos.html) para download.

<br/>

- Instalação do PostgreSQL realizada seguindo a [**documentação oficial**](https://www.postgresql.org/download/linux/redhat/).
  - Atualizar o sistema
    ```bash
    sudo dnf update
    ```

  - Instale o repositório RPM
    ```bash
    sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    ```

  - Desative o módulo PostgreSQL integrado
    ```bash
    sudo dnf -qy module disable postgresql
    ```
  
  - Insale o PostgreSQL
    ```bash
    sudo dnf install -y postgresql14-server
    ```

  - Instale o pacote **contrib** da verão em questão
    ```bash
    sudo dnf install postgresql14-contrib
    ```

  - Opcionalmente, inicialize o banco de dados e habilite o início automático
    ```bash
    sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
    ```

    ```bash
    sudo systemctl enable postgresql-14
    ```

    ```bash
    sudo systemctl start postgresql-14
    ```

<br/>

- Instalação do pgAdmin4 realizada seguindo a [**documentação oficial**](https://www.pgadmin.org/download/pgadmin-4-rpm/).

  - Instalação nos modos desktop e web
    ```bash
    sudo dnf install pgadmin4
    ```

<br/>

## **Scripts de criação da base de dados, inserção de dados e consultas**
- [**Diagrama ER**](./documentacao/diagrama_er/base_de_dados_restaurante.png)
- [**Entities**](./entities.sql)
- [**Constraints**](./constraints.sql)
- [**Sequences**](./sequences.sql)
- [**Procedures**](./procedures.sql)
- [**Calls**](./calls.sql)
- [**Functions**](./functions.sql)
- [**Triggers**](./triggers.sql)
- [**Inserts - Copy**](./copy.sql)