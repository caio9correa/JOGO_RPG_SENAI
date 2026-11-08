# Banco de dados - Jogo de RPG online

Atividade de Banco de Dados (Avaliação 1) - script em SQL Server que cria as tabelas do projeto de jogo de RPG online.

## Tabelas

- **Usuarios**: UsuarioId (PK), Email, Senha
- **Classes**: ClasseId (PK), Nome, Descricao
- **Habilidades**: HabilidadeId (PK), Nome
- **Personagens**: PersonagemId (PK), NomePersonagem, UsuarioId (FK), ClasseId (FK)
- **Classes_Habilidades**: ClasseId (PK, FK), HabilidadeId (PK, FK)

## Relacionamentos

- Usuarios 1:N Personagens
- Classes 1:N Personagens
- Classes N:N Habilidades (resolvido pela tabela Classes_Habilidades)

## Como executar

1. Abrir o SSMS e conectar no servidor
2. Abrir o arquivo `jogo_rpg.sql`
3. Executar o script (F5)
4. Atualizar o banco `RPGOnlineDB` e conferir as tabelas
