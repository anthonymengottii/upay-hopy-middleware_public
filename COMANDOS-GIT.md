# 🚀 Comandos Git para Publicar no GitHub

## Passo a Passo

### 1. Navegar para a pasta do projeto

```bash
cd "C:\Users\kayoc\Desktop\Middleware - Integração Upay\upay-hopy-middleware"
```

Ou use o PowerShell:
```powershell
Set-Location "C:\Users\kayoc\Desktop\Middleware - Integração Upay\upay-hopy-middleware"
```

### 2. Inicializar repositório Git

```bash
git init
```

### 3. Configurar remote

```bash
git remote add origin https://github.com/anthonymengottii/upay-hopy-middleware_public.git
```

### 4. Adicionar arquivos

```bash
git add README.md PROJETO.md CONTATO.md INSTRUCOES-GITHUB.md .gitignore
```

### 5. Verificar o que será commitado

```bash
git status
```

**IMPORTANTE**: Certifique-se de que apenas arquivos de documentação estão sendo commitados. Não deve haver código-fonte.

### 6. Fazer commit

```bash
git commit -m "docs: adiciona documentação do middleware de pagamentos ao portfólio"
```

### 7. Fazer push

```bash
# Se a branch principal for 'main'
git push -u origin main

# Se a branch principal for 'master'
git push -u origin master
```

## Alternativa: Usar o Script PowerShell

Execute o script `setup-git.ps1` que já está na pasta:

```powershell
.\setup-git.ps1
```

Depois execute o push:

```bash
git push -u origin main
```

## Verificação Final

Após o push, acesse o repositório no GitHub:
https://github.com/anthonymengottii/upay-hopy-middleware_public

Verifique se:
- ✅ README.md está visível
- ✅ Todos os arquivos de documentação foram enviados
- ✅ Nenhum código-fonte foi exposto
- ✅ Links para API em produção estão funcionando

## Troubleshooting

### Erro: "remote origin already exists"
```bash
git remote set-url origin https://github.com/anthonymengottii/upay-hopy-middleware_public.git
```

### Erro: "failed to push some refs"
```bash
# Se o repositório já tem commits, faça pull primeiro
git pull origin main --allow-unrelated-histories
```

### Mudar branch principal
```bash
# Se precisar mudar de master para main
git branch -M main
```



