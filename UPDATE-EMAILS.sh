#!/bin/bash

# Script para atualizar todos os e-mails nas páginas de políticas
# Autor: Quiron Concursos
# Data: 16 de Janeiro de 2026

echo "🔧 Atualizando e-mails nas páginas de políticas..."
echo ""

# Array com os e-mails antigos
OLD_EMAILS=(
    "privacidade@quironconcursos.com.br"
    "dpo@quironconcursos.com.br"
    "suporte@quironconcursos.com.br"
    "juridico@quironconcursos.com.br"
    "financeiro@quironconcursos.com.br"
)

# Novo e-mail
NEW_EMAIL="quironconcursos@gmail.com"

# Arquivos para atualizar
FILES=(
    "privacy-policy.html"
    "terms-of-service.html"
    "delete-account.html"
    "ad-partners.html"
)

# Contador de substituições
TOTAL_REPLACEMENTS=0

# Para cada arquivo
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo "📄 Processando: $FILE"
        FILE_REPLACEMENTS=0
        
        # Para cada e-mail antigo
        for OLD_EMAIL in "${OLD_EMAILS[@]}"; do
            # Contar quantas vezes o e-mail aparece
            COUNT=$(grep -o "$OLD_EMAIL" "$FILE" | wc -l)
            
            if [ $COUNT -gt 0 ]; then
                echo "  ↳ Substituindo $OLD_EMAIL ($COUNT ocorrências)"
                
                # Fazer a substituição (compatível com macOS e Linux)
                if [[ "$OSTYPE" == "darwin"* ]]; then
                    # macOS
                    sed -i '' "s/$OLD_EMAIL/$NEW_EMAIL/g" "$FILE"
                else
                    # Linux
                    sed -i "s/$OLD_EMAIL/$NEW_EMAIL/g" "$FILE"
                fi
                
                FILE_REPLACEMENTS=$((FILE_REPLACEMENTS + COUNT))
            fi
        done
        
        echo "  ✅ $FILE_REPLACEMENTS substituições feitas"
        TOTAL_REPLACEMENTS=$((TOTAL_REPLACEMENTS + FILE_REPLACEMENTS))
        echo ""
    else
        echo "  ⚠️  Arquivo não encontrado: $FILE"
        echo ""
    fi
done

echo "═══════════════════════════════════════"
echo "✅ Concluído!"
echo "📊 Total de substituições: $TOTAL_REPLACEMENTS"
echo "📧 Novo e-mail: $NEW_EMAIL"
echo "═══════════════════════════════════════"
echo ""
echo "🔍 Verificando se ainda há e-mails antigos..."

# Verificar se ainda existem e-mails antigos
REMAINING=0
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        for OLD_EMAIL in "${OLD_EMAILS[@]}"; do
            COUNT=$(grep -o "$OLD_EMAIL" "$FILE" | wc -l)
            if [ $COUNT -gt 0 ]; then
                echo "⚠️  ATENÇÃO: $FILE ainda contém $OLD_EMAIL ($COUNT ocorrências)"
                REMAINING=$((REMAINING + COUNT))
            fi
        done
    fi
done

if [ $REMAINING -eq 0 ]; then
    echo "✅ Nenhum e-mail antigo encontrado! Tudo atualizado!"
else
    echo "❌ Ainda há $REMAINING e-mails antigos. Verifique manualmente."
fi

echo ""
echo "🎯 Próximos passos:"
echo "  1. Verifique os arquivos atualizados"
echo "  2. Teste abrindo cada HTML no navegador"
echo "  3. Faça commit das alterações"
echo "  4. Deploy na Vercel"
echo ""
