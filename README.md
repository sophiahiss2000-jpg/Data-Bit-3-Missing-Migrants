# Data-Bit-3-Sophia — The Deaths We Don't Count

> "For every death in the Mediterranean, there are at least two in the Sahara. Unknown and anonymous."
> — Alessandra Morelli, Head of UNHCR Niger

A data-driven editorial piece on migrant mortality in the Mediterranean and the Sahara Desert, built with SvelteKit and D3.js.

## Data

Source: [Missing Migrants Project](https://missingmigrants.iom.int) — International Organization for Migration (IOM), 2014–2024.

The R script `Q516_ArabBarometer.R` handles data cleaning and aggregation from the raw Excel file into `static/data/map_data_df.csv`.

## Development

```bash
npm install
npm run dev
```

Open [http://localhost:5173](http://localhost:5173).

## Build & Deploy

```bash
npm run build
```

This project deploys automatically to GitHub Pages via the workflow in `.github/workflows/deploy.yml` on every push to `main`.

> **Note:** If your repo is at `username.github.io/data-bit-3-sophia` (not a root domain), uncomment and set the `base` path in `svelte.config.js`:
> ```js
> base: process.env.NODE_ENV === 'production' ? '/data-bit-3-sophia' : ''
> ```

## Tech Stack

- [SvelteKit](https://kit.svelte.dev) with `@sveltejs/adapter-static`
- [D3.js](https://d3js.org) for the chart
- Playfair Display + DM Sans (Google Fonts)
- GitHub Pages for hosting

## License

Data: © IOM Missing Migrants Project. Code: MIT.
