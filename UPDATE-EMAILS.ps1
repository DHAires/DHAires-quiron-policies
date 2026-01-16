# Script PowerShell para atualizar todos os e-mails nas páginas de políticas
# Autor: Quiron Concursos
# Data: 16 de Janeiro de 2026

Write-Host "🔧 Atualizando e-mails nas páginas de políticas..." -ForegroundColor Cyan
Write-Host ""

# Array com os e-mails antigos
$oldEmails = @(
    "privacidade@quironconcursos.com.br",
    "dpo@quironconcursos.com.br",
    "suporte@quironconcursos.com.br",
    "juridico@quironconcursos.com.br",
    "financeiro@quironconcursos.com.br"
)

# Novo e-mail
$newEmail = "quironconcursos@gmail.com"

# Arquivos para atualizar
$files = @(
    "privacy-policy.html",
    "terms-of-service.html",
    "delete-account.html",
    "ad-partners.html"
)

# Contador de substituições
$totalReplacements = 0

# Para cada arquivo
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "📄 Processando: $file" -ForegroundColor Yellow
        $fileReplacements = 0
        
        # Ler conteúdo do arquivo
        $content = Get-Content $file -Raw -Encoding UTF8
        
        # Para cada e-mail antigo
        foreach ($oldEmail in $oldEmails) {
            # Contar quantas vezes o e-mail aparece
            $matches = [regex]::Matches($content, [regex]::Escape($oldEmail))
            $count = $matches.Count
            
            if ($count -gt 0) {
                Write-Host "  ↳ Substituindo $oldEmail ($count ocorrências)" -ForegroundColor Gray
                
                # Fazer a substituição
                $content = $content -replace [regex]::Escape($oldEmail), $newEmail
                $fileReplacements += $count
            }
        }
        
        # Salvar arquivo atualizado
        if ($fileReplacements -gt 0) {
            $content | Set-Content $file -Encoding UTF8 -NoNewline
        }
        
        Write-Host "  ✅ $fileReplacements substituições feitas" -ForegroundColor Green
        $totalReplacements += $fileReplacements
        Write-Host ""
    }
    else {
        Write-Host "  ⚠️  Arquivo não encontrado: $file" -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ Concluído!" -ForegroundColor Green
Write-Host "📊 Total de substituições: $totalReplacements" -ForegroundColor Cyan
Write-Host "📧 Novo e-mail: $newEmail" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "🔍 Verificando se ainda há e-mails antigos..." -ForegroundColor Yellow

# Verificar se ainda existem e-mails antigos
$remaining = 0
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw -Encoding UTF8
        foreach ($oldEmail in $oldEmails) {
            $matches = [regex]::Matches($content, [regex]::Escape($oldEmail))
            $count = $matches.Count
            if ($count -gt 0) {
                Write-Host "⚠️  ATENÇÃO: $file ainda contém $oldEmail ($count ocorrências)" -ForegroundColor Red
                $remaining += $count
            }
        }
    }
}

if ($remaining -eq 0) {
    Write-Host "✅ Nenhum e-mail antigo encontrado! Tudo atualizado!" -ForegroundColor Green
}
else {
    Write-Host "❌ Ainda há $remaining e-mails antigos. Verifique manualmente." -ForegroundColor Red
}

Write-Host ""
Write-Host "🎯 Próximos passos:" -ForegroundColor Cyan
Write-Host "  1. Verifique os arquivos atualizados"
Write-Host "  2. Teste abrindo cada HTML no navegador"
Write-Host "  3. Faça commit das alterações"
Write-Host "  4. Deploy na Vercel"
Write-Host ""

# Pausar para o usuário ver os resultados
Read-Host "Pressione ENTER para sair"
