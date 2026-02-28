# Improvement Suggestions - SEprocess

Este documento centraliza as sugestões de melhoria para o **SEprocess**, baseadas na experiência real de desenvolvimento utilizando este processo.

## Sugestões de Melhoria (Experiência de Desenvolvimento)

### 1. Automação de Verificação de Qualidade (Quality Gates) [IMPLEMENTED]
- **Sugestão**: Integrar scripts de pré-commit que executem automaticamente os testes e o linter em cada commit local.
- **Justificativa**: Garante que o desenvolvedor receba feedback imediato antes mesmo de abrir um PR, economizando tempo no pipeline de CI.
- **Impacto**: Alta redução de retrabalho.
- **Solução**: Template `.pre-commit-config.yaml.template` adicionado a `core/templates`.

### 2. Template de ADR (Architectural Decision Record) Simplificado [IMPLEMENTED]
- **Sugestão**: Criar uma versão "lightweight" do template de ADR para decisões menores.
- **Justificativa**: Atualmente, o template de ADR pode parecer pesado para pequenas mudanças de design, o que pode desencorajar seu uso sistemático.
- **Impacto**: Maior adesão ao registro de decisões.
- **Solução**: `adr-micro-template.md` adicionado a `core/templates`.

### 3. Melhoria na Gestão de Dependências [IMPLEMENTED]
- **Sugestão**: Recomendar explicitamente o uso de `uv` ou `poetry` para projetos Python no playbook.
- **Justificativa**: O `requirements.txt` básico não suporta travamento de dependências tão bem quanto ferramentas modernas, o que pode levar a problemas de reprodutibilidade em diferentes ambientes.
- **Impacto**: Maior estabilidade e segurança.
- **Solução**: Playbook atualizado com recomendação de `uv`/`poetry`.

### 4. Guia de Recuperação de Checkpoints [IMPLEMENTED]
- **Sugestão**: Adicionar um guia rápido sobre como reverter para um checkpoint anterior utilizando os nomes das tags definidas.
- **Justificativa**: O playbook manda criar tags de checkpoint, mas não explica o fluxo de "rollback" prático quando algo dá errado.
- **Impacto**: Melhor resiliência do desenvolvedor.
- **Solução**: Seção "Rollback and Recovery Strategy" adicionada ao playbook.

### 5. Protocolo de Agência Proativa da IA [IMPLEMENTED]
- **Sugestão**: Implementar um guia de comportamento onde a IA identifica proativamente o próximo passo processual.
- **Impacto**: Reduz a carga cognitiva do usuário como "gerente de processo".
- **Solução**: Seção "AI Proactive Agency" adicionada ao Playbook e Starter Prompts atualizados.

### 6. Sincronização Progressiva de Artefatos [IMPLEMENTED]
- **Sugestão**: Padronizar a cristalização dos artefatos no repositório (ex: `seprocess/sessions/`) conforme milestones são validados.
- **Impacto**: Melhora a rastreabilidade e persistência do histórico do projeto.
- **Solução**: Pasta `sessions/` criada via bootstrap e regra de DoD atualizada.

### 7. Scaffold Inteligente de Quality Gates [IMPLEMENTED]
- **Sugestão**: O bootstrap deve detectar a stack e configurar comandos de lint/teste específicos no `.pre-commit-config.yaml`.
- **Impacto**: Evita falhas por comandos genéricos incompatíveis.
- **Solução**: Lógica de substituição de string adicionada ao `install.ps1` baseada no parâmetro `-Stack`.

### 8. Visibilidade da Dívida Técnica de Documentação [IMPLEMENTED]
- **Sugestão**: Criar um "Health Dashboard" no `task.md` para monitorar se a tríade README, ADR e Knowledge Base está sincronizada.
- **Impacto**: Evita o esquecimento de atualizações críticas de documentação.
- **Solução**: Dashboard de saúde adicionado ao template de gestão de tarefas.

### 9. Instalação Automática do Pre-commit [IMPLEMENTED]
- **Sugestão**: O processo deve garantir que a ferramenta `pre-commit` esteja instalada no ambiente de desenvolvimento, em vez de apenas fornecer o template.
- **Impacto**: Reduz a fricção inicial e garante que os Quality Gates automatizados funcionem imediatamente.
- **Solução**: Playbook atualizado com obrigatoriedade de instalação, script de bootstrap agora fornece comandos específicos de instalação e checklist de adoção atualizado.

### 10. Portabilidade dos Adapters [IMPLEMENTED]
- **Sugestão**: O script de bootstrap deve copiar a pasta `adapters/` para o projeto alvo (dentro de `seprocess/`).
- **Justificativa**: Sem os adapters no projeto alvo, a "Regra de Ouro" (Starter Prompt) depende de o usuário buscar o arquivo no repositório central do SEprocess, o que quebra a autonomia e portabilidade do projeto.
- **Impacto**: Garante que qualquer IA que abra o projeto tenha acesso imediato às instruções de como executar o processo.
- **Solução**: Pasta `adapters/` agora é copiada integralmente para o projeto alvo pelo `install.ps1`.

### 11. Naming do Template Pre-commit [IMPLEMENTED]
- **Sugestão**: O template era nomeado `pre-commit-config.yaml` e precisava ser copiado manualmente com o prefixo `.`. O script deve instanciar o arquivo com o nome correto.
- **Impacto**: Falha no primeiro commit.
- **Solução**: `install.ps1` agora copia `.pre-commit-config.yaml` já instanciado na raiz do projeto.

### 12. Bandit Incompatível com Filename Passing [IMPLEMENTED]
- **Sugestão**: Usar `-r <dir>` no hook do bandit conflita com o mecanismo do pre-commit.
- **Impacto**: Commit bloqueado com erro `unrecognized arguments`.
- **Solução**: Template atualizado com exemplo correto usando `pass_filenames: false`.

### 13. B101 (assert_used) em Arquivos de Teste
- **Sugestão**: Bandit marca `assert` em arquivos pytest como problema de segurança (falso positivo).
- **Decisão**: Não implementar supressão por default. Documentar como gotcha comentado no template para que cada projeto decida conscientemente.
- **Solução**: Nota `# Gotcha` adicionada ao template do pre-commit.

### 14. `pytest.ini` para asyncio_mode
- **Sugestão**: Adicionar `pytest.ini` com `asyncio_mode = auto` ao scaffold.
- **Decisão**: Não implementar. Specific a projetos com `pytest-asyncio`; adicioná-lo por padrão causaria ruído em projetos síncronos.

### 15. Higiene de Templates e Instanciação de Artefatos [IMPLEMENTED]
- **Sugestão**: Tornar explícito que arquivos `*template*` não devem ser preenchidos diretamente, e sim usados como base para criar artefatos de sessão.
- **Impacto**: Reduz ambiguidade para agentes de IA e evita registrar evidência em arquivos-base.
- **Solução**: Regra `TEMPLATE_ONLY` adicionada ao playbook, templates e adapters; gate de higiene de template incluído em quality gates e checklist de PR.

### 16. Integridade de Entregáveis Declarados + Smoke Check Pós-Instalação [IMPLEMENTED]
- **Sugestão**: Exigir verificação de existência dos entregáveis declarados no kickoff e validar setup via checagem opcional no bootstrap.
- **Impacto**: Evita fechamento de sessão com escopo incompleto e aumenta confiança de adoção no projeto consumidor.
- **Solução**: Artifact Existence Gate adicionado; `install.ps1` ganhou `-RunChecks`; check cross-platform de template hygiene adicionado ao scaffold e ao pre-commit template.

---
*Documento criado em: 2026-02-22*
