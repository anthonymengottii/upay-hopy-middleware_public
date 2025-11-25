# Script para configurar e fazer push do repositório
# Execute: .\setup-git.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Configurando repositório Git" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Inicializar git
Write-Host "1. Inicializando repositório Git..." -ForegroundColor Yellow
git init
Write-Host "   ✅ Repositório inicializado" -ForegroundColor Green
Write-Host ""

# Adicionar remote
Write-Host "2. Configurando remote..." -ForegroundColor Yellow
$remoteExists = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    git remote add origin https://github.com/anthonymengottii/upay-hopy-middleware_public.git
    Write-Host "   ✅ Remote adicionado" -ForegroundColor Green
} else {
    git remote set-url origin https://github.com/anthonymengottii/upay-hopy-middleware_public.git
    Write-Host "   ✅ Remote atualizado" -ForegroundColor Green
}
Write-Host ""

# Adicionar arquivos
Write-Host "3. Adicionando arquivos ao staging..." -ForegroundColor Yellow
git add README.md PROJETO.md CONTATO.md INSTRUCOES-GITHUB.md .gitignore COMANDOS-GIT.md setup-git.ps1
Write-Host "   ✅ Arquivos adicionados" -ForegroundColor Green
Write-Host ""

# Verificar status
Write-Host "4. Status do repositório:" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Gray
git status
Write-Host "----------------------------------------" -ForegroundColor Gray
Write-Host ""

# Commit
Write-Host "5. Fazendo commit..." -ForegroundColor Yellow
git commit -m "docs: adiciona documentação do middleware de pagamentos ao portfólio"
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Commit realizado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Erro ao fazer commit" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Configurar branch main
Write-Host "6. Configurando branch main..." -ForegroundColor Yellow
git branch -M main
Write-Host "   ✅ Branch configurada" -ForegroundColor Green
Write-Host ""

# Push
Write-Host "7. Fazendo push para o GitHub..." -ForegroundColor Yellow
Write-Host "   (Isso pode pedir suas credenciais do GitHub)" -ForegroundColor Gray
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "✅ SUCESSO! Repositório publicado!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Acesse: https://github.com/anthonymengottii/upay-hopy-middleware_public" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "⚠️  Erro ao fazer push. Verifique:" -ForegroundColor Red
    Write-Host "   - Suas credenciais do GitHub" -ForegroundColor Yellow
    Write-Host "   - Se o repositório existe no GitHub" -ForegroundColor Yellow
    Write-Host "   - Sua conexão com a internet" -ForegroundColor Yellow
}

