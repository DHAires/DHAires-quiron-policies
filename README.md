# 🏛️ Quiron Concursos - Páginas de Políticas

Páginas estáticas para hospedagem na Vercel contendo todas as políticas legais necessárias para compliance com Google Play Store.

## 📋 Páginas Incluídas

1. **index.html** - Menu principal com navegação
2. **privacy-policy.html** - Política de Privacidade completa
3. **terms-of-service.html** - Termos de Uso completos
4. **delete-account.html** - Instruções para exclusão de conta
5. **ad-partners.html** - Informações sobre parceiros de publicidade

## 🚀 Como Fazer Deploy na Vercel

### Opção 1: Via Vercel CLI (Recomendado)

```bash
# 1. Instale a Vercel CLI (se não tiver)
npm install -g vercel

# 2. Entre na pasta
cd vercel-policies

# 3. Faça login na Vercel
vercel login

# 4. Faça o deploy
vercel

# 5. Para production
vercel --prod
```

### Opção 2: Via GitHub + Vercel Dashboard

1. Crie um repositório no GitHub
2. Faça upload desta pasta `vercel-policies` para o repositório
3. Acesse [vercel.com](https://vercel.com) e faça login
4. Clique em "New Project"
5. Importe o repositório do GitHub
6. Selecione a pasta `vercel-policies` como root directory
7. Clique em "Deploy"

### Opção 3: Via Vercel Dashboard (Drag & Drop)

1. Acesse [vercel.com](https://vercel.com) e faça login
2. Clique em "Add New..." → "Project"
3. Arraste a pasta `vercel-policies` para a área de upload
4. Clique em "Deploy"

## 🔗 URLs Após Deploy

Após o deploy, suas páginas estarão disponíveis em:

```
https://seu-projeto.vercel.app/
https://seu-projeto.vercel.app/privacy-policy
https://seu-projeto.vercel.app/terms-of-service
https://seu-projeto.vercel.app/delete-account
https://seu-projeto.vercel.app/ad-partners
```

## 🎯 Para a Google Play Store

Use estas URLs nos campos da Google Play Console:

**Política de Privacidade:**
```
https://dh-aires-quiron-policies.vercel.app/privacy-policy
```

**Termos de Uso:**
```
https://dh-aires-quiron-policies.vercel.app/terms-of-service
```

## ✅ Conformidade Legal

Todas as páginas estão em conformidade com:

- ✅ **LGPD** (Lei Geral de Proteção de Dados - Brasil)
- ✅ **GDPR** (General Data Protection Regulation - Europa)
- ✅ **COPPA** (Children's Online Privacy Protection Act - EUA)
- ✅ **Google Play Store Policies**
- ✅ **Google AdMob Requirements**

## 📧 E-mails de Contato

Os seguintes e-mails estão incluídos nas políticas:

- **Privacidade:** privacidade@quironconcursos.com.br
- **DPO:** dpo@quironconcursos.com.br
- **Suporte:** suporte@quironconcursos.com.br
- **Jurídico:** juridico@quironconcursos.com.br
- **Financeiro:** financeiro@quironconcursos.com.br

> ⚠️ **Importante:** Certifique-se de que esses e-mails existam e sejam monitorados.

## 🎨 Personalização

Para personalizar as páginas:

1. Edite os arquivos HTML diretamente
2. Modifique cores, textos e informações conforme necessário
3. Mantenha a estrutura legal intacta
4. Faça novo deploy após alterações

## 📱 Responsividade

Todas as páginas são totalmente responsivas e funcionam perfeitamente em:

- 📱 Smartphones
- 📱 Tablets
- 💻 Desktops
- 🖥️ Monitores grandes

## 🔐 Segurança

Headers de segurança configurados no `vercel.json`:

- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY
- X-XSS-Protection: 1; mode=block
- Referrer-Policy: strict-origin-when-cross-origin

## 📊 Analytics (Opcional)

Para adicionar Google Analytics:

1. Edite cada arquivo HTML
2. Adicione o script do GA antes do `</head>`
3. Configure no Google Analytics Console

## 🆘 Suporte

Se tiver problemas com o deploy:

- Documentação Vercel: https://vercel.com/docs
- Suporte Vercel: https://vercel.com/support

## 📄 Licença

© 2025 Quiron Concursos. Todos os direitos reservados.

---

**Última atualização:** 16 de Janeiro de 2026
