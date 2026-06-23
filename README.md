# abogado809
plataforma de abogado dominicana para la operacion eficiente de todas las atividades que Este realize

Instalación y pruebas locales:

```
npm install
npm run dev
# o para probar build:
npm run build
```

Despliegue:
- Conecta el repositorio a Vercel (https://vercel.com) y el build se ejecutará automáticamente.
- Alternativa: usa GitHub Actions con el workflow en `.github/workflows/vercel-deploy.yml`.

Configuración de despliegue con GitHub Actions:
1. Crea los secretos del repositorio en GitHub:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`
2. Empuja cambios a `main`.
3. El workflow desplegará automáticamente a producción.

