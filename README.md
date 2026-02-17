# Desafio DIO — Organização e Grupos de Acesso (GCP Folders) + Draw.io

Este repositório foi criado para o desafio da DIO: desenhar uma organização de grupos de acessos e uma organização utilizando o Draw.io e subir no GitHub.

## 🏢 Cenário
Empresa fictícia: **CelularTech S.A.**

A empresa possui áreas segregadas:
- **TI (2 técnicos)**
- **RH (2 pessoas)**
- **Financeiro (2 pessoas)**
- **Administrativo (2 pessoas)**

A segregação é representada de duas formas:
1. **Diagrama (Draw.io)**: estrutura organizacional e separação de áreas
2. **Terraform (GCP)**: criação de **Folders** por área e subfolders de ambientes/projetos

## 📌 Links importantes
- Diagrama Draw.io: [`drawio/celulartech-estrutura.drawio`](./drawio/celulartech-estrutura.drawio)
- Terraform: [`terraform/`](./terraform)

## 🧩 Como abrir o diagrama no Draw.io
1. Abra https://app.diagrams.net/
2. **File** → **Open from** → **Device**
3. Selecione o arquivo `drawio/celulartech-estrutura.drawio`

## 🚀 Como usar o Terraform
Veja instruções em: [`terraform/README.md`](./terraform/README.md)

## ✅ Observação sobre segregação (conceito)
Em um cenário real, a segregação seria aplicada com:
- Grupos: `ti@`, `rh@`, `financeiro@`, `administrativo@`
- IAM aplicado no nível do **Folder** de cada área (ex.: apenas RH acessa RH)
- Projetos separados por ambiente (dev/prod) ou por times

> Neste desafio, a separação é modelada via **Folders** e representada visualmente no Draw.io.
